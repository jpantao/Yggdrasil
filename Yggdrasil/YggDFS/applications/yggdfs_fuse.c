//
// Created by jpantao on 6/10/20.
//

#include "yggdfs_fuse.h"

static void fullpath(char *fpath, const char *path){
    bzero(fpath, PATH_MAX);
    strcpy(fpath, YGGDFS_STATE->rootdir);
    strncat(fpath, path, PATH_MAX); // ridiculously long paths will
				    // break here

    log_msg("    fullpath:  rootdir = \"%s\", path = \"%s\", fpath = \"%s\"\n",
	    YGGDFS_STATE->rootdir, path, fpath);
}

static void usage(){
    fprintf(stderr, "usage:  YggDFS [FUSE and mount options] cachedir rootdir mountpoint\n\n");
    abort();
}

static void ifn_init_socket(int* sock, struct sockaddr_in* addr){
    log_msg("\nFUSE connecting to Yggdrasil\n");
    if(*sock != 0){
        log_msg("FUSE already connected\n");
        return;
    }

    log_msg("FUSE initializing client sock\n");
    *sock =  socket(AF_INET, SOCK_STREAM, 0);

    bzero(addr, sizeof(struct sockaddr_in));
    addr->sin_family = AF_INET;
    inet_aton(LOCAL_ADDR, &addr->sin_addr);
    addr->sin_port = htons(CONTROL_PORT);

    int success = connect(*sock, (const struct sockaddr*) addr, sizeof(struct sockaddr_in));
    if (success == 0)
        log_msg("FUSE connected to Yggdrasil\n");
    else
        log_msg("FUSE failed to connect to Yggdrasil\n");
}

int yggdfs_getattr(const char *path, struct stat *statbuf){
    log_msg("\nexecuting getattr %s\n", path);

    static int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("\nsending req code\n");
    // Sending operation code
    short data = GETATTR_REQ;
    if(writefully(sock, &data, sizeof(short)) > 0)
        return -1;

    log_msg("sending path length\n");
    // Sending path length
    data = (short) (strlen(path) + 1);
    if(writefully(sock, &data, sizeof(short)) > 0)
        return -1;

    // Sending path
    log_msg("sending path\n");
    if(writefully(sock, (char*)path, data) > 0)
        return -1;

    log_msg("receiving  retstat\n");
    // Receiving operation return status
    int retstat;
    if(readfully(sock, &retstat, sizeof(int)) > 0)
        return -1;

    log_msg("retstat: %s\n", retstat);
    // If OK receive stat
    if (retstat != 0 || readfully(sock, statbuf, sizeof(struct stat)) > 0)
        return -1;

    log_msg("\nyggdfs_getattr(path=\"%s\", statbuf=0x%08x)\n", path, statbuf);
    log_stat(statbuf);
    return  log_syscall("lstat", retstat, 0);;
}

int yggdfs_readlink(const char *path, char *link, size_t size){
    int retstat;
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_readlink(path=\"%s\", link=\"%s\", size=%d)\n",
	  path, link, size);
    fullpath(fpath, path);

    retstat = log_syscall("readlink", readlink(fpath, link, size - 1), 0);
    if (retstat >= 0) {
        link[retstat] = '\0';
        retstat = 0;
        log_msg("    link=\"%s\"\n", link);
    }
    
    return retstat;
}

int yggdfs_mknod(const char *path, mode_t mode, dev_t dev){
    int retstat;
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_mknod(path=\"%s\", mode=0%3o, dev=%lld)\n",
	  path, mode, dev);
    fullpath(fpath, path);
    
    // On Linux this could just be 'mknod(path, mode, dev)' but this
    // tries to be be more portable by honoring the quote in the Linux
    // mknod man page stating the only portable use of mknod() is to
    // make a fifo, but saying it should never actually be used for
    // that.
    if (S_ISREG(mode)) {
	retstat = log_syscall("open", open(fpath, O_CREAT | O_EXCL | O_WRONLY, mode), 0);
	if (retstat >= 0)
	    retstat = log_syscall("close", close(retstat), 0);
    } else
	if (S_ISFIFO(mode))
	    retstat = log_syscall("mkfifo", mkfifo(fpath, mode), 0);
	else
	    retstat = log_syscall("mknod", mknod(fpath, mode, dev), 0);
    
    return retstat;
}

int yggdfs_mkdir(const char *path, mode_t mode){
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_mkdir(path=\"%s\", mode=0%3o)\n",
	    path, mode);
    fullpath(fpath, path);

    return log_syscall("mkdir", mkdir(fpath, mode), 0);
}

