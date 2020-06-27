/**
 * YggDFS only tracks files created by it
 * Files present in the mountpoint previous
 * to the mount call will be ignored
 */

#include "yggdfs.h"

#include "yggdfs_fuse.h"
#include "yggdfs_utils.h"
#include "hashtable.h"
#include "yggdfs_control_info.h"

#include "ygg_runtime.h"
#include "YggDFS/protocols/batman.h"

#include <pthread.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <YggDFS/protocols/discovery.h>
#include <YggDFS/protocols/reliable_dissemination.h>

#define TYPE "AdHoc"

#define B_ABSENT 'A'
#define B_DIRTY 'D'
#define B_PRESENT 'P'
#define B_NEW 'N'
#define B_DELETED 'L'
#define B_EMPTY 'E'

typedef struct yggdfs_file_info_t {
    struct stat stat;
    char *path;
    char *block_state;
    int block_state_len;
    short open_count;
    long update_time;
    long version;
} yggdfs_file_info;

typedef struct finfo_t{
    uuid_t id;
    bool local;
    char* path;
    unsigned int size;
    struct stat info;
    struct timespec timestamp;
} finfo;


pthread_mutex_t global_mutex;
list *local_files = NULL;
unsigned int n_local;
list *cached_files = NULL;
struct table* global_files;

list *yggdfs_file_list = NULL;
list *opened_files = NULL;

bool yggdfs_file_equal(void* f1, void* name) {
    yggdfs_file_info *fd = (yggdfs_file_info *) f1;
    char *n = (char *) name;

    if (strcmp(fd->path, n) == 0)
        return true;

    return false;
}

static void full2yggdfs_path(char* path, const char* fullpath, const char* yggdfs_dir){
    strcpy(path, fullpath + strlen(yggdfs_dir));
}

static int yggdfs2full_path(char *fpath, const char *path){
    bzero(fpath, PATH_MAX);
    pthread_mutex_lock(&global_mutex);
    finfo* file = (finfo*) table_lookup(global_files, path);
    pthread_mutex_unlock(&global_mutex);

    if(file == NULL)
        return -1;

    if(file->local)
        strcpy(fpath, YGGDFS_STATE->rootdir);
    else
        strcpy(fpath, YGGDFS_STATE->cachedir);

    strncat(fpath, path, PATH_MAX); // ridiculously long paths will break here

    return 0;
}

int exec_getattr(int socket, const char* path, int len) {
    printf("--------- exec_getattr");
    finfo* file = (finfo*) table_lookup(global_files, path);
    char fpath[PATH_MAX];

    if(file == NULL || yggdfs2full_path(fpath, path) != 0 ){
        int retstat = -1;
        writefully(socket, &retstat, sizeof(int));
        return retstat;
    }

    struct stat *info;
    if(lstat(fpath, info) < 0)
        return 0;

    if(writefully(socket, info, sizeof(struct stat)) > 0)
        return -1;

    return 0;
}

int exec_open(int socket, char* path, int len){
//    yggdfs_file_info * elem = (yggdfs_file_info *) list_find_item(yggdfs_file_list, yggdfs_file_equal, (void*) path );
//    if(elem == NULL) {
//        //does not exists
//        elem = (yggdfs_file_info*) malloc(sizeof(yggdfs_file_info));
//        elem->path = (char*) malloc(len);
//        memcpy(elem->path, path, len);
//        elem->block_state = NULL;
//        elem->block_state_len = 0;
//        elem->open_count = 1;
//        elem->update_time = 0;
//        elem->version = 0;
//
//        list_add_item_to_head(yggdfs_file_list, elem);
//        list_add_item_to_head(opened_files, elem);
//
//        return exec_getattr(socket, path, len);
//    } else {
//        if(elem->open_count == 0) {
//            list_add_item_to_head(opened_files, elem);
//        }
//        elem->open_count++;
//    }
}

static void process_message(YggMessage *msg){
    unsigned int n_files;
    void* ptr = YggMessage_readPayload(msg, NULL, &n_files, sizeof(unsigned int));

    pthread_mutex_lock(&global_mutex);
    for(int i = 0; i < n_files; i++){
        finfo* temp;
        ptr = YggMessage_readPayload(msg, ptr, temp, sizeof(finfo));
        list_add_item_to_head(cached_files, temp);
        table_insert(global_files, temp->path ,temp);
    }
    pthread_mutex_unlock(&global_mutex);
}

