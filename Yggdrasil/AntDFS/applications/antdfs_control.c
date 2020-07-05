
#include <pthread.h>
#include <sys/stat.h>
#include <sys/time.h>

#include "antdfs_fuse.h"
#include "antdfs_utils.h"
#include "hashtable.h"
#include "antdfs_control.h"

#include "AntDFS/protocols/batman.h"
#include "AntDFS/protocols/discovery.h"
#include "AntDFS/protocols/reliable_dissemination.h"

#include "ygg_runtime.h"


pthread_mutex_t global_mutex;
unsigned int n_local;
list *local_files;
list *cached_files;

// Table mapping filename -> finfo
struct table *global_files;


typedef struct binfo_t {
    char state;
    list *waiting_fds;
} binfo;

static binfo *binfo_init(char state) {
    binfo *block = malloc(sizeof(binfo));
    block->state = state;
    block->waiting_fds = NULL;
    return block;
}

typedef struct finfo_t {
    uuid_t id;
    bool local;
    struct stat info;
    char *path;
    long n_blocks;
    binfo *blocks;
} finfo;

static finfo *finfo_init(uuid_t uid, bool local, char *path, struct stat info) {
    finfo *file = malloc(sizeof(finfo));
    memcpy(file->id, uid, sizeof(uuid_t));
    file->local = local;
    file->info = info;
    file->path = path;
    if (info.st_size > 0) {
        file->n_blocks = (info.st_size / 1000) + (info.st_size % 1000 > 0 ? 1 : 0);
        file->blocks = malloc(file->n_blocks * sizeof(binfo));
        for (int i = 0; i < file->n_blocks; i++) {
            file->blocks[i].state = B_MISSING;
            file->blocks[i].waiting_fds = list_init();
        }
    } else {
        file->n_blocks = 0;
        file->blocks = NULL;
    }
    return file;
}

static void finfo_destroy(finfo **file) {
    if ((*file) == NULL) {
        printf("Trying to destroy a null file\n");
        exit(1);
    }

    for (int i = 0; i < (*file)->n_blocks; i++) {
        binfo b = (*file)->blocks[i];
        if (b.waiting_fds != NULL) {
            while (b.waiting_fds->head) {
                list_remove_head(b.waiting_fds);
            }
            free(b.waiting_fds);
        }
    }

    if ((*file)->blocks) {
        free((*file)->blocks);
        (*file)->blocks = NULL;
    }

    free((*file)->path);
    free((*file));
    *file = NULL;
}

// virtual file descriptors
int vds_counter;
list *virtual_fds;
typedef struct vfdinfo_t {
    char *filename;
    int vfd;
    int socket;
} vfdinfo;

static bool equal_vfdinfo(vfdinfo *fdinfo, const int *fd) {
    return fdinfo->vfd == *fd;
}

static vfdinfo *vfdinfo_init(const char *filename, int vfd, int socket) {
    vfdinfo *vfdinfo = malloc(sizeof(vfdinfo));
    vfdinfo->vfd = vfd;
    vfdinfo->socket = socket;
    int len = strlen(filename) + 1;
    vfdinfo->filename = malloc(len);
    memcpy(vfdinfo->filename, filename, len - 1);
    memset(vfdinfo->filename + len, 0, 1);

    if (strcmp(vfdinfo->filename, filename) != 0)
        printf("DEBUG: vfdinfo ===========> is %s and should be %s\n", vfdinfo->filename, filename);
    return vfdinfo;
}

static void vfdinfo_destroy(vfdinfo *vfd) {
    free(vfd->filename);
    free(vfd);
}

// block requests
list *pending_requests;
typedef struct prinfo_t {
    char *filename;
    int n_block;
    time_t time_stamp;
} prinfo;

static bool equal_prinfo(prinfo *pr1, prinfo *pr2) {
    return strcmp(pr1->filename, pr2->filename) == 0 && pr1->n_block == pr2->n_block;
}

static prinfo *prinfo_init(const char *filename, int n_block) {
    prinfo *request = malloc(sizeof(prinfo));
    request->time_stamp = time(NULL);
    request->n_block = n_block;
    int len = strlen(filename) + 1;
    request->filename = malloc(len);
    memcpy(request->filename, filename, len - 1);
    memset(request->filename + len, 0, 1);

    if (strcmp(request->filename, filename) != 0)
        printf("DEBUG: prinfo ===========> is %s and should be %s\n", request->filename, filename);
    return request;
}


