#include <stdio.h>

/**
 * main - This function declares an array with a for loop
 *
 * Return: always 0
 */


int main() {
    int arr[2][3] = {{1, 3, 5}, {2,4, 6}};
    
    for(int i = 0; i < 2; i++)
    {
        for(int j = 0; j < 3; j++)
        {
            printf("%d ", arr[i][j] );
        }
       
    }

   return (0);
}
