#include <stdio.h>   /*standard input and output*/
#include <stdlib.h>  /*needed to call malloc function*/


struct node
{
	int data;  /*can be any datatype*/
	struct node *link;  /*pointer to struct node*/
};

int main()
{
	struct node *head = NULL;  /*pointer to struct node(can access data and link)*/
	head = malloc(sizeof(struct node));  /*allocate memory for the node*/

	head->data = 45;
	head->link = NULL;

	printf("%d", head->data);
	return (0);
}
