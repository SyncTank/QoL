#include "stdio.h"

typedef enum types { NONE, INT, CHAR, FLOAT, DOUB, STR } Type;

typedef union Container {
  int num;
  float num_f;
  double num_d;
  char character;
  const char *str;
} Can;

typedef struct Data_t {
  Can data;
  Type dataType;
} Data;

typedef struct Node_t Node;

struct Node_t {
  Data value;
  Node *next;
  Node *past;
};

void setNextNode(Node *node, Node *to_node) { node->next = to_node; };

void setPastNode(Node *node, Node *to_node) { node->past = to_node; };

Node *getNextNode(Node *node) { return node->next; };

Node *getPastNode(Node *node) { return node->past; };

void setNodeValue(Node *node, void *value, Type ty) {
  switch (ty) {
  case (INT):
    node->value.data.num = *(int *)value;
    node->value.dataType = ty;
    return;
  case (CHAR):
    node->value.data.character = *(char *)value;
    node->value.dataType = ty;
    return;
  case (FLOAT):
    node->value.data.num_f = *(float *)value;
    node->value.dataType = ty;
    return;
  case (DOUB):
    node->value.data.num_d = *(double *)value;
    node->value.dataType = ty;
    return;
  case (STR):
    node->value.data.str = *(const char **)value;
    node->value.dataType = ty;
    return;
  default:
    printf("Invaild type!\n");
  }
}

int is_NodeAlive(Node *node) {
  printf("ISALIVE | Node address: %p, num: %i, dataType: %i\n", node,
         node->value.data.num, node->value.dataType);

  if (node == NULL) {
    printf("NULL PTR\n");
    return 0;
  }

  switch (node->value.dataType) {
  case (INT):
    return 1;
  case (CHAR):
    return 1;
  case (FLOAT):
    return 1;
  case (DOUB):
    return 1;
  case (STR):
    return 1;
  default:
    printf("Invaild Node not Alive! Returning 0\n");
    return 0;
  }
}

void printNode(Node *node) {
  if (node == NULL) {
    return;
  }
  if (!is_NodeAlive(node)) {
    return;
  }
  switch (node->value.dataType) {
  case (INT):
    printf("%i", node->value.data.num);
    return;
  case (CHAR):
    printf("%c", node->value.data.character);
    return;
  case (FLOAT):
    printf("%f", node->value.data.num_f);
    return;
  case (DOUB):
    printf("%.4f", node->value.data.num_d);
    return;
  case (STR):
    printf("%s", node->value.data.str);
    return;
  default:
    printf("Invaild type!\n");
    return;
  }
}

typedef struct LinkedList_t {
  int max_size;
  Node *head;
  Node *tail;
} LinkedList;

void init_LinkedList(LinkedList *list) { list->max_size = 0; }

void printLinkedList_From_Head(LinkedList *list) {
  if (list == NULL) {
    return;
  }
  if (is_NodeAlive(list->head) == 0) {
    printf("ERROR No Head found\n\n");
    return;
  }
  if (is_NodeAlive(list->tail) == 0) {
    printf("ERROR No tail found\n\n");
    return;
  }
  if (list->max_size < 1) {
    printf("ERROR size is 0 \n\n");
    return;
  }

  Node *nextInLine = list->head;
  printf("\nCurrent Head : ");
  printf("\n");

  if (list->max_size == 1) {
    is_NodeAlive(nextInLine);
    return;
  }

  int count = 0;
  printf("SIZE : %i CURRENT HEAD : %i\n", list->max_size,
         list->head->value.data.num);
  while (count < list->max_size && nextInLine != NULL) {
    printf("%i ", nextInLine->value.data.num);
    nextInLine = nextInLine->next;
    count += 1;
  }
  printf("\n");
};

void add_To_Tail(LinkedList *list, Node *node) {
  printf("\n\nADDTAILING | Node address: %p, num: %i, dataType: %i\n", node,
         node->value.data.num, node->value.dataType);
  if (node == NULL || list == NULL) {
    printf("NULL PTR\n");
    return;
  }

  if (is_NodeAlive(node) == NONE) {
    return;
  }
  if (is_NodeAlive(list->head) == NONE) {
    list->head = node;
  }
  if (is_NodeAlive(list->tail) == NONE) {
    list->tail = node;
  }
  setNextNode(list->tail, node);
  setPastNode(node, list->tail);
  list->tail = node;
  list->max_size++;
};

void add_To_Head(LinkedList *list, Node *node) {
  printf("\n\nADDHEADING | Node address: %p, num: %i, dataType: %i\n", node,
         node->value.data.num, node->value.dataType);
  if (node == NULL || list == NULL) {
    printf("NULL PTR\n");
    return;
  }
  if (is_NodeAlive(node) == NONE) {
    return;
  }
  if (is_NodeAlive(list->head) == NONE) {
    list->head = node;
  }
  if (is_NodeAlive(list->tail) == NONE) {
    list->tail = node;
  }
  setPastNode(list->head, node);
  setNextNode(node, list->head);
  list->head = node;
  list->max_size++;
};

void remove_Tail(LinkedList *list) {
  if (is_NodeAlive(list->tail) == NONE) {
    return;
  }
  if (list->max_size == 0) {
    return;
  }
  list->tail = list->tail->past;
  list->max_size--;
};

void remove_Head(LinkedList *list) {
  if (is_NodeAlive(list->head) == NONE) {
    return;
  }
  if (list->max_size == 0) {
    return;
  }
  list->head = list->head->next;
  list->max_size--;
};

#define MAX 10

int main() {

  printf("Initializing Nodes for Work....\n\n");

  int values[MAX];
  Node nodes[MAX];

  for (int i = 0; i < MAX; i++) {
    setNodeValue(&nodes[i], &i, INT);
  }

  for (int i = 0; i < MAX; i++) {
    printNode(&nodes[i]);
    printf(" ");
  }

  printf("\n%i Nodes are ready for work\n\n", MAX);
  printf("Starting Linked List\n");

  LinkedList nlist;
  init_LinkedList(&nlist);

  printf("Size of LinkedList %i\n", nlist.max_size);
  printLinkedList_From_Head(&nlist);

  printf("sizeof node : %zu , sizeof value: %zu , sizeof data: %zu\n",
         sizeof(nodes[0]), sizeof(nodes[0].value), sizeof(nodes[0].value.data));

  printf("Size of an int %zu\n", sizeof(int));

  Node test;
  float x = 34.34;
  setNodeValue(&test, &x, DOUB);

  printf("sizeof node : %zu , sizeof value: %zu , sizeof data: %zu\n",
         sizeof(test), sizeof(test.value), sizeof(test.value.data));

  printf("Size of an float %zu\n\n", sizeof(double));

  Node k;
  printNode(&k);

  printf("\nAttmpting a print LinkedList!\n");
  printLinkedList_From_Head(&nlist);

  add_To_Head(&nlist, &nodes[5]); // HEAD
  add_To_Head(&nlist, &nodes[4]);
  add_To_Head(&nlist, &nodes[2]);
  add_To_Head(&nlist, &nodes[3]);
  add_To_Tail(&nlist, &nodes[8]); // TAIL
  add_To_Tail(&nlist, &nodes[1]);
  add_To_Head(&nlist, &nodes[6]); // HEAD

  printf("\n\nPRINTING\n\n");

  printLinkedList_From_Head(&nlist);

  remove_Head(&nlist); // REMOVE HEAD
  printLinkedList_From_Head(&nlist);

  return 0;
}