static void init_structs() {
    pthread_mutex_init(&global_mutex, NULL);

    global_files = table_create(500);
    local_files = list_init();
    n_local = 0;
    cached_files = list_init();

    vds_counter = 3;
    virtual_fds = list_init();

    pending_requests = list_init();
}

static int abeforeb(struct timespec a, struct timespec b) {
    if(a.tv_sec == b.tv_sec)
        return a.tv_nsec < b.tv_nsec;
    else
        return a.tv_sec < b.tv_sec;
}

static void create_empty_file(char *path, bool local, mode_t mode) {
    char completepath[500];
    bzero(completepath, 500);
    strcat(completepath, local ? LOCAL_FILES_LOC : REMOTE_FILES_LOC);
    strcat(completepath, path);
    if (open(completepath, O_CREAT, mode) == -1)
        perror("openat");
}

static void create_dir_relative(char *basedir, char *path, mode_t mode) {
    int max = (int) strlen(path);
    int index = 1;
    while (index < max) {
        while (index < max && path[index] != '/') {
            index++;
        }

        char tmp[index + 2];
        memcpy(tmp, path, index + 1);
        tmp[index + 1] = '\0';
        char completepath[500];
        bzero(completepath, 500);
        strcat(completepath, basedir);
        strcat(completepath, tmp);
        if (mkdir(completepath, mode) == -1)
            perror("mkdir");
        index++;
    }
}

static void create_dir(char *path, bool local, mode_t mode) {
    create_dir_relative(local ? LOCAL_FILES_LOC : REMOTE_FILES_LOC, path, mode);
    if (!local) {
        create_dir_relative(FETCHED_BLOCKS_LOC, path, mode);
    }
}

static char *getDir(const char *path) {
    int max = (int) strlen(path) - 1;
    while (max > 0 && path[max] != '/') {
        max--;
    }
    if (max == 0)
        return NULL;

    char *directory = malloc(max + 2);
    memcpy(directory, path, max + 1);
    directory[max + 1] = '\0';
    return directory;
}

//pre: fpath is not NULL
static int full2relative(char *path, const char *fpath, bool local) {
    bzero(path, PATH_MAX);

    int len = local ? strlen(LOCAL_FILES_LOC) : strlen(REMOTE_FILES_LOC);

    strcpy(path, fpath + len);

    char msg[500];
    sprintf(msg, "Converted from %s to %s", fpath, path);
    ygg_log("ANTDFS", "INFO", msg);

    return 0;
}

//pre: path is not NULL
static int relative2full(char *fpath, const char *path, bool local) {
    if (fpath[0] != '\0')
        bzero(fpath, PATH_MAX);
    strcat(fpath, local ? LOCAL_FILES_LOC : REMOTE_FILES_LOC);
    strcat(fpath, path);

    char msg[500];
    sprintf(msg, "Converted from %s to %s", path, fpath);
    ygg_log("ANTDFS", "INFO", msg);

    return 0;
}

static void register_dir_rec(char *rootdir, bool local) {
    DIR *dir = NULL;
    struct dirent *dirent;
    struct stat inf;

    if ((dir = opendir(rootdir)) == NULL) {
        printf("Failed opening %s", rootdir);
        exit(0);
    }

    while ((dirent = readdir(dir)) != NULL) {
        if (strcmp(dirent->d_name, ".") == 0 || strcmp(dirent->d_name, "..") == 0)
            continue;

        char *fullname = malloc(PATH_MAX);
        strcat(strcat(strcpy(fullname, rootdir), "/"), dirent->d_name);
        fullname = realloc(fullname, strlen(fullname) + 1);
        if (stat(fullname, &inf) != -1) {
            char *antdfs_path = malloc(PATH_MAX);
            bzero(antdfs_path, PATH_MAX);
            full2relative(antdfs_path, fullname, local);
            antdfs_path = realloc(antdfs_path, strlen(antdfs_path) + 1);

            uuid_t uid;
            getmyId(uid);
            finfo *file = finfo_init(uid, local, antdfs_path, inf);
            pthread_mutex_lock(&global_mutex);
            list_add_item_to_tail(local_files, file);
            n_local++;
            table_insert(global_files, antdfs_path, file);
            pthread_mutex_unlock(&global_mutex);

            if (S_ISDIR(inf.st_mode)) {
                create_dir(antdfs_path, false, inf.st_mode);
                register_dir_rec(fullname, local);
            } else {
                create_empty_file(antdfs_path, false, inf.st_mode);
            }

            free(fullname);
        }
    }

}

