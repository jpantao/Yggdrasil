//
// Created by jpantao on 6/8/20.
//

#ifndef YGGDRASIL_YGGFS_DAEMON_H
#define YGGDRASIL_YGGFS_DAEMON_H

#include <sys/types.h>
#include <arpa/inet.h>
#include <sys/socket.h>

#define DAEMON_PORT 8000

static void yggfs_daemon_init(queue_t* inBox);

#endif //YGGDRASIL_YGGFS_DAEMON_H
