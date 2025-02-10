#include <stdio.h>

int main(int argc, char **argv) {

  int count = 0;
  int pad = 5;
  for (int i = 0; i < 100; i++) {
    printf("%i ", i % pad); // % provides n number of outputs
    count += 1;
    if (count == pad) {
      count = 0;
      printf("\n");
    }
  }

  return 0;
}