static unsigned short serialize_finfo(void **buf, finfo *f) {
    unsigned short path_len = strlen(f->path) + 1;
    unsigned short len = sizeof(short) + path_len;
    len += sizeof(struct stat);
    len += sizeof(short);
    *buf = malloc(len);
    char *ptr = *buf;
    memcpy(ptr, &len, sizeof(unsigned short));
    ptr += sizeof(unsigned short);
    memcpy(ptr, &path_len, sizeof(unsigned short));
    ptr += sizeof(unsigned short);
    memcpy(ptr, f->path, path_len);
    ptr += path_len;
    memcpy(ptr, &f->info, sizeof(struct stat));
    return len;
}

static unsigned short deserialize_finfo(uuid_t owner, YggMessage *msg, finfo **file, void **ptr, bool local) {
    unsigned short read = 0;

    unsigned short len;
    *ptr = YggMessage_readPayload(msg, *ptr, &len, sizeof(unsigned short));
    read += sizeof(unsigned short);
    unsigned short path_len;
    *ptr = YggMessage_readPayload(msg, *ptr, &path_len, sizeof(unsigned short));
    read += sizeof(unsigned short);
    char *path = malloc(path_len);
    *ptr = YggMessage_readPayload(msg, *ptr, path, path_len);
    read += path_len;
    struct stat info;
    *ptr = YggMessage_readPayload(msg, *ptr, &info, sizeof(struct stat));
    read += sizeof(struct stat);

    if (read != len)
        printf("ERROR: len should be %d and is %d\n", len, read);

    *file = finfo_init(owner, local, path, info);
    return read;
}

int exec_getattr(int socket, const char *path) {
    ygg_log("AntDFS", "INFO", "Executing getattr request");
    struct stat info;
    char fpath[PATH_MAX];
    int retstat = OP_REQ_SUCCESS;

    finfo *file = NULL;

    if (strcmp(path, "/") == 0) {
        sprintf(fpath, "%s", REMOTE_FILES_LOC);
        if (lstat(fpath, &info) < 0) {
            ygg_log("AntDFS", "INFO", "Failed executing lstat");
            retstat = OP_REQ_FAIL;
        }
    } else {
        file = (finfo *) table_lookup(global_files, path);
        if (file == NULL || file->local) {
            if( relative2full(fpath, path, file->local) < 0) {
                retstat = OP_REQ_FAIL;
                writefully(socket, &retstat, sizeof(int));
                return retstat;
            }
            if (lstat(fpath, &info) < 0) {
                ygg_log("AntDFS", "INFO", "Failed executing lstat");
                retstat = OP_REQ_FAIL;
            }
        } else {
            memcpy(&info, &(file->info), sizeof(struct stat));
        }
    }

    if (writefully(socket, &retstat, sizeof(int)) <= 0)
        return -1;

    if (retstat == OP_REQ_FAIL && writefully(socket, &errno, sizeof(int)) <= 0)
        return -1;

    if (retstat == OP_REQ_SUCCESS && writefully(socket, &info, sizeof(struct stat)) <= 0)
        return -1;

    return retstat;
}

int exec_opendir(int socket, const char *path) {
    ygg_log("AntDFS", "INFO", "Executing opendir request");
    DIR *dp;
    char fpath[PATH_MAX];
    int retstat = OP_REQ_SUCCESS;


    if (strcmp(path, "/") == 0) {
        sprintf(fpath, "%s", REMOTE_FILES_LOC);
    } else {

        finfo *file = (finfo *) table_lookup(global_files, path);

        //TODO: If file == NULL should get information about it now... and resume later...
        if (file == NULL || relative2full(fpath, path, file->local) < 0) {
            retstat = OP_REQ_FAIL;
            writefully(socket, &retstat, sizeof(int));
            return retstat;
        }
    }

    if ((dp = opendir(fpath)) == NULL) {
        ygg_log("AntDFS", "INFO", "Failed executing opendir");
        printf("DEBUG ======================> %s\n", fpath);
        retstat = OP_REQ_FAIL;
    }
    if (writefully(socket, &retstat, sizeof(int)) <= 0)
        return -1;

    if (retstat == OP_REQ_FAIL && writefully(socket, &errno, sizeof(int)) <= 0)
        return -1;

    if (retstat == OP_REQ_SUCCESS && writefully(socket, &dp, sizeof(DIR *)) <= 0)
        return -1;

    return retstat;
}

