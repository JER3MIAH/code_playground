#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>

int main(void)
{
	pid_t pid;
	pid_t ppid;

	pid = fork();

	if (pid == -1)
	{
		perror("unsuccessful\n");
		return (1);
	}

	if (pid == 0)
	{
		sleep(40);
		printf("I am the childn\n");
	}
	else
	{
		ppid = getpid();
		printf("parent pid is: %u\n", ppid);
	}
	return (0);
}
