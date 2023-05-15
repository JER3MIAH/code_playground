#include "shell.h"

/**
 * exec - Executes command based on given input
 *
 * @cmd: the program to be executed
 */

void exec(char *cmd)
{
	char *token = strtok(cmd, " ");

	while(token)
	{
		printf("%s\n", token);
		token = strtok(NULL, " ");
	}
	char *argv[] = {"/bin/ls", NULL};

	execve(argv[0], argv, NULL);
}
