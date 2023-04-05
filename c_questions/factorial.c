#include <stdio.h>

/**
 * main: this function rints the factorial of a number
 * 
 * Return- always 0
 */

int factorial(int n)
{
    int res = 1;
    int i = 1;
    
    while(i <= n)
    {
        res = res * i;
        i++;
    }
    return(res);
}

int main() 
{
    // Write C code here
    int f;
    f = factorial(10);
    printf("10! = %d", f);
    
    return 0;
}