int yggdfs_unlink(const char *path){
    log_msg("executing unlink %s\n", path);
    char fpath[PATH_MAX];
    
    log_msg("yggdfs_unlink(path=\"%s\")\n",
	    path);
    fullpath(fpath, path);

    return log_syscall("unlink", unlink(fpath), 0);
}

int yggdfs_rmdir(const char* path){
     char fpath[PATH_MAX];
    
    log_msg("yggdfs_rmdir(path=\"%s\")\n",
	    path);
    fullpath(fpath, path);

    return log_syscall("rmdir", rmdir(fpath), 0);
}

int yggdfs_symlink(const char *path, const char *link){
    char flink[PATH_MAX];
    
    log_msg("\nyggdfs_symlink(path=\"%s\", link=\"%s\")\n",
	    path, link);
    fullpath(flink, link);

    return log_syscall("symlink", symlink(path, flink), 0);
}

int yggdfs_rename(const char *path, const char *newpath){
    char fpath[PATH_MAX];
    char fnewpath[PATH_MAX];
    
    log_msg("\nyggdfs_rename(fpath=\"%s\", newpath=\"%s\")\n",
	    path, newpath);
    fullpath(fpath, path);
    fullpath(fnewpath, newpath);

    return log_syscall("rename", rename(fpath, fnewpath), 0);
}

int yggdfs_link(const char *path, const char *newpath){
    char fpath[PATH_MAX], fnewpath[PATH_MAX];
    
    log_msg("\nyggdfs_link(path=\"%s\", newpath=\"%s\")\n",
	    path, newpath);
    fullpath(fpath, path);
    fullpath(fnewpath, newpath);

    return log_syscall("link", link(fpath, fnewpath), 0);
}

int yggdfs_chmod(const char *path, mode_t mode){
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_chmod(fpath=\"%s\", mode=0%03o)\n",
	    path, mode);
    fullpath(fpath, path);

    return log_syscall("chmod", chmod(fpath, mode), 0);
}

int yggdfs_chown(const char *path, uid_t uid, gid_t gid){
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_chown(path=\"%s\", uid=%d, gid=%d)\n",
	    path, uid, gid);
    fullpath(fpath, path);

    return log_syscall("chown", chown(fpath, uid, gid), 0);
}

int yggdfs_truncate(const char *path, off_t newsize){
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_truncate(path=\"%s\", newsize=%lld)\n",
	    path, newsize);
    fullpath(fpath, path);

    return log_syscall("truncate", truncate(fpath, newsize), 0);
}

int yggdfs_utime(const char *path, struct utimbuf *ubuf){
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_utime(path=\"%s\", ubuf=0x%08x)\n",
	    path, ubuf);
    fullpath(fpath, path);

    return log_syscall("utime", utime(fpath, ubuf), 0);
}

int yggdfs_open(const char *path, struct fuse_file_info *fi){
    int retstat = 0;
    int fd;
    char fpath[PATH_MAX];



    log_msg("\nyggdfs_open(path\"%s\", fi=0x%08x)\n",
            path, fi);
    fullpath(fpath, path);

    static int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    short data = OPEN_REQ;
    writefully(sock, &data, sizeof(short));

    data = (short) (strlen(fpath) + 1);
    writefully(sock, &data, sizeof(short));
    writefully(sock, fpath, data);


    // if the open call succeeds, my retstat is the file descriptor,
    // else it's -errno.  I'm making sure that in that case the saved
    // file descriptor is exactly -1.
    fd = log_syscall("open", open(fpath, fi->flags), 0);
    if (fd < 0)
	retstat = log_error("open\n");
	
    fi->fh = fd;

    log_fi(fi);
    
    return retstat;
}

int yggdfs_read(const char *path, char *buf, size_t size, off_t offset, struct fuse_file_info *fi){
    log_msg("\nyggdfs_read(path=\"%s\", buf=0x%08x, size=%d, offset=%lld, fi=0x%08x)\n",
	    path, buf, size, offset, fi);
    // no need to get fpath on this one, since I work from fi->fh not the path
    log_fi(fi);

    return log_syscall("pread", pread(fi->fh, buf, size, offset), 0);
}

int yggdfs_write(const char *path, const char *buf, size_t size, off_t offset, struct fuse_file_info *fi){
    log_msg("\nyggdfs_write(path=\"%s\", buf=0x%08x, size=%d, offset=%lld, fi=0x%08x)\n",
	    path, buf, size, offset, fi
	    );
    // no need to get fpath on this one, since I work from fi->fh not the path
    log_fi(fi);

//    YggRequest req;
//    YggRequest_init(&req, )

    return log_syscall("pwrite", pwrite(fi->fh, buf, size, offset), 0);
}

