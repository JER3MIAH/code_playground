#include "shell.h"

/**
 * prompt - a function that prompts the user 
 *
 * Return: returns back our command 
 */

char *prompt(void)
{
	char *cmd = NULL;
	size_t size = 0;
	/*Getline automativally allocates sufficient memory for the above*/

	char *p = "($) ";
	
	/*Display prompt*/
	printf("%s", p);
	getline(&cmd, &size, stdin);
	return (cmd);
}
