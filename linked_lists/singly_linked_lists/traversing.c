#include <stdio.h>   /*standard input and output*/
#include <stdlib.h>  /*needed to call malloc function*/


struct node
{
	int data;  /*can be any datatype*/
	struct node *link;  /*pointer to struct node*/
};

/*count number of nodes*/
void count_of_nodes(struct node *head)
{
    int count = 0;  /*initialize this to count the nodes in the list*/
    if (head == NULL)
        printf("Linked list is empty");
    struct node *ptr = NULL; /*create a pointer of struct type node and init to NULL*/
    ptr = head;
    while (ptr != NULL)
    {
        count++;
        ptr = ptr->link;
    }
    printf("The number of nodes is: %d\n", count);
}

/*print out data in the nodes*/
void print_data(struct node *head)
{
    int count = 0;  /*initialize this to count the nodes in the list*/
    if (head == NULL)
        printf("Linked list is empty");
    struct node *ptr = NULL; /*create a pointer of struct type node and init to NULL*/
    ptr = head;
    printf("data in the nodes: \n");
    while (ptr != NULL)
    {
        printf("%d\n", ptr->data);
        ptr = ptr->link;
    }
}

int main(void)
{
	struct node *head = NULL;  /*pointer to struct node(can access data and link)*/
    struct node *current = NULL;

	head = malloc(sizeof(struct node));  /*allocate memory for the node*/
	head->data = 45;  /*accessing data with the arrow(->)*/
	head->link = NULL;  /*accessing link*/

    /*to create a second node...*/
    current = malloc(sizeof(struct node)); /*allocate memory for the node*/
    current->data = 23;
	current->link = NULL;
    head->link = current; /*first node is now connected to second node*/

    /*to create a third node...*/
    current = malloc(sizeof(struct node));
    current->data = 3;
	current->link = NULL;

    head->link->link = current;  /*better way to get to the third node*/

    /*traversing a single linked list*/
    count_of_nodes(head);
    print_data(head);

	return (0);
}