int yggdfs_statfs(const char *path, struct statvfs *statv){
    int retstat = 0;
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_statfs(path=\"%s\", statv=0x%08x)\n",
	    path, statv);
    fullpath(fpath, path);
    
    // get stats for underlying filesystem
    retstat = log_syscall("statvfs", statvfs(fpath, statv), 0);
    
    log_statvfs(statv);
    
    return retstat;
}

int yggdfs_flush(const char *path, struct fuse_file_info *fi){
    log_msg("\nyggdfs_flush(path=\"%s\", fi=0x%08x)\n", path, fi);
    // no need to get fpath on this one, since I work from fi->fh not the path
    log_fi(fi);
	
    return 0;
}

int yggdfs_release(const char *path, struct fuse_file_info *fi){
    log_msg("\nyggdfs_release(path=\"%s\", fi=0x%08x)\n", path, fi);
    log_fi(fi);

    // We need to close the file.  Had we allocated any resources
    // (buffers etc) we'd need to free them here as well.
    return log_syscall("close", close(fi->fh), 0);
}

int yggdfs_fsync(const char *path, int datasync, struct fuse_file_info *fi){
    log_msg("\nyggdfs_fsync(path=\"%s\", datasync=%d, fi=0x%08x)\n",
	    path, datasync, fi);
    log_fi(fi);
    
	return log_syscall("fsync", fsync(fi->fh), 0);
}

int yggdfs_opendir(const char *path, struct fuse_file_info *fi){
    DIR *dp;
    int retstat = 0;
    char fpath[PATH_MAX];
    
    log_msg("\nyggdfs_opendir(path=\"%s\", fi=0x%08x)\n",
	  path, fi);
    fullpath(fpath, path);

    // since opendir returns a pointer, takes some custom handling of
    // return status.
    dp = opendir(fpath);
    log_msg("    opendir returned 0x%p\n", dp);
    if (dp == NULL)
	retstat = log_error("yggdfs_opendir opendir\n");
    
    fi->fh = (intptr_t) dp;
    
    log_fi(fi);
    
    return retstat;
}

int yggdfs_readdir(const char *path, void *buf, fuse_fill_dir_t filler, off_t offset, struct fuse_file_info *fi){
    int retstat = 0;
    DIR *dp;
    struct dirent *de;
    
    log_msg("\nyggdfs_readdir(path=\"%s\", buf=0x%08x, filler=0x%08x, offset=%lld, fi=0x%08x)\n",
	    path, buf, filler, offset, fi);
    // once again, no need for fullpath -- but note that I need to cast fi->fh
    dp = (DIR *) (uintptr_t) fi->fh;

    // Every directory contains at least two entries: . and ..  If my
    // first call to the system readdir() returns NULL I've got an
    // error; near as I can tell, that's the only condition under
    // which I can get an error from readdir()
    de = readdir(dp);
    log_msg("    readdir returned 0x%p\n", de);
    if (de == 0) {
	    retstat = log_error("yggdfs_readdir readdir\n");
	    return retstat;
    }

    // This will copy the entire directory into the buffer.  The loop exits
    // when either the system readdir() returns NULL, or filler()
    // returns something non-zero.  The first case just means I've
    // read the whole directory; the second means the buffer is full.
    do {
	    log_msg("calling filler with name %s\n", de->d_name);
	    if (filler(buf, de->d_name, NULL, 0) != 0) {
	        log_msg("    ERROR yggdfs_readdir filler:  buffer full\n");
	        return -ENOMEM;
	    }
    } while ((de = readdir(dp)) != NULL);
    
    log_fi(fi);
    
    return retstat;
}

int yggdfs_releasedir(const char *path, struct fuse_file_info *fi){
     int retstat = 0;
    
    log_msg("\nyggdfs_releasedir(path=\"%s\", fi=0x%08x)\n",
	    path, fi);
    log_fi(fi);
    
    closedir((DIR *) (uintptr_t) fi->fh);
    
    return retstat;
}

int yggdfs_fsyncdir(const char *path, int datasync, struct fuse_file_info *fi){
    int retstat = 0;
    
    log_msg("\nyggdfs_fsyncdir(path=\"%s\", datasync=%d, fi=0x%08x)\n",
	    path, datasync, fi);
    log_fi(fi);
    
    return retstat;
}

void yggdfs_destroy(void *userdata){
    log_msg("\nyggdfs_destroy(userdata=0x%08x)\n", userdata);
}


int yggdfs_access(const char *path, int mask){
    int retstat = 0;
    char fpath[PATH_MAX];
   
    log_msg("\nyggdfs_access(path=\"%s\", mask=0%o)\n",
	    path, mask);
    fullpath(fpath, path);
    
    retstat = access(fpath, mask);

    if (retstat < 0)
	retstat = log_error("yggdfs_access access\n");
    
    return retstat;
}

