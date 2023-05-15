#include "shell.h"

/**
 * main - Entry point of the program
 *
 * Return: Always 0
 */

int main(void)
{
	char *cmd = prompt();
	exec(cmd);

	printf("%s", cmd);
	free(cmd);
	return (0);
}
