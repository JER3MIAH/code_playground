#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(int argc, char *argv[])
{
	int id = fork();
	int i;

	if (id == 0)
	{
		i = 1;
	}
	else
	{
		i = 6;
	}

	if (id != 0)
	{
		wait(NULL);
	}

	int j;

	for (j = i; j < i + 5; j++)
	{
		printf("%d ", j);
		fflush(stdout);	
	}
	if (id != 0)
	{
		printf("\n");
	}

	return (0);
}