int yggdfs_ftruncate(const char *path, off_t offset, struct fuse_file_info *fi){

    int retstat = 0;
    
    log_msg("\nyggdfs_ftruncate(path=\"%s\", offset=%lld, fi=0x%08x)\n",
	    path, offset, fi);
    log_fi(fi);
    
    retstat = ftruncate(fi->fh, offset);
    if (retstat < 0)
	retstat = log_error("yggdfs_ftruncate ftruncate\n");
    
    return retstat;
}

int yggdfs_fgetattr(const char *path, struct stat *statbuf, struct fuse_file_info *fi){
    int retstat = 0;
    
    log_msg("\nyggdfs_fgetattr(path=\"%s\", statbuf=0x%08x, fi=0x%08x)\n",
	    path, statbuf, fi);
    log_fi(fi);

    // On FreeBSD, trying to do anything with the mountpoint ends up
    // opening it, and then using the FD for an fgetattr.  So in the
    // special case of a path of "/", I need to do a getattr on the
    // underlying root directory instead of doing the fgetattr().
    if (!strcmp(path, "/"))
	    return yggdfs_getattr(path, statbuf);
    
    retstat = fstat(fi->fh, statbuf);
    if (retstat < 0)
	retstat = log_error("yggdfs_fgetattr fstat\n");
    
    log_stat(statbuf);
    
    return retstat;
}

void *yggdfs_init(struct fuse_conn_info *conn){
    log_msg("\nyggdfs_init()\n");

    log_conn(conn);
    log_fuse_context(fuse_get_context());
    
    return YGGDFS_STATE;
}


static struct fuse_operations yggdfs_oper = {
        .getattr = yggdfs_getattr,
        .readlink = yggdfs_readlink,
        .mknod = yggdfs_mknod,
        .mkdir = yggdfs_mkdir,
        .unlink = yggdfs_unlink,
        .rmdir = yggdfs_rmdir,
        .symlink = yggdfs_symlink,
        .rename = yggdfs_rename,
        .link = yggdfs_link,
        .chmod = yggdfs_chmod,
        .chown = yggdfs_chown,
        .truncate = yggdfs_truncate,
        .utime = yggdfs_utime,
        .open = yggdfs_open,
        .read = yggdfs_read,
        .write = yggdfs_write,
        .statfs = yggdfs_statfs,
        .flush = yggdfs_flush,
        .release = yggdfs_release,
        .fsync = yggdfs_fsync,
        .opendir = yggdfs_opendir,
        .readdir = yggdfs_readdir,
        .releasedir = yggdfs_releasedir,
        .fsyncdir = yggdfs_fsyncdir,
        .destroy = yggdfs_destroy,
        .access = yggdfs_access,
        .ftruncate = yggdfs_ftruncate,
        .fgetattr = yggdfs_fgetattr,
        .init = yggdfs_init
};

void yggdfs_fuse_init(yggdfs_fuse_args *args){
    // See which version of fuse we're running
    fprintf(stderr, "Fuse library version %d.%d\n", FUSE_MAJOR_VERSION, FUSE_MINOR_VERSION);
    
    // Parse arguments
    yggdfs_state* state = args->state;
    int   argc = args->argc;
    char **argv = args->argv;

    // Passing control over to FUSE
    fprintf(stderr, "mountdir: %s\n", argv[argc-1]);
    fprintf(stderr, "rootdir:  %s\n", state->rootdir);
    fprintf(stderr, "cachedir: %s\n", state->cachedir);

    fuse_main(argc, argv, &yggdfs_oper, state);
    while (1);
    yggdfs_fuse_args_destroy(args);
}

void* yggdfs_fuse_args_init(int argc, char *argv[]){
    printf("arg count: %d\n",argc);
    if ((argc < 6))
        usage();

    yggdfs_state *state = malloc(sizeof(yggdfs_state));
    if(state == NULL)
        perror("failled malloc\n");
    
    // Pull the rootdir out of the argument list and save it in my
    // internal data
    state->rootdir = realpath(argv[--argc], NULL);

    state->cachedir = realpath(argv[--argc], NULL);

    argv[argc] = NULL;

    // Set logfile
    state->logfile = log_open();

    yggdfs_fuse_args *args = malloc(sizeof(yggdfs_fuse_args));
    args->state = state;
    args->argc  = argc;
    args->argv  = argv;

    return args;
}

void yggdfs_fuse_args_destroy(yggdfs_fuse_args *args){
    free(args);
}
