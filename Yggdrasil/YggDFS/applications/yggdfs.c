//
// Created by jpantao on 6/10/20.
//

#include "params.h"
//#include "../utils/yggdfs_utils.h" 

#include <ctype.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <fuse.h>
#include <libgen.h>
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>


/////////////////////////////////////////////////////////////
////                                                     ////
/////////////////////////////////////////////////////////////


static void yggdfs_fullpath(char fpath[PATH_MAX], const char *path){
    strcpy(fpath, YGGDFS_STATE->rootdir);
    strncat(fpath, path, PATH_MAX); // ridiculously long paths will break here
}

/////////////////////////////////////////////////////////////
////                                                     ////
/////////////////////////////////////////////////////////////

int yggdfs_mknod(const char *path, mode_t mode, dev_t dev){
    return 0;
}

int yggdfs_mkdir(const char *path, mode_t mode){
    char fpath[PATH_MAX];
    yggdfs_fullpath(fpath, path);
    printf("exec mkdir");
    return mkdir(fpath, mode);
}

int yggdfs_unlink(const char *path){
    return 0;
}

int yggdfs_rmdir(const char* path){
    return 0;
}

int yggdfs_open(const char *path, struct fuse_file_info *fi){
    return 0;
}

int yggdfs_read(const char *path, char *buf, size_t size, off_t offset, struct fuse_file_info *fi){
    return 0;
}

int yggdfs_write(const char *path, const char *buf, size_t size, off_t offset, struct fuse_file_info *fi){
    return 0;
}

int yggdfs_release(const char *path, struct fuse_file_info *fi){
    return 0;
}

int yggdfs_opendir(const char *path, struct fuse_file_info *fi){
    return 0;
}

int yggdfs_readdir(const char *path, void *buf, fuse_fill_dir_t filler, off_t offset, struct fuse_file_info *fi){
    return 0;
}

int yggdfs_releasedir(const char *path, struct fuse_file_info *fi){
    return 0;
}


static struct fuse_operations yggdfs_oper = {
        //.getattr = yggdfs_getattr,
        .mknod = yggdfs_mknod,
        .mkdir = yggdfs_mkdir,
        .unlink = yggdfs_unlink,
        .rmdir = yggdfs_rmdir,
        .open = yggdfs_open,
        .read = yggdfs_read,
        .write = yggdfs_write,
        .release = yggdfs_release,
        .opendir = yggdfs_opendir,
        .readdir = yggdfs_readdir,
        .releasedir = yggdfs_releasedir,
};

int main(int argc, char *argv[]){
    return fuse_main(argc, argv, &yggdfs_oper, NULL);
}
