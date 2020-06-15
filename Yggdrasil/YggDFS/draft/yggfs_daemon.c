//
// Created by jpantao on 6/8/20.
//


#include "yggfs_daemon.h"

#define MAX_WAITING_CLIENTS 10

executeClientSession(int clientSocket, struct sockaddr_in* addr, queue_t* inBox) {

    char clientIP[16];
    inet_ntop(AF_INET, &addr->sin_addr, clientIP, 16);

    int fs_call_code;
    int length;
    int finished = 0;

    while (finished == 0) {

        switch (fs_call_code) {
            //TODO: execute operations
        }

    }

}

void yggfs_daemon_init(queue_t* inBox){

    int listen_socket = socket(AF_LOCAL, SOCK_STREAM, 0);
    struct sockaddr_in address;
    address.sin_family = AF_LOCAL;
    address.sin_addr.s_addr = htonl(INADDR_ANY);
    address.sin_port = htons((unsigned short) DAEMON_PORT);

    if(bind(listen_socket, (const struct sockaddr*) &address, sizeof(address)) == 0 ) {

        if(listen(listen_socket, MAX_WAITING_CLIENTS) < 0) {
            perror("YGG_FS Daemon - Unable to setup listen on socket: ");
            return;
        }

        //Daemon main loop
        while (1) {
            bzero(&address, sizeof(struct sockaddr_in));
            unsigned int length = sizeof(struct sockaddr_in);
            int client_socket = accept(listen_socket, (struct sockaddr*) &address, &length);
            //TODO: executeClientSession
        }

    } else {
        perror("YGG_FS Daemon - Unable to bind on listen socket: ");
        return;
    }


}
