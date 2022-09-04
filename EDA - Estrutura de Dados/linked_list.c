#include <stdlib.h>
#include <stdio.h>

struct node {
    int value;
    struct node* next;
};
typedef struct node node_t;

void printList(node_t *head){
    node_t *temp = head;
    while (temp != NULL){
        printf("%i - ",temp->value);
        temp = temp->next;
    }
    printf("\n");

}

node_t* createNode(int value){
    node_t *result = malloc(sizeof(node_t));
    result->value = value;
    result->next = NULL;
    return result;
}

node_t* insertHead(node_t **head, node_t *node_to_insert){
    node_to_insert->next = *head;
    *head = node_to_insert;
    return node_to_insert;
}

node_t *findNode(node_t *head, int value){
    node_t *temp = head;
    while (temp != NULL){
        if (temp->value == value)
            return temp;
        temp = temp->next;
    }
    return NULL;
}

void *insertAfterNode(node_t *target, node_t *new_node){
    new_node->next = target->next;
    target->next = new_node;
}


int main(void){
    node_t *head = NULL;
    node_t *temp;

    for(int i=0;i<25;i++){
        temp = createNode(i);
        insertHead(&head,temp);
    }

    temp = findNode(head, 13);
    printf("found node with %i value\n", temp->value);

    insertAfterNode(temp,createNode(75));

    printList(head);

    return 0;
}
