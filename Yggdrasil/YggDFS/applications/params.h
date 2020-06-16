//
// Created by jpantao on 6/8/20.
//

#ifndef YGGDRASIL_PARAMS_H
#define YGGDRASIL_PARAMS_H


// Limitation for the amount of disk space used by YggDFS
#define MAX_DISK_USAGE 0

// Number of file/directory replicas created (for backup)
#define REPLICATION_FACTOR 0 //TODO: introduce replication for backup purpose

// FUSE API version
#define FUSE_USE_VERSION 26

#define PATH_MAX 200

// YggDFS state
#include <stdio.h>
struct yggdfs_state {
    FILE *logfile;
    char *rootdir;
};
#define YGGDFS_STATE ((struct yggdfs_state *) fuse_get_context()->private_data)

#endif //YGGDRASIL_PARAMS_H