int exec_readdir(int socket, const char *path) {
    ygg_log("AntDFS", "INFO", "Executing readdir request");
    DIR *dp;
    int retstat = OP_REQ_SUCCESS;

    if (readfully(socket, &dp, sizeof(DIR *)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }
    struct dirent *de;
    de = readdir(dp);
    if (de == 0) {
        retstat = log_error("antdfs_readdir readdir\n");
    }

    int terminator = 0;
    do {
        int length = (int) strlen(de->d_name) + 1;
        if (writefully(socket, &length, sizeof(int)) <= 0)
            return -1;
        if (writefully(socket, de->d_name, length) <= 0)
            return -1;
    } while ((de = readdir(dp)) != NULL);

    if (writefully(socket, &terminator, sizeof(int)) <= 0)
        return -1;

    return retstat;
}

int exec_releasedir(int socket, const char *path) {
    ygg_log("AntDFS", "INFO", "Executing releasedir request");
    DIR *dp;
    int retstat = OP_REQ_SUCCESS;
    if (readfully(socket, &dp, sizeof(DIR *)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }
    if (closedir(dp) < 0) {
        ygg_log("AntDFS", "INFO", "Failed executing releasedir");
        retstat = OP_REQ_FAIL;
    }
    return retstat;
}

void request_block(const char *path, int blknum, const finfo *file, int *vfd) {
    printf("Requesting block %s:%d, for vfd %d\n", path, blknum, vfd == NULL ? 0 : *vfd);
    YggMessage msg;

    YggMessage_initBcast(&msg, CONTROL_ID);
    short msg_id = (short) FETCH_BLK_REQ_MSG;
    YggMessage_addPayload(&msg, (char *) &msg_id, sizeof(short));
    uuid_t myid;
    getmyId(myid);
    YggMessage_addPayload(&msg, (char *) myid, sizeof(uuid_t));
    int plen = (int) strlen(path) + 1;
    YggMessage_addPayload(&msg, (char *) &plen, sizeof(int));
    YggMessage_addPayload(&msg, (char *) path, plen);
    YggMessage_addPayload(&msg, (char *) &blknum, sizeof(int));
    request_specific_uuid_route_message(PROTO_ROUTING_BATMAN, &msg, file->id);

    prinfo *req_info = prinfo_init(path, blknum);
    list_add_item_to_tail(pending_requests, req_info);
    file->blocks[blknum].state = B_REQUESTED;
    if (vfd != NULL) {
        printf("Adding %d to waiting_fds of file %s block %d\n", *vfd, path, blknum);
        list_add_item_to_tail(file->blocks[blknum].waiting_fds, vfd);
    }

}

int exec_open(int socket, const char *path) {
    ygg_log("AntDFS", "INFO", "Executing open request");

    char fpath[PATH_MAX];
    int retstat = OP_REQ_SUCCESS;
    finfo *file = (finfo *) table_lookup(global_files, path);


    //TODO: If file == NULL should get information about it now... and resume later...
    if (file == NULL || relative2full(fpath, path, file->local) < 0) {
        retstat = OP_REQ_FAIL;
        errno = ENOENT;
    }
    if (retstat == OP_REQ_SUCCESS && S_ISDIR(file->info.st_mode)) {
        retstat = OP_REQ_FAIL;
        errno = EISDIR;
    }

    writefully(socket, &retstat, sizeof(int));
    if (retstat == OP_REQ_FAIL) {
        writefully(socket, &errno, sizeof(int));
        return retstat;
    }

    int fd = vds_counter++;
    vfdinfo *vfdinfo = vfdinfo_init(path, fd, 0);
    list_add_item_to_tail(virtual_fds, vfdinfo);

    if (file->n_blocks > 0) {
        request_block(path, 0, file, NULL);
    }

    return writefully(socket, &fd, sizeof(int)) <= 0 ? -1 : 0;
}

int exec_read(int socket, const char *path) {
    ygg_log("AntDFS", "INFO", "Executing read request");
    int virtualfd;
    int offset;
    unsigned int size;
    int retstat = OP_REQ_SUCCESS;
    int readsize = 0;

    if (readfully(socket, &virtualfd, sizeof(int)) <= 0) {
        errno = EFAULT;
        return -1;
    }
    if (readfully(socket, &offset, sizeof(int)) <= 0) {
        errno = EFAULT;
        return -1;
    }
    if (readfully(socket, &size, sizeof(unsigned int)) <= 0) {
        errno = EFAULT;
        return -1;
    }

    printf("Params %d %ld %ld\n", virtualfd, offset, size);

    finfo *file = table_lookup(global_files, path);
    vfdinfo *vfd = list_find_item(virtual_fds, (equal_function) equal_vfdinfo, (void *) &virtualfd);


    // file does not exist
    if (file == NULL) {
        retstat = OP_REQ_FAIL;
        int errstat = ENOENT;
        if (writefully(socket, &retstat, sizeof(int)) <= 0) return -1;
        if (writefully(socket, &errstat, sizeof(int)) <= 0) return -1;
        return retstat;
    }

    // invalid offset
    if (file->info.st_size < offset || offset < 0) {
        retstat = OP_REQ_FAIL;
        int errstat = EFAULT;
        if (writefully(socket, &retstat, sizeof(int)) <= 0) return -1;
        if (writefully(socket, &errstat, sizeof(int)) <= 0) return -1;
        return retstat;
    }

    // vfd refers to a directory
    if (S_ISDIR(file->info.st_mode)) {
        retstat = OP_REQ_FAIL;
        int errstat = EISDIR;
        if (writefully(socket, &retstat, sizeof(int)) <= 0) return -1;
        if (writefully(socket, &errstat, sizeof(int)) <= 0) return -1;
        return retstat;
    }

    // invalid file descriptor
    if (vfd == NULL) {
        retstat = OP_REQ_FAIL;
        int errstat = EBADF;
        if (writefully(socket, &retstat, sizeof(int)) <= 0) return -1;
        if (writefully(socket, &errstat, sizeof(int)) <= 0) return -1;
        return retstat;
    } else {
        vfd->socket = socket;
    }


    //Definir a estrutura com os blocos que precisas.

    //Se tiveres todos os blocos, invocas a função que responde com os dados pedidos

    //Se não começas a ir buscar blocos (invocas a função que vai pedir os próximos x blocos)
    if (file->local) {
        char fpath[PATH_MAX];
        if(relative2full(fpath, path, true) != 0) {
            retstat = OP_REQ_FAIL;
            errno = ENOENT;
        } else {
            int fd = open(fpath, O_RDONLY);
            if(fd > 0) {
                char buf[size];
                bzero(buf,size);
                readsize = read(fd, buf, size);
                if(readsize > 0) {
                    if (writefully(socket, &retstat, sizeof(int)) <= 0) return -1;
                    if (writefully(socket, &readsize, sizeof(int)) <= 0) return -1;
                    if (writefully(socket, buf, readsize) <= 0) return -1;
                    return retstat;
                } 
            }
            retstat = OP_REQ_FAIL;
            if (writefully(socket, &retstat, sizeof(int)) <= 0) return -1;
            if (writefully(socket, &errno, sizeof(int)) <= 0) return -1;
            return retstat;
        }
    } else {
        //TODO: the next line should not be here
        if (writefully(socket, &retstat, sizeof(int)) <= 0) return -1;

        if (true) { //only need 1 block
            int block = offset / B_SIZE;
            // send request
            request_block(path, block, file, &(vfd->vfd));
        } else {
            //TODO: need more blocks
            ygg_log("AntDFS", "ERROR", "More than one block required (not implemented)");
        }
    }

}

int exec_close(int socket, const char *path) {
    ygg_log("AntDFS", "INFO", "Executing close request");
    int virtualfd;
    int retstat = OP_REQ_SUCCESS;

    if (readfully(socket, &virtualfd, sizeof(int)) <= 0) {
        errno = EFAULT;
        return -1;
    }

    vfdinfo *vfd = list_remove_item(virtual_fds, (equal_function) equal_vfdinfo, &virtualfd);

    if (vfd != NULL) {
        vfdinfo_destroy(vfd);
    }

    printf(" ====> Sending anwser: %d\n", retstat);
    if (writefully(socket, &retstat, sizeof(int)) <= 0) {
        retstat = -1;
    }
    return retstat;
}

static void updateFileStats(struct stat *dest, struct stat *origin) {
    dest->st_dev = origin->st_dev;
    dest->st_ino = origin->st_ino;
    dest->st_rdev = origin->st_rdev;
    dest->st_uid = origin->st_uid;
}

static int exec_operation(int socket) {
    short op;
    if (readfully(socket, &op, sizeof(short)) <= 0)
        return -1;

    char msg[200];
    sprintf(msg, "Received operation request with code: %d", op);
    ygg_log("AntDFS", "INFO", msg);

    int len;
    if (readfully(socket, &len, sizeof(int)) <= 0) return -1;

    char path[len];
    bzero(path, len);
    if (readfully(socket, path, len) <= 0) return -1;


    switch (op) {
        case GETATTR_REQ:
            return exec_getattr(socket, path);
        case OPENDIR_REQ:
            return exec_opendir(socket, path);
        case READDIR_REQ:
            return exec_readdir(socket, path);
        case RELEASEDIR_REQ:
            return exec_releasedir(socket, path);
        case OPEN_REQ:
            return exec_open(socket, path);
        case READ_REQ:
            return exec_read(socket, path);
        case CLOSE_REQ:
            return exec_close(socket, path);
        default:
            sprintf(msg, "Undefined operation: %d", op);
            ygg_log("AntDFS", "ERROR", msg);
    }
    return -1;
}

static void control_server_init() {
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
            ygg_log("AntDFS", "ERROR", "Unable to setup listen on socket");
            exit(0);
        }

        ygg_log("AntDFS", "INFO", "Setting up select");

        fd_set mask;
        FD_ZERO(&mask);

        int aux = listen_socket;
        FD_SET(listen_socket, &mask);

        ygg_log("AntDFS", "INFO", "Setting up sockets");
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
                perror("failed select\n");
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
                    if (exec_operation(sockets[i]) == -1) {
                        FD_CLR(sockets[i], &mask);
                        close(sockets[i]);
                        sockets[i] = -1;
                    } else {
                        if (sockets[i] > aux)
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
        ygg_log("AntDFS", "ERROR", "Unable to bind on listen socket");
        exit(0);
    }
}

static void register_protos() {

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
}

static void fuse_fork_init(int argc, char *argv[]) {
    pid_t pid = fork();
    switch (pid) {
        case -1:
            ygg_log("AntDFS", "ERROR", "FUSE fork failed");
            exit(0);
        case 0:
            antdfs_fuse_init(argc, argv);
            ygg_log("AntDFS", "ERROR", "Failed executing FUSE");
            exit(0);
        default:
            ygg_log("AntDFS", "INFO", "Spawned FUSE process");
    }
}

static void create_internal_dirs() {
    int status;

    status = mkdir(REMOTE_FILES_LOC, S_IRWXU);
    if (status != 0 && errno != EEXIST) {
        perror("Failed creating internal remote directory");
        exit(0);
    }

    status = mkdir(LOCAL_FILES_LOC, S_IRWXU);
    if (status != 0 && errno != EEXIST) {
        perror("Failed creating internal local directory");
        exit(0);
    }

    status = mkdir(FETCHED_BLOCKS_LOC, S_IRWXU);
    if (status != 0 && errno != EEXIST) {
        perror("Failed creating internal block directory");
        exit(0);
    }

}

static void init_file_db() {
    create_internal_dirs();
    register_dir_rec(LOCAL_FILES_LOC, true);
}

void process_dissemination_msg(YggMessage *msg, uuid_t myid, unsigned int len, void *ptr) {
    uuid_t uid;
    ptr = YggMessage_readPayload(msg, ptr, uid, sizeof(uuid_t));
    len -= sizeof(uuid_t);

    char s1[40];
    char s2[40];
    bzero(s1, 40);
    bzero(s2, 40);
    uuid_unparse(myid, s1);
    uuid_unparse(uid, s2);

    bool myself = (uuid_compare(myid, uid) == 0);

    char fullpath[500];
    struct stat st;

    if (myself == false) {
        while (len > 0) {
            finfo *file;
            int bread = deserialize_finfo(uid, msg, &file, &ptr, myself);
            len -= bread;
            pthread_mutex_lock(&global_mutex);
            finfo *previous = table_lookup(global_files, file->path);
            if (previous == NULL) {
                list_add_item_to_head(cached_files, file);
                table_insert(global_files, file->path, file);
                if (S_ISDIR(file->info.st_mode)) {
                    create_dir(file->path, false, file->info.st_mode);
                    bzero(fullpath, 500);
                    relative2full(fullpath, file->path, false);
                    lstat(fullpath, &st);
                    updateFileStats(&file->info, &st);
                } else {
                    char *dir = getDir(file->path);
                    if (dir != NULL)
                        create_dir(dir, false, file->info.st_mode);
                    create_empty_file(file->path, false, file->info.st_mode);
                    bzero(fullpath, 500);
                    relative2full(fullpath, file->path, false);
                    lstat(fullpath, &st);
                    updateFileStats(&file->info, &st);
                }
            } else {
                if( abeforeb(previous->info.st_ctim, file->info.st_ctim) ) {
                    updateFileStats(&(file->info), &(previous->info));
                    previous->info = file->info;
                }
                finfo_destroy(&file);
                file = previous;
            }
            pthread_mutex_unlock(&global_mutex);
        }
    }
    YggMessage_freePayload(msg);
}

void process_fetch_blk_req_msg(YggMessage *msg, void *ptr) {

    uuid_t uuid;
    ptr = YggMessage_readPayload(msg, ptr, uuid, sizeof(uuid_t));
    int path_len;
    ptr = YggMessage_readPayload(msg, ptr, &path_len, sizeof(int));
    char path[path_len];
    ptr = YggMessage_readPayload(msg, ptr, path, path_len);
    int blknum;
    YggMessage_readPayload(msg, ptr, &blknum, sizeof(int));

    char buf[B_SIZE];
    char fpath[PATH_MAX];
    relative2full(fpath, path, true);
    printf(" ====== > Opening file %s for block %d < ======\n", fpath, blknum);
    int fd = open(fpath, O_RDONLY);
    if (fd < 0)
        perror("open");
    int seek = lseek(fd, blknum * B_SIZE, SEEK_SET);
    if (seek < 0)
        perror("lseek");
    int readbytes = read(fd, buf, B_SIZE);
    if (readbytes < 0)
        perror("read");
    close(fd);

    printf("Read %d bytes\n", readbytes);


    YggMessage reply;
    YggMessage_initBcast(&reply, CONTROL_ID);
    short msg_id = (short) FETCH_BLK_REP_MSG;
    YggMessage_addPayload(&reply, (char *) &msg_id, sizeof(short));
    YggMessage_addPayload(&reply, (char *) &path_len, sizeof(int));
    YggMessage_addPayload(&reply, (char *) &path, path_len);
    YggMessage_addPayload(&reply, (char *) &blknum, sizeof(int));
    YggMessage_addPayload(&reply, (char *) &readbytes, sizeof(int));
    if (readbytes > 0)
        YggMessage_addPayload(&reply, (char *) buf, readbytes);
    request_specific_uuid_route_message(PROTO_ROUTING_BATMAN, &reply, uuid);
}

void process_fetch_blk_rep_msg(YggMessage *msg, void *ptr) {
    ygg_log("AntDFS", "DEBUG", "Received block reply");

    int path_len;
    ptr = YggMessage_readPayload(msg, ptr, &path_len, sizeof(int));
    char path[path_len];
    ptr = YggMessage_readPayload(msg, ptr, path, path_len);
    int blknum;
    ptr = YggMessage_readPayload(msg, ptr, &blknum, sizeof(int));
    int readbytes;
    ptr = YggMessage_readPayload(msg, ptr, &readbytes, sizeof(int));
    char buf[readbytes + 1];
    bzero(buf, readbytes + 1);
    if (readbytes > 0)
        YggMessage_readPayload(msg, ptr, buf, readbytes);

    printf("Block %s:%d. Contents (size: %d): %s\n", path, blknum, readbytes, buf);

    finfo *file = table_lookup(global_files, path);
    list_item *it = NULL;

    while ((it = file->blocks[blknum].waiting_fds->head) != NULL) {
        vfdinfo *vfdinfo = list_find_item(virtual_fds, (equal_function) equal_vfdinfo, it->data);


        if (vfdinfo != NULL && vfdinfo->socket != 0) {
            printf("Sending block to vfd %d, socket %d\n", *((int *) (it->data)), vfdinfo->socket);
            writefully(vfdinfo->socket, &readbytes, sizeof(int));
            writefully(vfdinfo->socket, buf, readbytes);
        } else {
            printf("Warning: NULL vfdinfo\n");
        }

        file->blocks[blknum].waiting_fds->head = it->next;
        free(it);
    }
    file->blocks[blknum].waiting_fds->size = 0;
    file->blocks[blknum].waiting_fds->tail = NULL;
}

static void process_message(YggMessage *msg) {
    uuid_t myid;
    getmyId(myid);
    unsigned int len = msg->dataLen;

    short msg_id;
    void *ptr = YggMessage_readPayload(msg, NULL, &msg_id, sizeof(short));
    len -= sizeof(short);

    switch (msg_id) {
        case DISSEMINATION_MSG:
            printf("DEBUG =========================================> dissemination\n");
            process_dissemination_msg(msg, myid, len, ptr);
            break;
        case FETCH_BLK_REQ_MSG:
            printf("DEBUG =========================================> fetch req\n");
            process_fetch_blk_req_msg(msg, ptr);
            break;
        case FETCH_BLK_REP_MSG:
            process_fetch_blk_rep_msg(msg, ptr);
            break;
        default:
            ygg_log("AntDFS", "ERROR", "Undefined message type received");
    }

}

static void process_timer(YggTimer *timer) {
    YggRequest req;

    void *buf = NULL;
    unsigned short s = 0;
    uuid_t myid;
    getmyId(myid);

    pthread_mutex_lock(&global_mutex);
    list_item *it = local_files->head;
    while (it != NULL) {
        YggRequest_init(&req, CONTROL_ID, DISSEMINATION_ID, REQUEST, DISSEMINATION_REQUEST);
        unsigned short free_payload = 1400 - sizeof(uuid_t);
        short msg_id = (short) DISSEMINATION_MSG;
        YggRequest_addPayload(&req, &msg_id, sizeof(short));
        YggRequest_addPayload(&req, myid, sizeof(uuid_t));
        if (buf != NULL) {
            YggRequest_addPayload(&req, buf, s);
            free_payload -= s;
            free(buf);
            buf = NULL;
            it = it->next;
        }
        while (it != NULL) {
            s = serialize_finfo(&buf, it->data);
            if (s > free_payload)
                break;
            YggRequest_addPayload(&req, buf, s);
            free_payload -= s;
            free(buf);
            buf = NULL;
            it = it->next;
        }
        if (req.length > 0)
            deliverRequest(&req);
        YggRequest_freePayload(&req);

    }
    pthread_mutex_unlock(&global_mutex);

    YggTimer_freePayload(timer);
}


int main(int argc, char *argv[]) {

    init_structs();

    //Init ygg_runtime and protocols
    NetworkConfig *ntconf = defineWirelessNetworkConfig(TYPE, 13, 5, 1, "antdfs", "DFS");
    ygg_runtime_init(ntconf);
    register_protos();

    app_def *app = create_application_definition(CONTROL_ID, "Ant Distributed File System");
    queue_t *inBox = registerApp(app);

    YggTimer pull;
    YggTimer_init(&pull, CONTROL_ID, CONTROL_ID);
    YggTimer_set(&pull, 10, 0, 10, 0);
    setupTimer(&pull);

    //Start operation server
    pthread_t server_thread;
    pthread_create(&server_thread, NULL, (void *(*)(void *)) &control_server_init, NULL);

    // Launch a new thread to run the FUSE operations
    fuse_fork_init(argc, argv);

    // Init AntDFS file database
    init_file_db();

    //Start ygg_runtime
    ygg_runtime_start();


    while (1) {
        ygg_log("AntDFS", "INFO", "polling event queue");
        queue_t_elem elem;
        queue_pop(inBox, &elem);
        switch (elem.type) {
            case YGG_MESSAGE:
                ygg_log("AntDFS", "MESSAGE", "Message");
                process_message(&elem.data.msg);
                break;
            case YGG_REQUEST:
                ygg_log("AntDFS", "REQUEST", "Request: NOP");
                break;
            case YGG_TIMER:
                ygg_log("AntDFS", "TIMER", "Timer");
                process_timer(&elem.data.timer);
                break;
            default:
                ygg_log("AntDFS", "ERROR", "Undisclosed event received");
        }

    }
}


