#include <stdio.h>
#include <unistd.h>

int main(void)
{
	pid_t pid;

	printf("Before fork I was one\n");
	pid = fork();

	if(pid == -1)
	{
		perror("unsuccessful\n");
		return (1);
	}
	if(pid == 0)
	{
		sleep(5);
		printf("I am the child\n");
	}
	else
		printf("I am the parent\n");
	return (0);
}
