#include <stdio.h>

// Function to interchange two numbers
void interchangeNumbers(int num1, int num2)
{
    printf("Before swapping: num1 = %d, num2 = %d\n", num1, num2);

    int temp = num1;
    num1 = num2;
    num2 = temp;

    printf("After swapping: num1 = %d, num2 = %d\n", num1, num2);
}

int main()
{
    int testNum1 = 5, testNum2 = 10;

    interchangeNumbers(testNum1, testNum2);

    return 0;
}
