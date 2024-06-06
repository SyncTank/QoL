#include <stdio.h>
#include <stdlib.h>

int main(void) {
  float test = 1;

  for (float i = 0; i < test; i = i + .1) {
    printf("%f\n", i);
  }

  system("pause");

  return 0;
}
