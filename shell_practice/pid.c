#include <stdio.h>
#include <unistd.h>

/**
 * main - retuns the process id
 *
 * Return: always 0
 */

int main()
{
	pid_t my_pid;

	my_pid = getpid();
	printf("%u\n", my_pid);

	return (0);
}
