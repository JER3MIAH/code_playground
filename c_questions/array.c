// Online C compiler to run C program online
#include <stdio.h>

/**
 * main - This function uses a for loop with arrays
 * 
 * Return: always 0
 */

int main()
{
    int age[5] = {21, 29, 25, 32, 17};
    for(int i = 0; i < 5; i++)
    {
        printf("The index of %d is: %d\n", i, age[i]);
    }
    
    return (0);
}
