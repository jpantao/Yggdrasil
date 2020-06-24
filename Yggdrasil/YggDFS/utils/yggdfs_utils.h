//
// Created by jpantao on 6/23/20.
//

#ifndef YGGDRASIL_YGGDFS_UTILS_H
#define YGGDRASIL_YGGDFS_UTILS_H

#include <unistd.h>

int readfully(int fd, void* buf, int len);

int writefully(int fd, void* buf, int len);

#endif //YGGDRASIL_YGGDFS_UTILS_H
