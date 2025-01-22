#include <stdio.h>
#include <stdlib.h>

typedef struct {
  char *memory;
  size_t size;
  size_t used;
} Arena;

void arena_init(Arena *arena, size_t size) {
  arena->memory = (char *)malloc(size);
  arena->size = size;
  arena->used = 0;
}

void *arena_alloc(Arena *arena, size_t size) {
  if (arena->used + size > arena->size) {
    return NULL; // Not enough memory
  }
  void *ptr = arena->memory + arena->used;
  arena->used += size;
  return ptr;
}

void arena_reset(Arena *arena) { arena->used = 0; }

void arena_free(Arena *arena) {
  free(arena->memory);
  arena->memory = NULL;
  arena->size = 0;
  arena->used = 0;
}

int main() {
  Arena arena;
  arena_init(&arena, 1024); // Initialize arena with 1KB of memory

  // Allocate memory for 10 integers
  int *numbers = (int *)arena_alloc(&arena, 10 * sizeof(int));
  if (numbers) {
    for (int i = 0; i < 10; i++) {
      numbers[i] = i;
      printf("%d ", numbers[i]);
    }
    printf("\n");
  }

  // Allocate memory for a string
  char *message = (char *)arena_alloc(&arena, 50 * sizeof(char));
  if (message) {
    snprintf(message, 50, "Hello, Arena Allocator!");
    printf("%s\n", message);
  }

  // Reset the arena for reuse
  arena_reset(&arena);

  // Allocate memory for another set of integers
  int *more_numbers = (int *)arena_alloc(&arena, 5 * sizeof(int));
  if (more_numbers) {
    for (int i = 0; i < 5; i++) {
      more_numbers[i] = i * 2;
      printf("%d ", more_numbers[i]);
    }
    printf("\n");
  }

  // Free the arena memory
  arena_free(&arena);

  return 0;
}
