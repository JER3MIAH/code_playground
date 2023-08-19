#include <stdio.h>   /*standard input and output*/
#include <stdlib.h>  /*needed to call malloc function*/


struct node
{
	int data;  /*can be any datatype*/
	struct node *link;  /*pointer to struct node*/
};

int main(void)
{
	struct node *head = NULL;  /*pointer to struct node(can access data and link)*/
    struct node *current = NULL;
    struct node *current2 = NULL;

	head = malloc(sizeof(struct node));  /*allocate memory for the node*/

	head->data = 45;  /*accessing data with the arrow(->)*/
	head->link = NULL;  /*accessing link*/

    /*to create a second node...*/
    current = malloc(sizeof(struct node)); /*allocate memory for the node*/
    current->data = 45;
	current->link = NULL;
    head->link = current; /*first node is now connected to second node*/

    /*to create a third node...*/
    current2 = malloc(sizeof(struct node));
    current2->data = 3;
	current2->link = NULL;
    current->link = current2;

    /*Though the above method isn't efficient as it wastes memory*/

	return (0);
}
