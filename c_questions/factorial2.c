#include <stdio.h>

/**
 * main: this function rints the factorial of a number
 * 
 * Return- always 0
 */

int factorial(int n)
{
    if (n == 1)
    {
        return 1;
    }
    else
    {
        return n * factorial(n-1);
    }
}

int main()
{
    int f;
    f = factorial(5);
    printf("5! = %d", f);
    
    return 0;
}
