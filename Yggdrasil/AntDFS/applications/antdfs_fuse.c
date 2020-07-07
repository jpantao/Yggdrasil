//
// Created by jpantao on 6/10/20.
//

#include "antdfs_fuse.h"


static void usage() {
    fprintf(stderr, "usage:  AntDFS [FUSE and mount options] cachedir rootdir mountpoint\n\n");
    abort();
}

static void fullpath(char *fpath, const char *path) {
    bzero(fpath, PATH_MAX);
    strcpy(fpath, LOCAL_FILES_LOC);
    strncat(fpath, path, PATH_MAX); // ridiculously long paths will
    // break here

    log_msg("    fullpath:  rootdir = \"%s\", path = \"%s\", fpath = \"%s\"\n",
            LOCAL_FILES_LOC, path, fpath);
}

static void ifn_init_socket(int *sock, struct sockaddr_in *addr) {
    //log_msg("FUSE connecting to Yggdrasil\n");
    if (*sock != 0) {
        log_msg("FUSE already connected\n");
        return;
    }

    //log_msg("FUSE initializing client sock\n");
    *sock = socket(AF_INET, SOCK_STREAM, 0);

    bzero(addr, sizeof(struct sockaddr_in));
    addr->sin_family = AF_INET;
    inet_aton(LOCAL_ADDR, &addr->sin_addr);
    addr->sin_port = htons(CONTROL_PORT);

    int success = connect(*sock, (const struct sockaddr *) addr, sizeof(struct sockaddr_in));
    if (success == 0)
        log_msg("FUSE connected to Yggdrasil\n");
    else
        log_msg("FUSE failed to connect to Yggdrasil\n");
}

//------------------ IMPLEMENTED ------------------------

