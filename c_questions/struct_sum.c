#include <stdio.h>

/**
 * main - This function finds the sum of a real and imaginary number
 * 
 * Return: always 0
 */

typedef struct Complex
{
    double real;
    double imagine;
} complex;

int main()
{
    complex c1 = {.real = 21.87, .imagine = 30};
    complex c2 = {.real = 13.34, .imagine = 112.23};
    
    complex sum;
    
    sum.real = c1.real + c2.real;
    sum.imagine = c1.imagine + c2.imagine;
    
    printf("Result is: %.2lf + %.2lfi", sum.real + sum.imagine);

    return 0;
}
