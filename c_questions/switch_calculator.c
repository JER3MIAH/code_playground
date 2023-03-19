#include <stdio.h>

/**
 * main - This function collects input and acts as a simple calculator
 *
 * Return: Always 0 (Success)
 */

int main(void)
{
    char operator;
    printf("Choose operator['+', '-', '*', '/']: ");
    scanf("%c", &operator);
    
    double num1, num2;
    
    printf("Enter the first number: ");
    scanf("%lf", &num1);
    
    printf("Enter the second number: ");
    scanf("%lf", &num2);
    
    double result;
    
    switch(operator)
    {
        case '+':
            result = num1 + num2;
            break;
        
        case '-':
            result = num1 - num2;
            break;
        
        case '*':
            result = num1 * num2;
            break;
        
        case '/':
            result = num1 / num2;
            break;
        
        default:
            printf("invalid");
            
    }
    
    printf("%.2lf", result);
    
return (0);
}

