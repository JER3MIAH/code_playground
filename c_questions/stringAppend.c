#include <stdio.h>
#include <string.h>

/**
 * main - This function apends one string to another
 *
 * Return: always 0
 */


int main()
{
    char text1[] = "Hey, ";
    char text2[] = "how are you?";
    
    strcat(text1, text2);
    printf("%s", text1);
    
    return (0);
}
