//
// Created by jpantao on 6/24/20.
//

#ifndef YGGDRASIL_HASHTABLE_H
#define YGGDRASIL_HASHTABLE_H

struct table{
    int size;
    struct node **list;
};

struct table *createTable(int size);

int hashCode(struct table *t,char* key_t);

void insert_int_table(struct table *t,char* key,int val);

int lookup_in_table(struct table *t,char* key);

int remove_from_table(struct table *t, char* key);

#endif //YGGDRASIL_HASHTABLE_H
