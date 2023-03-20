#include <stdio.h>
#include <ctype.h>

/**
 * main - This function converts input to lower and upper case
 * 
 * Return: always 0
 */

int main()
{
    char alpha = 'c';
    char upper = toupper(alpha);
    printf("%c", upper);
    
    char lower = tolower(alpha);
    printf("\n%c", lower);

    return 0;
}
