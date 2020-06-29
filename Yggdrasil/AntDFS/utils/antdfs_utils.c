//
// Created by jpantao on 6/23/20.
//

#include "antdfs_utils.h"

int readfully(int fd, void* buf, int len) {
    int missing = len;
    while(missing > 0) {
        int r = read(fd, buf + len - missing, missing);
        if(r <= 0)
            return r;
        missing-=r;
    }
    return len-missing;
}

int writefully(int fd, void* buf, int len) {
    int missing = len;
    while(missing > 0) {
        int w = write(fd, buf + len - missing, missing);
        if(w <= 0)
            return w;
        missing-=w;
    }
    return len-missing;
}