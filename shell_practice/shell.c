#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/**
 * print_prompt - prints a prompt to the console
 */

void print_prompt(void)
{
	printf("$ ");
}

/**
 * read_buff - reads a command from the console
 * Return: pointer to the command
 */

char *read_buff(void)
{
	size_t size = 0;

	char *buff = NULL;

	getline(&buff, &size, stdin);

	return (buff);
}

/**
 * main - Main function that repeatedly prompts user
 * Return: 0 on success, error otherwise
 */

int main(void)
{
	while (1)
	{
		print_prompt();

		char *buff = read_buff;

		execute_buff(buff);

		free(buff);
	}
	return (0);
}

/**
 * execute_buff - executes a command
 * @buff: pointer to the command string
 */

void execute_buff(char *buff)
{
	char *path = strtok(buff, " \n");

	char *args[100];

	int i = 0;

	while (path != NULL)
	{
		args[i++] = path;

		path = strtok(NULL, " \n");
	}
	args[i] = NULL;

	char *envp[] = { NULL };

	pid_t pid = fork();

	if (pid == 0)
	{
		execve(args[0], args, envp);

		perror("execve failed");

		exit(EXIT_FAILURE);

	}
	else if (pid < 0)
	{
		perror("fork failed");
	}
	else
	{
		wait(NULL);
	}
}