int antdfs_getattr(const char *path, struct stat *statbuf) {
    log_msg("FUSE executing GETATTR %s\n", path);

    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", GETATTR_REQ);
    // Sending operation code
    short code = GETATTR_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    log_msg("FUSE receiving  retstat\n");
    // Receiving operation return status
    int retstat;
    if (readfully(sock, &retstat, sizeof(int)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }

    log_msg("FUSE retstat received (%d)\n", retstat);

    if (retstat == OP_REQ_FAIL && readfully(sock, &errno, sizeof(int)) <= 0)
        errno = EFAULT;

    if (retstat == OP_REQ_SUCCESS && readfully(sock, statbuf, sizeof(struct stat)) <= 0) {
        retstat = OP_REQ_FAIL;
        errno = EFAULT;
    }

    close(sock);

    if (retstat == OP_REQ_FAIL) {
        retstat = -1;
        //errno = -errno;
    } else {
        log_stat(statbuf);
    }

    log_msg("FUSE GETATTR return %d errno %d (should be %d)\n", retstat, errno, ENOENT);

    return log_syscall("lstat", retstat, 0);
}

int antdfs_access(const char *path, int mask) {
    log_msg("FUSE executing access %s\n", path);
    return log_syscall("access", 0, 0);
}

int antdfs_opendir(const char *path, struct fuse_file_info *fi) {
    log_msg("FUSE executing OPENDIR %s\n", path);
    DIR *dp;
    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", OPENDIR_REQ);
    // Sending operation code
    short code = OPENDIR_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    log_msg("FUSE receiving  retstat\n");
    // Receiving operation return status
    int retstat;
    if (readfully(sock, &retstat, sizeof(int)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }

    log_msg("FUSE retstat received (%d)\n", retstat);

    if (retstat == OP_REQ_FAIL && readfully(sock, &errno, sizeof(int)) <= 0) {
        errno = EFAULT;
        retstat = -1;
    }

    if (retstat == OP_REQ_SUCCESS && readfully(sock, &dp, sizeof(DIR *)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }

    close(sock);

    log_msg("FUSE dp received %0x8\n", dp);
    fi->fh = (intptr_t) dp;
    log_fi(fi);

    if (retstat == OP_REQ_FAIL) {
        retstat = -1;
    }

    return log_syscall("opendir", retstat, 0);
}

int antdfs_readdir(const char *path, void *buf, fuse_fill_dir_t filler, off_t offset, struct fuse_file_info *fi) {

    log_msg("FUSE executing READDIR %s\n", path);
    DIR *dp;
    dp = (DIR *) (uintptr_t) fi->fh;

    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", READDIR_REQ);
    // Sending operation code
    short code = READDIR_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    // Sending dp
    log_msg("FUSE sending dp %0x8\n", dp);
    if (writefully(sock, &dp, sizeof(DIR *)) <= 0) return -1;
    int retstat = OP_REQ_SUCCESS;

    int name_length;
    if(readfully(sock, &name_length, sizeof(int)) <= 0) return -1;

    while (name_length > 0) {
        char *name = malloc(name_length);
        bzero(name, name_length);
        if (readfully(sock, name, name_length) <= 0) return -1;
        log_msg("Received file name %s\n", name);
        if (filler(buf, name, NULL, 0) != 0) {
            log_msg("ERROR antdfs_readdir filler:  buffer full\n");
            return -ENOMEM;
        }
        free(name);
        if(readfully(sock, &name_length, sizeof(int)) <= 0) return -1;
    }

    close(sock);

    log_fi(fi);
    return retstat;
}

int antdfs_releasedir(const char *path, struct fuse_file_info *fi) {
    log_msg("FUSE executing releasedir %s\n", path);

    int retstat = OP_REQ_SUCCESS;
    DIR* dp = (DIR *) (uintptr_t) fi->fh;
    log_msg("FUSE sending dp %0x8\n", dp);
    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", RELEASEDIR_REQ);
    // Sending operation code
    short code = RELEASEDIR_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    // Sending dp
    log_msg("FUSE sending dp %0x8\n", dp);
    if (writefully(sock, &dp, sizeof(DIR *)) <= 0) return -1;
    close(sock);
    return retstat;
}

int antdfs_open(const char *path, struct fuse_file_info *fi) {
    log_msg("FUSE executing OPEN %s\n", path);
    int retstat = 0;


    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", OPEN_REQ);
    // Sending operation code
    short code = OPEN_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    log_msg("FUSE receiving retstat");
    if(readfully(sock, &retstat, sizeof(int)) <= 0){
        errno = EFAULT;
        return -1;
    }

    log_msg("FUSE retstat received (%d)\n", retstat);

    if (retstat == OP_REQ_FAIL && readfully(sock, &errno, sizeof(int)) <= 0) {
        retstat = -1;
    }

    int fd;

    if (retstat == OP_REQ_SUCCESS && readfully(sock, &fd, sizeof(int)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }

    close(sock);

    fi->fh = fd;

    //log_fi(fi);
    return log_syscall("open", retstat, 0);
}

int antdfs_read(const char *path, char *buf, size_t size, off_t offset, struct fuse_file_info *fi) {

    int retstat = 1;
    log_msg("FUSE executing READ %s\n", path);

    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", READ_REQ);
    // Sending operation code
    short code = READ_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    // Sending virtual file descriptor
    log_msg("FUSE sending fd %d\n", fi->fh);
    if (writefully(sock, &fi->fh, sizeof(int)) <= 0) return -1;

    int ioffset = (int) offset;
    log_msg("FUSE sending offset %ld\n", ioffset);

    if (writefully(sock, &ioffset, sizeof(int)) <= 0) return -1;

    unsigned int isize = (unsigned int) size;
    log_msg("FUSE sending size %ld\n", isize);
    if (writefully(sock, &isize, sizeof(unsigned int)) <= 0) return -1;

    log_msg("FUSE receiving retstat\n");
    if (readfully(sock, &retstat, sizeof(int)) <= 0) return -1;
    if(retstat == OP_REQ_FAIL) {
        readfully(sock, &errno, sizeof(int));
        errno = -errno;
        return -1;
    }

    int receivedsize = 0;
    log_msg("FUSE receiving size\n");
    if (readfully(sock, &receivedsize, sizeof(int)) <= 0) return -1;

    if(receivedsize < size)
        log_msg("Warn: Asked for %d bytes but only receiving %d\n", size, receivedsize);

    log_msg("FUSE receiving file buffer\n");
    bzero(buf,size);
    if(readfully(sock, buf, receivedsize) < receivedsize){
        errno = -EFAULT;
        return -1;
    }
    close(sock);
    //log_msg("%s\n", buf);
    return receivedsize;
}

int antdfs_flush(const char *path, struct fuse_file_info *fi) {
    log_msg("\nantdfs_flush(path=\"%s\", fi=0x%08x)\n", path, fi);
    // no need to get fpath on this one, since I work from fi->fh not the path

    //fflush(path);
    //log_fi(fi);

    return 0;
}

//------------------ NOT IMPLEMENTED ---------------------

int antdfs_readlink(const char *path, char *link, size_t size) {
    int retstat;
    char fpath[PATH_MAX];

    log_msg("\nantdfs_readlink(path=\"%s\", link=\"%s\", size=%d)\n",
            path, link, size);
    fullpath(fpath, path);

    retstat = log_syscall("readlink", readlink(fpath, link, size - 1), 0);
    if (retstat >= 0) {
        link[retstat] = '\0';
        retstat = 0;
        log_msg("    link=\"%s\"\n", link);
    }

    return retstat;
}

int antdfs_mknod(const char *path, mode_t mode, dev_t dev) {
    log_msg("FUSE executing MKNOD %s\n", path);

    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", MKNODE_REQ);
    // Sending operation code
    short code = MKNODE_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    // Sending mode
    log_msg("FUSE sending mode\n");
    if (writefully(sock, &mode, sizeof(mode_t)) <= 0) return -1;

    log_msg("FUSE receiving  retstat\n");
    // Receiving operation return status
    int retstat;
    if (readfully(sock, &retstat, sizeof(int)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }

    log_msg("FUSE retstat received (%d)\n", retstat);

    if (retstat == OP_REQ_FAIL && readfully(sock, &errno, sizeof(int)) <= 0)
        errno = EFAULT;

    close(sock);

    if (retstat == OP_REQ_SUCCESS) {
        retstat = 0;
    } else {
        retstat = -1;
    }

    log_msg("FUSE MKNOD return %d errno %d\n", retstat, errno);

    return log_syscall("mknod", retstat, 0);
}

int antdfs_mkdir(const char *path, mode_t mode) {
    log_msg("FUSE executing MKDIR %s\n", path);

    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", MKDIR_REQ);
    // Sending operation code
    short code = MKDIR_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    // Sending mode
    log_msg("FUSE sending mode\n");
    if (writefully(sock, &mode, sizeof(mode_t)) <= 0) return -1;

    log_msg("FUSE receiving retstat\n");
    // Receiving operation return status
    int retstat;
    if (readfully(sock, &retstat, sizeof(int)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }

    log_msg("FUSE retstat received (%d)\n", retstat);

    if (retstat == OP_REQ_FAIL && readfully(sock, &errno, sizeof(int)) <= 0)
        errno = EFAULT;

    close(sock);

    if (retstat == OP_REQ_SUCCESS) {
        retstat = 0;
    } else {
        retstat = -1;
    }

    log_msg("FUSE MKDIR return %d errno %d\n", retstat, errno);

    return log_syscall("mkdir", retstat, 0);
}

int antdfs_unlink(const char *path) {
    log_msg("executing unlink %s\n", path);
    char fpath[PATH_MAX];

    log_msg("antdfs_unlink(path=\"%s\")\n",
            path);
    fullpath(fpath, path);

    return log_syscall("unlink", unlink(fpath), 0);
}

int antdfs_rmdir(const char *path) {
    char fpath[PATH_MAX];

    log_msg("antdfs_rmdir(path=\"%s\")\n",
            path);
    fullpath(fpath, path);

    return log_syscall("rmdir", rmdir(fpath), 0);
}

int antdfs_symlink(const char *path, const char *link) {
    char flink[PATH_MAX];

    log_msg("\nantdfs_symlink(path=\"%s\", link=\"%s\")\n",
            path, link);
    fullpath(flink, link);

    return log_syscall("symlink", symlink(path, flink), 0);
}

int antdfs_rename(const char *path, const char *newpath) {
    char fpath[PATH_MAX];
    char fnewpath[PATH_MAX];

    log_msg("\nantdfs_rename(fpath=\"%s\", newpath=\"%s\")\n",
            path, newpath);
    fullpath(fpath, path);
    fullpath(fnewpath, newpath);

    return log_syscall("rename", rename(fpath, fnewpath), 0);
}

int antdfs_link(const char *path, const char *newpath) {
    char fpath[PATH_MAX], fnewpath[PATH_MAX];

    log_msg("\nantdfs_link(path=\"%s\", newpath=\"%s\")\n",
            path, newpath);
    fullpath(fpath, path);
    fullpath(fnewpath, newpath);

    return log_syscall("link", link(fpath, fnewpath), 0);
}

int antdfs_chmod(const char *path, mode_t mode) {
    char fpath[PATH_MAX];

    log_msg("\nantdfs_chmod(fpath=\"%s\", mode=0%03o)\n",
            path, mode);
    fullpath(fpath, path);

    return log_syscall("chmod", chmod(fpath, mode), 0);
}

int antdfs_chown(const char *path, uid_t uid, gid_t gid) {
    char fpath[PATH_MAX];

    log_msg("\nantdfs_chown(path=\"%s\", uid=%d, gid=%d)\n",
            path, uid, gid);
    fullpath(fpath, path);

    return log_syscall("chown", chown(fpath, uid, gid), 0);
}

int antdfs_truncate(const char *path, off_t newsize) {
    char fpath[PATH_MAX];

    log_msg("\nantdfs_truncate(path=\"%s\", newsize=%lld)\n",
            path, newsize);
    fullpath(fpath, path);

    return log_syscall("truncate", truncate(fpath, newsize), 0);
}

int antdfs_utime(const char *path, struct utimbuf *ubuf) {
    char fpath[PATH_MAX];

    log_msg("\nantdfs_utime(path=\"%s\", ubuf=0x%08x)\n",
            path, ubuf);
    fullpath(fpath, path);

    return log_syscall("utime", utime(fpath, ubuf), 0);
}

int antdfs_write(const char *path, const char *buf, size_t size, off_t offset, struct fuse_file_info *fi) {
    int retstat = 1;
    log_msg("FUSE executing WRITE %s\n", path);

    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", WRITE_REQ);
    // Sending operation code
    short code = WRITE_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    // Sending virtual file descriptor
    log_msg("FUSE sending fd %d\n", fi->fh);
    if (writefully(sock, &fi->fh, sizeof(int)) <= 0) return -1;

    int ioffset = (int) offset;
    log_msg("FUSE sending offset %ld\n", ioffset);

    if (writefully(sock, &ioffset, sizeof(int)) <= 0) return -1;

    unsigned int isize = (unsigned int) size;
    log_msg("FUSE sending size %ld\n", isize);
    if (writefully(sock, &isize, sizeof(unsigned int)) <= 0) return -1;

    log_msg("FUSE sending write buffer\n");
    if(isize > 0 && writefully(sock, buf, isize) <= 0) return -1;

    log_msg("FUSE receiving retstat\n");
    if (readfully(sock, &retstat, sizeof(int)) <= 0) return -1;
    if(retstat == OP_REQ_FAIL) {
        readfully(sock, &errno, sizeof(int));
    }

    int writtensize = 0;
    log_msg("FUSE receiving size\n");
    if (readfully(sock, &writtensize, sizeof(int)) <= 0) return -1;

    close(sock);

    log_msg("FUSE Write terminated. retstat: %d writetensize: %d, errono: %d\n", retstat, writtensize, errno);

    if(retstat == OP_REQ_SUCCESS)
        return writtensize;
    else
        return -errno;
}

int antdfs_statfs(const char *path, struct statvfs *statv) {
    int retstat = 0;
    char fpath[PATH_MAX];

    log_msg("\nantdfs_statfs(path=\"%s\", statv=0x%08x)\n",
            path, statv);
    fullpath(fpath, path);

    // get stats for underlying filesystem
    retstat = log_syscall("statvfs", statvfs(fpath, statv), 0);

    log_statvfs(statv);

    return retstat;
}

int antdfs_release(const char *path, struct fuse_file_info *fi) {
    log_msg("FUSE executing CLOSE %s\n", path);
    int retstat = 0;

    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", CLOSE_REQ);
    // Sending operation code
    short code = CLOSE_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    log_msg("Sent");
    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    // File descriptor
    if (writefully(sock, &fi->fh, sizeof(int)) <= 0) return -1;

    log_msg("FUSE receiving retstat\n");
    if(readfully(sock, &retstat, sizeof(int)) <= 0){
        errno = -EFAULT;
    }

    log_msg("FUSE retstat received (%d)\n", retstat);
    if (retstat == OP_REQ_FAIL) {
        if(readfully(sock, &errno, sizeof(int)) == sizeof(int))
            errno = -errno;
    }

    close(sock);

    //log_fi(fi);
    return log_syscall("close", retstat, 0);
}

int antdfs_fsync(const char *path, int datasync, struct fuse_file_info *fi) {
    log_msg("\nantdfs_fsync(path=\"%s\", datasync=%d, fi=0x%08x)\n",
            path, datasync, fi);
    log_fi(fi);

    return log_syscall("fsync", fsync(fi->fh), 0);
}

int antdfs_fsyncdir(const char *path, int datasync, struct fuse_file_info *fi) {
    int retstat = 0;

    log_msg("\nantdfs_fsyncdir(path=\"%s\", datasync=%d, fi=0x%08x)\n",
            path, datasync, fi);
    log_fi(fi);

    return retstat;
}

void antdfs_destroy(void *userdata) {
    log_msg("\nantdfs_destroy(userdata=0x%08x)\n", userdata);
}

int antdfs_ftruncate(const char *path, off_t offset, struct fuse_file_info *fi) {

    int retstat = 0;

    log_msg("\nantdfs_ftruncate(path=\"%s\", offset=%lld, fi=0x%08x)\n",
            path, offset, fi);
    log_fi(fi);

    retstat = ftruncate(fi->fh, offset);
    if (retstat < 0)
        retstat = log_error("antdfs_ftruncate ftruncate\n");

    return retstat;
}

int antdfs_fgetattr(const char *path, struct stat *statbuf, struct fuse_file_info *fi) {
    int retstat = 0;
    log_msg("FUSE executing FGETATTR %s\n", path);

    int sock = 0;
    static struct sockaddr_in addr;
    ifn_init_socket(&sock, &addr);

    log_msg("FUSE Sending request for operation (%d)\n", GETATTR_REQ);
    // Sending operation code
    short code = GETATTR_REQ;
    if (writefully(sock, &code, sizeof(short)) <= 0) return -1;

    // Sending path length
    int len = (int) (strlen(path) + 1);
    log_msg("FUSE sending path length (%d)\n", len);
    if (writefully(sock, &len, sizeof(int)) <= 0) return -1;

    // Sending path
    log_msg("FUSE sending path (%s)\n", path);
    if (writefully(sock, (char *) path, len) <= 0) return -1;

    log_msg("FUSE receiving  retstat\n");
    // Receiving operation return status
    if (readfully(sock, &retstat, sizeof(int)) <= 0) {
        retstat = -1;
        errno = EFAULT;
    }

    log_msg("FUSE retstat received (%d)\n", retstat);

    if (retstat == OP_REQ_FAIL && readfully(sock, &errno, sizeof(int)) <= 0)
        errno = EFAULT;
    else
        errno = 0;

    if (retstat == OP_REQ_SUCCESS && readfully(sock, statbuf, sizeof(struct stat)) <= 0) {
        retstat = OP_REQ_FAIL;
        errno = EFAULT;
    }

    close(sock);

    if (retstat == OP_REQ_FAIL) {
        retstat = -1;
    }

    log_stat(statbuf);
    return log_syscall("lstat", retstat, 0);
}

void *antdfs_init(struct fuse_conn_info *conn) {
    log_msg("\nantdfs_init()\n");
    log_conn(conn);
    log_fuse_context(fuse_get_context());
    return ANTDFS_INFO;
}

static struct fuse_operations antdfs_oper = {
        .getattr = antdfs_getattr,
        .readlink = antdfs_readlink,
        .mknod = antdfs_mknod,
        .mkdir = antdfs_mkdir,
        .unlink = antdfs_unlink,
        .rmdir = antdfs_rmdir,
        .symlink = antdfs_symlink,
        .rename = antdfs_rename,
        .link = antdfs_link,
        .chmod = antdfs_chmod,
        .chown = antdfs_chown,
        .truncate = antdfs_truncate,
        .utime = antdfs_utime,
        .open = antdfs_open,
        .read = antdfs_read,
        .write = antdfs_write,
        .statfs = antdfs_statfs,
        .flush = antdfs_flush,
        .release = antdfs_release,
        .fsync = antdfs_fsync,
        .opendir = antdfs_opendir,
        .readdir = antdfs_readdir,
        .releasedir = antdfs_releasedir,
        .fsyncdir = antdfs_fsyncdir,
        .destroy = antdfs_destroy,
        .access = antdfs_access,
        .ftruncate = antdfs_ftruncate,
        //.fgetattr = antdfs_fgetattr,
        .init = antdfs_init
};

void antdfs_fuse_init(int argc, char *argv[]) {

    if (argc < 2)
        usage();


    // See which version of fuse we're running
    fprintf(stderr, "Fuse library version %d.%d\n", FUSE_MAJOR_VERSION, FUSE_MINOR_VERSION);

    antdfs_info *state = malloc(sizeof(antdfs_info));
    if (state == NULL)
        perror("failed malloc\n");

    state->logfile = log_open();

    // Passing control over to FUSE
    //log_msg("Mountpoint: %s\n", argv[argc-1]);
    fuse_main(argc, argv, &antdfs_oper, state);
    printf("FINISHED FUSE\n");
}
