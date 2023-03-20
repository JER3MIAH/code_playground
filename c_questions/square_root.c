#include <stdio.h>
#include <math.h>
/**
 * main - This uses functios to add two numbers
 * 
 * Return: always 0
 */


int main()
{
    int number;
    printf("Input a number: ");
    scanf("%d", &number);
    
    float root = sqrt(number);
    printf("The square root of %d is %f", number, root);
}
