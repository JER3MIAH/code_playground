#include <stdio.h>

/**
 * main - This function creates enum constansts
 * 
 * Return: always 0
 */

enum week
{
    Sunday,
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday
}weekend1, weekend2;

int main()
{
    weekend1 = Sunday;
    weekend2 = Saturday;
    
    printf("%d\n", weekend1);
    printf("%d", weekend2);

    return 0;
}
