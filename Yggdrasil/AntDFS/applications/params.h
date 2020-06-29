//
// Created by jpantao on 6/8/20.
//

#ifndef ANTDFS_PARAMS_H
#define ANTDFS_PARAMS_H

#define LOCAL_FILES_LOC  "/home/jpantao/AntDFS/antdfs.local"
#define REMOTE_FILES_LOC "/home/jpantao/AntDFS/antdfs.remote"
#define FETCHED_BLOCKS_LOC "/home/jpantao/AntDFS/antdfs.blocks"

// Limitation for the amount of disk space used by AntDFS
#define MAX_DISK_USAGE 0

// Number of file/directory replicas created (for backup)
#define REPLICATION_FACTOR 0 //TODO: introduce replication for backup purpose

// FUSE API version
#define FUSE_USE_VERSION 26

#define PATH_MAX 200

// AntDFS state
#include <stdio.h>
typedef struct antdfs_info_ {
    FILE *logfile;
} antdfs_info;
#define ANTDFS_INFO ((antdfs_info *) fuse_get_context()->private_data)

#endif //ANTDFS_PARAMS_H
