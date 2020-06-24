#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hashfunctions.h"

struct node{
    char* key;
    int val;
    struct node *next;
};
struct table{
    int size;
    struct node **list;
};
struct table *createTable(int size){
    struct table *t = (struct table*)malloc(sizeof(struct table));
    t->size = size;
    t->list = (struct node**)malloc(sizeof(struct node*)*size);
    int i;
    for(i=0;i<size;i++)
        t->list[i] = NULL;
    return t;
}
int hashCode(struct table *t,char* key_t){
    int key = (int) djb2(key_t);
    if(key<0)
        return -(key%t->size);
    return key%t->size;
}
void insert_in_table(struct table *t,char* key,int val){
    int pos = hashCode(t,key);
    struct node *list = t->list[pos];
    struct node *newNode = (struct node*)malloc(sizeof(struct node));
    struct node *temp = list;
    while(temp){
        if(strcmp(temp->key,key) == 0){
            temp->val = val;
            return;
        }
        temp = temp->next;
    }
    newNode->key = key;
    newNode->val = val;
    newNode->next = list;
    t->list[pos] = newNode;
}
int lookup_in_table(struct table *t,char* key){
    int pos = hashCode(t,key);
    struct node *list = t->list[pos];
    struct node *temp = list;
    while(temp){
        if(strcmp(temp->key,key) == 0){
            return temp->val;
        }
        temp = temp->next;
    }
    return -1;
}

int remove_from_table(struct table *t, char* key){
    int pos = hashCode(t,key);
    struct node *list = t->list[pos];
    struct node *temp = list;
    struct node *prev;
    while(temp){
        if(strcmp(temp->key,key) == 0){
            prev->next = temp->next;
            return temp->val;
        }
        prev = temp;
        temp = temp->next;
    }
    return -1;
}