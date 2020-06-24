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
    char* path;
    uuid_t id;
    struct timespec timestamp;
    unsigned int size;
} finfo;


list *local_files = NULL;
list *cached_files = NULL;
struct table* global_files;

list *yggdfs_file_list = NULL;
list *opened_files = NULL;

bool yggdfs_file_equal(void* f1, void* name) {
    yggdfs_file_info *fd = (yggdfs_file_info *) f1;
    char *n = (char *) name;

    if (strcmp(fd->path, n) == 0)
        return true;
    else
        return false;
}

int exec_get_attr(int socket, const char* path, int len) {
    return ;
}

int exec_open(int socket, const char* path, int len){
    yggdfs_file_info * elem = (yggdfs_file_info *) list_find_item(yggdfs_file_list, yggdfs_file_equal, (void*) path );
    if(elem == NULL) {
        //does not exists
        elem = (yggdfs_file_info*) malloc(sizeof(yggdfs_file_info));
        elem->path = (char*) malloc(len);
        memcpy(elem->path, path, len);
        elem->block_state = NULL;
        elem->block_state_len = 0;
        elem->open_count = 1;
        elem->update_time = 0;
        elem->version = 0;

        list_add_item_to_head(yggdfs_file_list, elem);
        list_add_item_to_head(opened_files, elem);

        return exec_get_attr(socket, path, len);
    } else {
        if(elem->open_count == 0) {
            list_add_item_to_head(opened_files, elem);
        }
        elem->open_count++;
    }

}


static void process_message(YggMessage *msg) {

}

static void process_request(YggRequest *req) {

}

static void process_timer(YggTimer *timer) {

}

static int exec_operation(int socket) {
    short op;

    if(readfully(socket, &op, sizeof(short)) == 0)
        return -1;

    int len;
    if(readfully(socket, &len, sizeof(int)) == 0) return -1;
    char path[len];
    if(readfully(socket, &path, len) == 0) return -1;

    switch (op) {
        case OPEN_REQ:
            return exec_open(socket, path, len);
            break;
        default:
            ;
    }
}

static void yggdfs_control_server_init() {
    int listen_socket = socket(AF_UNIX, SOCK_STREAM, 0);

    int sockets[N_OPER];
    for (int i = 0; i < N_OPER; i++)
        sockets[i] = -1;


    struct sockaddr_in address;
    bzero(&address, sizeof(struct sockaddr_in));
    address.sin_family = AF_UNIX;
    address.sin_addr.s_addr = htonl(INADDR_ANY);
    address.sin_port = htons(CONTROL_PORT);

    if (bind(listen_socket, (const struct sockaddr *) &address, sizeof(address)) == 0) {

        if (listen(listen_socket, 20) < 0) {
            perror("YGGDFS - Unable to setup listen on socket: ");
            return;
        }


        fd_set mask;
        FD_ZERO(&mask);

        int aux = listen_socket;
        FD_SET(listen_socket, &mask);

        for (int i = 0; i < N_OPER; i++) {
            if (sockets[i] > 0) {
                FD_SET(sockets[i], &mask);
                if (sockets[i] > aux)
                    aux = sockets[i];
            }
        }

        while (1) {

            int r = select(aux + 1, &mask, NULL, NULL, NULL);

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
        return;
    }
}

void init_db(char* rootdir){
    DIR *dir;
    struct dirent* dirent;
    struct stat inf;


    while ((dirent = readdir(dir)) != NULL){
        char* fullname = malloc(PATH_MAX * sizeof(char));
        strcat(strcat(strcpy(fullname, rootdir), "/" ), dirent->d_name);
        fullname = realloc(fullname, strlen(fullname) + 1);

        if(stat(fullname, &inf) != -1){
            finfo* file = malloc(sizeof(finfo));
            file->path = fullname;
            file->size = inf.st_size;
            file->timestamp = inf.st_atim;
            getmyId(file->id);
            list_add_item_to_tail(local_files, file);

            if(S_ISDIR(inf.st_mode) && strcmp(dirent-> d_name,".") != 0 && strcmp(dirent-> d_name,"..") != 0){
                init_db(fullname);
            }

        }
    }

}

int main(int argc, char *argv[]) {

    NetworkConfig *ntconf = defineWirelessNetworkConfig(TYPE, 11, 5, 1, "pis", "DFS");
    //Init ygg_runtime and protocols
    ygg_runtime_init(ntconf);

    batman_args *bargs = batman_args_init(false, false, 2, 0, 5, DEFAULT_BATMAN_WINDOW_SIZE, 3);
    registerProtocol(PROTO_ROUTING_BATMAN, batman_init, bargs);
    batman_args_destroy(bargs);

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
    pthread_t fuse_thread;
    void *fuse_args = yggdfs_fuse_args_init(argc, argv);
    pthread_create(&fuse_thread, NULL, (void *(*)(void *)) &yggdfs_fuse_init, fuse_args);

    //Start ygg_runtime
    ygg_runtime_start();

    global_files = createTable(500);
    local_files = list_init();
    cached_files = list_init();

    while (1) {
        queue_t_elem elem;
        queue_pop(inBox, &elem);
        switch (elem.type) {
            case YGG_MESSAGE:
                process_message(&elem.data.msg);
                break;
            case YGG_REQUEST:
                process_request(&elem.data.request);
                break;
            case YGG_TIMER:
                process_timer(&elem.data.timer);
            default:
                perror("Undisclosed event received");
                break;
        }
    }

    return 0;
}
