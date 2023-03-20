#include <stdio.h>

/**
 * main - This function collects input and tells whether your input is negative or positive
 * 
 * Return: always 0
 */
 
 

int main()
{
    while(1)
    {
        int number;
        printf("Enter a number: ");
        scanf("%d", &number);
    
        if(number < 0)
        {
            printf("negative number");
            break;
        }
        if(number > 0)
        {
            printf("positive number");
        }
        printf("%d\n", number);
        
    }
 
    return 0;
}
