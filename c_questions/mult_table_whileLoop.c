#include <stdio.h>

/**
 * main - This function requests input and prints the multiplication table for the inputed number
 * 
 * Return: always 0
 */
 
 

int main()
{
    int number;
    printf("Input a number: ");
    scanf("%d", &number);
    
    int count = 1;
    
    while(count <= 12)
    {
        int product = number * count;
        printf("%d*%d = %d\n", number, count, product);
        count = count + 1;
    }
    
    return 0;
}
