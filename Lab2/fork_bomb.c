#include <stdlib.h>
#include <signal.h>
#include <sys/types.h>

int main(void){

    pid_t   pid;

    for (int i = 0; i < 10; i++){
        pid = fork();
        if (pid == 0){
            pid = fork();
        }
        printf("Pid no.: %d\n", pid);
    }

    return 0;
}