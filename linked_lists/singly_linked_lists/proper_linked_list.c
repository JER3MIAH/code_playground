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

	head = malloc(sizeof(struct node));  /*allocate memory for the node*/
	head->data = 45;  /*accessing data with the arrow(->)*/
	head->link = NULL;  /*accessing link*/

    /*to create a second node...*/
    current = malloc(sizeof(struct node)); /*allocate memory for the node*/
    current->data = 45;
	current->link = NULL;
    head->link = current; /*first node is now connected to second node*/

    /*to create a third node...*/
    current = malloc(sizeof(struct node))
    current->data = 3;
	current->link = NULL;

    head->link->link = current;  /*better way to get to the third node*/


	return (0);
}
