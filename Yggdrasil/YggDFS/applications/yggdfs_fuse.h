#ifndef YGGDFS_FUSE_H
#define YGGDFS_FUSE_H

#include "params.h"
#include "log.h" 

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

typedef struct yggdfs_fuse_args_ {
    int argc;
    yggdfs_state *state;
    char **argv;
} yggdfs_fuse_args;

void yggdfs_fuse_init(yggdfs_fuse_args *args);

void* yggdfs_fuse_args_init(int argc, char *argv[]);

void yggdfs_fuse_args_destroy(yggdfs_fuse_args *args);

#endif // !YGGDFS_FUSE_H
