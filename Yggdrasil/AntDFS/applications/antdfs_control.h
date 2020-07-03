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

// Messages
#define DISSEMINATION_MSG 501
#define FETCH_BLK_REQ_MSG 502
#define FETCH_BLK_REP_MSG 503

// Operations
#define N_OPER 28

#define GETATTR_REQ 101
#define OPENDIR_REQ 102
#define READDIR_REQ 103
#define RELEASEDIR_REQ 104
#define OPEN_REQ 105
#define READ_REQ 106
#define CLOSE_REQ 107

// Define block codes
#define B_REQUESTED 'R'
#define B_MISSING 'M'
#define B_CACHED 'C'
#define B_DIRTY 'D'
#define B_DELETED 'D'

#define B_SIZE 1024

#endif //YGGDRASIL_ANTDFS_CONTROL_H
