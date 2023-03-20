#include <stdio.h>
#include <math.h>

/**
 * main - This function computes the result of n input raised to the power of the square root of another input
 * 
 * Return: always 0
 */

int main()
{
    int number1;
    int number2;
    
    printf("input first number: ");
    scanf("%d", &number1);
    
    printf("input second number: ");
    scanf("\n%d", &number2);
    
    double result;
    result = pow(number1, sqrt(number2));
    printf("\n%lf",  result);

    return 0;
}
