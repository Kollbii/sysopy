#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    int fd1;
    char * fifochat = "/tmp/myfifo";

    mkfifo(fifochat, 0666);

    char str1[255], str2[255];
    while (1){
        fd1 = open(fifochat,O_RDONLY);
        read(fd1, str1, 255);

        printf("User1: %s", str1);
        close(fd1);

        fd1 = open(fifochat,O_WRONLY);
        fgets(str2, 255, stdin);
        write(fd1, str2, strlen(str2)+1);
        close(fd1);
    }
    return 0;
}