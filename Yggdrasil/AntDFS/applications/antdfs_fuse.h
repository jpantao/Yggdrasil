#ifndef ANTDFS_FUSE_H
#define ANTDFS_FUSE_H

#include "params.h"
#include "log.h"
#include "antdfs_utils.h"
#include "antdfs_control.h"

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
#include <sys/socket.h>
#include <arpa/inet.h>

void antdfs_fuse_init(int argc, char *argv[]);

#endif // !ANTDFS_FUSE_H
