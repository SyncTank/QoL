#include "stdio.h"

typedef enum types { INT, CHAR, FLOAT, DOUB, STR } Type;

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

void printNode(Node *node) {
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
  }
}

typedef struct LinkedList_t {
  int max_size;
  Node *head;
  Node *tail;
} LinkedList;

void printLinkedList_From_Head(LinkedList *list) {
  if (list->head == NULL) {
    printf("ERROR No Head found\n\n");
    return;
  }
  Node *nextInLine = list->head;
  while (nextInLine != NULL) {
    printNode(nextInLine);
    nextInLine = nextInLine->next;
  }
};

void add_To_Tail(LinkedList *list, Node *node) {
  // if (node->value.data == NULL) {
  //  return;
  // }
  if (list->tail == NULL) {
    list->tail = node;
  }
  if (list->head == NULL) {
    list->head = node;
  }
  list->max_size++;
};

void add_To_Head(LinkedList *list, Node *node) {
  if (list->head == NULL) {
    list->head = node;
  }
  if (list->tail == NULL) {
    list->tail = node;
  }
  list->max_size++;
};

void remove_Tail(LinkedList *list) {
  if (list->tail == NULL) {
    return;
  }
  list->max_size--;
};

void remove_Head(LinkedList *list) {
  if (list->head == NULL) {
    return;
  }
  list->max_size--;
};

#define MAX 10

int main() {

  printf("Initializing Nodes for Work....\n");

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

  printLinkedList_From_Head(&nlist);

  printf("sizeof node : %zu , sizeof value: %zu , sizeof data: %zu\n",
         sizeof(nodes[0]), sizeof(nodes[0].value), sizeof(nodes[0].value.data));

  printf("Size of an int %zu\n", sizeof(int));

  Node test;
  float x = 34.34;
  setNodeValue(&test, &x, DOUB);

  printf("sizeof node : %zu , sizeof value: %zu , sizeof data: %zu\n",
         sizeof(test), sizeof(test.value), sizeof(test.value.data));

  printf("Size of an int %zu\n", sizeof(double));

  return 0;
}
