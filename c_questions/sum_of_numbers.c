#include <stdio.h>

/**
 * main - This function prints the sum of numbers from 1 to 100
 * 
 * Return: always 0
 */
 
 

int main()
{
    int sum = 0;
    
    for(int i=0; i <= 100; i++)
    {
        sum = sum + i;
    }
    printf("%d ", sum);
 
    return 0;
}
