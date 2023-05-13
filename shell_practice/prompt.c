#include "shell.h"

/**
 * prompt - prints a prompt that collects input
 *
 * Return: 0 on success
 */

char *prompt(void)
{
	size_t n = 0;

	char *buff = NULL;
	char *pr = ("($) ");

	printf("%s", pr);

	getline(&buff, &n, stdin);

	free(buff);

	return (0);
}
