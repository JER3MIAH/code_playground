#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

void forkexample()
{
	if (fork() == 0)
	{
		printf("This is the child process\n");
	}
	else
	{
		printf("This is the parent process\n");
	}
}

int main(void)
{
	forkexample();

	return (0);
}
