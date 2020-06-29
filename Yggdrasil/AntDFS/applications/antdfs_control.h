//
// Created by jpantao on 6/22/20.
//

#ifndef YGGDRASIL_ANTDFS_CONTROL_H
#define YGGDRASIL_ANTDFS_CONTROL_H

// Network info
#define TYPE "AdHoc"
#define LOCAL_ADDR "127.0.0.1"
#define CONTROL_PORT 4000

// Apps and Protocols
#define CONTROL_ID 401
#define DISCOV_ID 201
#define DISSEMINATION_ID 202

#define OP_REQ_SUCCESS 0
#define OP_REQ_FAIL 1

int exec_opendir(int socket, const char *path, int len);
int exec_readdir(int socket, const char *path, int len);
int exec_releasedir(int socket, const char *path, int len);

// Operations
#define N_OPER 28

#define GETATTR_REQ 101
#define OPENDIR_REQ 102
#define READDIR_REQ 103
#define RELEASEDIR_REQ 104
#define OPEN_REQ 200

// Define block codes
#define B_MISSING 'M'
#define B_CACHED 'C'
#define B_DIRTY 'D'
#define B_REMOVED 'R'

#endif //YGGDRASIL_ANTDFS_CONTROL_H
