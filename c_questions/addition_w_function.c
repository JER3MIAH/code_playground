#include <stdio.h>

/**
 * main - This uses functios to add two numbers
 * 
 * Return: always 0
 */
 
 


int addNumbers(num1, num2)
{
    int sum;
    sum = num1 + num2;
    return sum;
}

int main()
{
    int result = addNumbers(8, 6);
    printf("%d", result);

    return 0;
}
