#include <stdio.h>

/**
 * main - This function requests input using fgets
 *
 * Return: always 0
 */


int main()
{
    char str[20];
    
    printf("Enter your name: ");
    
    fgets(str, sizeof(str), stdin);
    
    printf("%s", str);
    
    return (0);
}
