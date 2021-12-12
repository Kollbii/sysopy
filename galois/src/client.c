#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#define MAX 80
#define PORT 5656
#define SA struct sockaddr

char alphabet[32]={ 'a', 'ą', 'b', 'c', 'ć', 'd', ',e',
                    'ę', 'f', 'g', 'h', 'i', 'j', 'k', 
                    'l', 'ł', 'm', 'n', 'ń', 'o', 'ó',
                    'p', 'r', 's', 'ś', 't', 'u', 'w',
                    'y', 'z', 'ź', 'ż'};

int listenForAuth(int sockfd){
    char buff[MAX];
    for(;;){
        bzero(buff, sizeof(buff));
        read(sockfd, buff, sizeof(buff));
        printf("Server: %s\n", buff);

        if (strncmp(buff, "Key $>", 6) == 0){
            printf("Sending credentials...\n");

            //TODO CREDENTIALS FORM 
            write(sockfd, "405865;password", sizeof("405865;password"));
            bzero(buff, sizeof(buff));
            read(sockfd, buff, sizeof(buff));
            printf("Server: %s\n", buff);

            if (strncmp(buff, "+", 1) == 0)
                return 1;
            else
                return 0;
        }
    }
}

int listenForSign(int sockfd){
    char buff[MAX];
    for(;;){
        bzero(buff, sizeof(buff));
        read(sockfd, buff, sizeof(buff));
        printf("Server: %s\n", buff);
        if (strncmp(buff, "@", 1) == 0){
            bzero(buff, sizeof(buff));
            write(sockfd, "tajneslowo", sizeof("tajneslowo"));
            return 1;
        } else {
            return 0;
        }
    }
}


int main(){
    int sockfd;
    char buff[MAX];
    struct sockaddr_in servaddr, cli;

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd == -1) {
        printf("socket creation failed...\n");
        close(sockfd);
        exit(0);
    }
    else{printf("socket successfully created...\n");}
    bzero(&servaddr, sizeof(servaddr));

    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(PORT);
    servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
   
    if (connect(sockfd, (SA*)&servaddr, sizeof(servaddr)) != 0) {
        printf("connection with the server failed...\n");
        exit(0);
    }
    else{
        printf("connected to the server...\n");

        bzero(buff, sizeof(buff));
        printf("Sending credentials...\n");
        write(sockfd, "405865\npassword\n", sizeof("405865\npassword\n"));

        bzero(buff, sizeof(buff));
        read(sockfd, buff, sizeof(buff));
        printf("Server: %s\n", buff);
    }


    if (listenForSign(sockfd) == 1){
        printf("Pick word.\n");
    }


    printf("Ending\n");
    close(sockfd);
}