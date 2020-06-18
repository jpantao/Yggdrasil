#include "yggdfs_fuse.h"
#include "ygg_runtime.h"
#include "YggDFS/protocols/batman.h"

#include <pthread.h>

#define DISCOV_ID 255
#define CONTROL_ID 023
#define VRSCONTROL_ID 777
#define DISSEMINATION_ID 333
#define TYPE "AdHoc"

int main(int argc, char *argv[]) {

    NetworkConfig* ntconf = defineWirelessNetworkConfig(TYPE, 11, 5, 1, "pis", "YGGDFS");
    //Init ygg_runtime and protocols
    ygg_runtime_init(ntconf);


    batman_args* bargs = batman_args_init(false, false, 2, 0, 5, DEFAULT_BATMAN_WINDOW_SIZE, 3);
    registerProtocol(PROTO_ROUTING_BATMAN, batman_init, bargs);
    batman_args_destroy(bargs);



    // Launch a new thread to run the FUSE operations
    pthread_t fuse_thread;
    void *fuse_args = yggdfs_fuse_args_init(argc, argv);
    pthread_create(&fuse_thread, NULL,  (void *(*) (void*)) &yggdfs_fuse_init, fuse_args);

    return 0;
}
