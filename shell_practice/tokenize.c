#include "shell.h"

void print_array(char **str_array);
char **string_to_arr(char *str);

int main(void)
{
	char str[] = "the dog chased him all the way home";
	char **argv = string_to_arr(str);
	print_array(argv);
}

char **string_to_arr(char *str)
{
	char **str_array;
	char *delim = " ";
	char *token, *s;
	int i = 0;

	str_array = malloc(sizeof(char *));

	if (str_array == NULL)
	{
		perror("malloc failed");
		exit(1);
	}
	
	s = str;
	while ((token = strtok(s, delim)) != NULL)
	{
		str_array[i] = strdup(token);

		if (str_array[i] == NULL)
		{
			perror("memory allocation failed");
			exit(1);
		}

		i++;
		/* increment the size of the string array */
		str_array = realloc(str_array, sizeof(char *) * (i + 1));
		s = NULL;
	}
	str_array[i] = NULL;
	return (str_array);
}

void print_array(char **str_array)
{
	while(*str_array)
		{
			printf("%s\n", *str_array);
			str_array++;
		}

}
