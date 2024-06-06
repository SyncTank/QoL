#include <stdio.h>

int bss_var;

int data_var = 1;

int main(int argc, char **argv) {

  void *stack_var;

  stack_var = (void *)main;

  printf("Hello world!, main is executing at %p\n", stack_var);
  printf("The address (%p) is in our stack frame\n", &stack_var);

  printf("This address (%p) is in our bss section\n", &bss_var);

  printf("This address (%p) is in our data section\n", &data_var);

  getchar();
  return 0;
}
