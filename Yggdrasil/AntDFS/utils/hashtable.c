#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "hashtable.h"
#include "hashfunctions.h"

struct node{
    char* key;
    void* val;
    struct node *next;
};

struct table *table_create(int size){
    struct table *t = (struct table*)malloc(sizeof(struct table));
    t->size = size;
    t->list = (struct node**)malloc(sizeof(struct node*)*size);
    int i;
    for(i=0;i<size;i++)
        t->list[i] = NULL;
    return t;
}
int hashCode(struct table *t, const char* key_t){
    int key = (int) djb2(key_t);
    if(key<0)
        return -(key%t->size);
    return key%t->size;
}
void table_insert(struct table *t, const char* key,void* val){
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

    newNode->key = (char*) key;
    newNode->val = val;
    newNode->next = list;
    t->list[pos] = newNode;
}
void* table_lookup(struct table *t, const char* key){
    int pos = hashCode(t,key);
    struct node *list = t->list[pos];
    struct node *temp = list;
    while(temp){
        if(strcmp(temp->key,key) == 0){
            return temp->val;
        }
        temp = temp->next;
    }
    return NULL;
}

void* table_remove(struct table *t, const char* key){
    int pos = hashCode(t,key);
    struct node *list = t->list[pos];
    struct node *temp = list;
    struct node *prev;

    void* tmp = NULL;

    if(strcmp(temp->key,key) == 0){
        list = temp->next;
        tmp = temp->val;
        free(temp);
        return tmp;
    }

    while(temp){
        if(strcmp(temp->key,key) == 0){
            prev->next = temp->next;
            tmp = temp->val;
            free(temp);
            return tmp;
        }
        prev = temp;
        temp = temp->next;
    }
    return tmp;
}