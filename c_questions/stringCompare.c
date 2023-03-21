#include <stdio.h>
#include <string.h>

/**
 * main - This function compares two strings
 *
 * Return: always 0
 */


int main()
{
    char text1[] = "abcd";
    char text2[] = "efgh";
    
    int result = strcmp(text1, text2);
    
    printf("%d", result);

    return (0);
}
