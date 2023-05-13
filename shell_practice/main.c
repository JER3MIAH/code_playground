#include "shell.h"

/**
 * main - msin functions
 *
 * Return: 0 on success
 */

int main(void)
{
	char *sh = prompt();
	printf("%s", sh);

	return(EXIT_SUCCESS);
}