static void process_request(YggRequest *req) {

}

static void process_timer(YggTimer *timer) {
    YggRequest req;
    YggRequest_init(&req,CONTROL_ID, DISSEMINATION_ID, REQUEST,DISSEMINATION_REQUEST);

    pthread_mutex_lock(&global_mutex);
    YggRequest_addPayload(&req, &n_local, sizeof(unsigned int));
    for(list_item* it = local_files->head; it != NULL; it = it->next)
        YggRequest_addPayload(&req, it->data, sizeof(finfo));
    pthread_mutex_unlock(&global_mutex);

    deliverRequest(&req);
    YggRequest_freePayload(&req);
}

static int exec_operation(int socket) {
    short op;

    if(readfully(socket, &op, sizeof(short)) > 0)
        return -1;

    int len;
    if(readfully(socket, &len, sizeof(int)) > 0) return -1;
    char path[len];
    if(readfully(socket, &path, len) > 0) return -1;

    switch (op) {
        case OPEN_REQ:
            return exec_open(socket, path, len);
        case GETATTR_REQ:
            return exec_getattr(socket, path, len);
        default:
            ;
    }
}

static void yggdfs_control_server_init() {
    int listen_socket = socket(AF_INET, SOCK_STREAM, 0);

    int sockets[N_OPER];
    for (int i = 0; i < N_OPER; i++)
        sockets[i] = -1;

    struct sockaddr_in address;
    bzero(&address, sizeof(struct sockaddr_in));
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = htonl(INADDR_ANY);
    address.sin_port = htons(CONTROL_PORT);

    if (bind(listen_socket, (const struct sockaddr *) &address, sizeof(address)) == 0) {

        if (listen(listen_socket, 20) < 0) {
            perror("YGGDFS - Unable to setup listen on socket");
            exit(0);
        }

        printf("Setting up select\n");

        fd_set mask;
        FD_ZERO(&mask);

        int aux = listen_socket;
        FD_SET(listen_socket, &mask);

        printf("Setting up sockets\n");
        for (int i = 0; i < N_OPER; i++) {
            if (sockets[i] > 0) {
                FD_SET(sockets[i], &mask);
                if (sockets[i] > aux)
                    aux = sockets[i];
            }
        }

        while (1) {
            printf("server cycle\n");
            int r = select(aux + 1, &mask, NULL, NULL, NULL);
            printf("select returned: %d\n", r);
            if (r < 0) {
                perror("failed select");
                exit(1);
            }

            aux = listen_socket;
            if (FD_ISSET(listen_socket, &mask)) {
                //Main control cycle... we handle a single client each time...
                bzero(&address, sizeof(struct sockaddr_in));
                unsigned int length = sizeof(struct sockaddr_in);
                int client_socket = accept(listen_socket, (struct sockaddr *) &address, &length);
                for (int i = 0; i < N_OPER; i++) {
                    if (sockets[i] == -1) {
                        sockets[i] = client_socket;
                        break;
                    }
                }
            } else
                FD_SET(listen_socket, &mask);

            for (int i = 0; i < N_OPER; i++) {
                if (sockets[i] == -1)
                    continue;
                if (FD_ISSET(sockets[i], &mask)) {
                    if(exec_operation(sockets[i]) == -1){
                        FD_CLR(sockets[i], &mask);
                        close(sockets[i]);
                        sockets[i] = -1;
                    } else {
                        if(sockets[i] > aux)
                            aux = sockets[i];
                    }
                } else {
                    FD_SET(sockets[i], &mask);
                    if (sockets[i] > aux)
                        aux = sockets[i];
                }
            }


        }

    } else {
        perror("YGGDFS - Unable to bind on listen socket: ");
        exit(0);
    }
}

