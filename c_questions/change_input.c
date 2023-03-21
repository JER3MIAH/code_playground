#include <stdio.h>

/**
 * main - This function collects input and changes the first letter to X
 *
 * Return: always 0
 */


int main()
{
    char str[20];
    
    printf("Enter your name: ");
    fgets(str, sizeof(str), stdin);
    
    str[0] = 'X';
    
    printf("%s", str);
    
    return (0);
}
