#include <sys/types.h>
#include <stdio.h>
#include <unistd.h>

int static_global = 8;
int *dynamic_global;

int main()
{
	pid_t pid;

	int num;
	int blank;

	int static_local = 5;
	int *dynamic_local = malloc(sizeof(int)*5);
	
	dynamic_local[4] = 2;

	dynamic_global = malloc(sizeof(int)*5);
	dynamic_global[4] = 1;

	FILE *fileptr = fopen("./sysop.txt", "w");

	// fork a child process
	pid = fork();


	if (pid < 0) { // error occurred
		fprintf(stderr, "Fork Failed");
		return 1;
	}
	else if (pid == 0) { // child process
		// execlp("/bin/ls", "ls", NULL);

		// scanf("%d", &num); // <-- Wraca do konsoli, parent w tle
		// scanf("%c", &blank);

		fputs("Some text of CHILD PROCESS\n", fileptr);
		printf("My (child) PID: %d\n", getpid());
		printf("Parent (child) PID: %d\n", getppid());
		dynamic_global[4] = 3;
		dynamic_local[4] = 4;
		printf("DynLoc: %d, DynGlob: %d", dynamic_local[4], dynamic_global[4]);

	}
	else { // parent process
		// parent will wait for child to complete
		// wait(NULL);

		scanf("%c", &blank);
		fputs("PARENT PROCESS text\n", fileptr);
		printf("My (Parent) PID: %d\n", getpid());
		printf("Child PID: %d\n", pid);
		printf("Child Complete");
		dynamic_global[4] = 99;
		dynamic_local[4] = 98;
		printf("DynLoc: %d, DynGlob: %d", dynamic_local[4], dynamic_global[4]);

	}

	return 0;
}
