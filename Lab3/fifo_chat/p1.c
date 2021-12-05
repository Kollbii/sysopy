#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    int fd;
    char * fifochat = "/tmp/myfifo";

    mkfifo(fifochat, 0666);

    char arr1[255], arr2[255];
    while (1){
        fd = open(fifochat, O_WRONLY);
        fgets(arr2, 255, stdin);

        write(fd, arr2, strlen(arr2)+1);
        close(fd);

        fd = open(fifochat, O_RDONLY);

        read(fd, arr1, sizeof(arr1));

        printf("User2: %s", arr1);
        close(fd);
    }
    return 0;
}