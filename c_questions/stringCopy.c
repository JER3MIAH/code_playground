#include <stdio.h>
#include <string.h>

/**
 * main - This function collects input and changes the first letter to X
 *
 * Return: always 0
 */


int main()
{
    char food[] = "pizza";
    char bestFood[strlen(food)];
    
    strcpy(bestFood, food);
    printf("%s", bestFood);

    return (0);
}
