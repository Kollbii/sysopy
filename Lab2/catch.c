#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>


void capture_sig(int sig){
    char *str = strdup(sys_siglist[sig]);
    printf("Got signal %s -> %d\n", str, sig);

    // Exception for sigkill and sigstop
    if (signal(sig, capture_sig) == SIG_ERR){
        printf("Can't catch %d\n", sig);
        exit(1);
    }
}

int main(void){
    while (1){
        for (int i = 1; i <= 64; i++) {
            signal(i, capture_sig);
        }
        sleep(1);
        printf("Doing smth[..]\n");
    }
	return 0;
    // for i in {20..30}; do kill -$i $(pidof catch); done
}
