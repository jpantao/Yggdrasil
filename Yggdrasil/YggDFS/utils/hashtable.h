//
// Created by jpantao on 6/24/20.
//

#ifndef YGGDRASIL_HASHTABLE_H
#define YGGDRASIL_HASHTABLE_H

struct table{
    int size;
    struct node **list;
};

struct table *table_create(int size);

void table_insert(struct table *t, const char* key,void* val);

void* table_lookup(struct table *t, const char* key);

void* table_remove(struct table *t, const char* key);

#endif //YGGDRASIL_HASHTABLE_H