void register_localdir_rec(char* rootdir){
    DIR *dir = NULL;
    struct dirent* dirent;
    struct stat inf;

    if((dir = opendir(rootdir)) == NULL){
        perror("opendir");
        exit(0);
    }

    while ((dirent = readdir(dir)) != NULL){
        char* fullname = malloc(PATH_MAX * sizeof(char));
        strcat(strcat(strcpy(fullname, rootdir), "/" ), dirent->d_name);
        fullname = realloc(fullname, strlen(fullname) + 1);

        if(stat(fullname, &inf) != -1){
            finfo* file = malloc(sizeof(finfo));
            file->local = true;
            file->size = inf.st_size;
            file->timestamp = inf.st_atim;

            full2yggdfs_path(file->path, fullname, YGGDFS_STATE->rootdir);
            printf("Registering %s\n", file->path);
            lstat(fullname, &file->info);
            getmyId(file->id);
            pthread_mutex_lock(&global_mutex);
            list_add_item_to_tail(local_files, file);
            n_local++;
            table_insert(global_files, fullname, file);
            pthread_mutex_unlock(&global_mutex);
            if(S_ISDIR(inf.st_mode) && strcmp(dirent-> d_name,".") != 0 && strcmp(dirent-> d_name,"..") != 0){
                register_localdir_rec(fullname);
            }

        }
    }

}

int main(int argc, char *argv[]) {

    NetworkConfig *ntconf = defineWirelessNetworkConfig(TYPE, 11, 5, 1, "pis", "DFS");
    //Init ygg_runtime and protocols
    ygg_runtime_init(ntconf);

    /*batman_args *bargs = batman_args_init(false, false, 2, 0, 5, DEFAULT_BATMAN_WINDOW_SIZE, 3);
    registerProtocol(PROTO_ROUTING_BATMAN, batman_init, bargs);
    batman_args_destroy(bargs);*/

    //Register discovery
    discovery_args discoveryArgs = {
            .proto_id = DISCOV_ID,
            .announce_period_s = 2,
            .announce_period_ns = 0
    };
    registerProtocol(discoveryArgs.proto_id, (Proto_init) discovery_init, &discoveryArgs);

    //Register dissemination
    reliable_dissemination_args reliableDisseminationArgs = {
            .proto_id = DISSEMINATION_ID,
            .discov_proto_id = DISCOV_ID,
            .expiration = 1000,
            .timeout_s = 0,
            .timeout_ns = 500 * 1000 * 1000
    };
    registerProtocol(reliableDisseminationArgs.proto_id,
                     (Proto_init) reliable_dissemination_init, &reliableDisseminationArgs);

    app_def *app = create_application_definition(CONTROL_ID, "Yggdrasil Distributed File System");
    queue_t *inBox = registerApp(app);

    YggTimer pull;
    YggTimer_init(&pull, CONTROL_ID, CONTROL_ID);
    YggTimer_set(&pull, 500, 0,
                 500, 0);
    setupTimer(&pull);

    //Start operation server
    pthread_t server_thread;
    pthread_create(&server_thread, NULL, (void *(*)(void *)) &yggdfs_control_server_init, NULL);

    // Launch a new thread to run the FUSE operations
    pid_t pid = fork();

    if(pid == -1){
        perror("Fork failed\n");
        exit(0);
    }

    if(pid == 0){
        void *fuse_args = yggdfs_fuse_args_init(argc, argv);
        yggdfs_fuse_init(fuse_args);
        perror("Failed FUSE init\n");
        exit(0);
    } else {
        printf("Spawned: %d\n", pid);
    }

    register_localdir_rec(argv[argc-1]);

    //Start ygg_runtime
    ygg_runtime_start();

    pthread_mutex_init(&global_mutex, NULL);
    global_files = table_create(500);
    local_files = list_init();
    n_local = 0;
    cached_files = list_init();

    while (1) {
        printf("--------- main cycle\n");
        queue_t_elem elem;
        printf("--------- pop\n");
        queue_pop(inBox, &elem);
        printf("---------\n");
        switch (elem.type) {
            case YGG_MESSAGE:
                printf("--------- Message\n");
                process_message(&elem.data.msg);
                break;
            case YGG_REQUEST:
                printf("--------- Request\n");
                process_request(&elem.data.request);
                break;
            case YGG_TIMER:
                printf("--------- Timer\n");
                process_timer(&elem.data.timer);
                break;
            default:
                perror("Undisclosed event received");
                break;
        }
        printf("--------- end cycle\n");
    }

    printf("--------- Termination\n");
    return 0;
}
