package heaps;

public class Heap {
  public static int[] maxheapify(int[] a, int i) {
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    int largest = i;

    if (left < a.length && a[left] > a[largest])
      largest = left;
    if (right < a.length && a[right] > a[largest])
      largest = right;

    if (largest != i) {
      int temp = a[i];
      a[i] = a[largest];
      a[largest] = temp;

      maxheapify(a, largest);
    }
    return a;
  }

  public static int[] buildmaxheap(int[] a) {
    for (int i = (a.length / 2) - 1; i >= 0; i--)
      maxheapify(a, i);
    return a;
  }

  public static int[] heapsort(int[] a) {
    buildmaxheap(a);

    for (int i = a.length - 1; i > 0; i--) {
      int temp = a[0];
      a[0] = a[i];
      a[i] = temp;

      int[] tempArr = new int[i];
      System.arraycopy(a, 0, tempArr, 0, i);
      maxheapify(tempArr, 0);
      System.arraycopy(tempArr, 0, a, 0, i);
    }
    return a;
  }

   public static int[] minheapify(int[] a, int i) {
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    int smallest = i;

    if (left < a.length && a[left] < a[smallest])
      smallest = left;
    if (right < a.length && a[right] < a[smallest])
      smallest = right;

    if (smallest != i) {
      int temp = a[i];
      a[i] = a[smallest];
      a[smallest] = temp;

      minheapify(a, smallest);
    }
    return a;
  }

  public static int[] buildminheap(int[] a) {
    for (int i = (a.length / 2) - 1; i >= 0; i--)
      minheapify(a, i);
    return a;
  }

  public static void main(String[] args) {
    int[] arr = {81, 40, 27, 9, 87, 63, 94, 28, 15, 90};

    System.out.println("Before heapifying:");
    for (int n : arr) System.out.print(n + " ");
    System.out.println();

    buildmaxheap(arr);
    System.out.println("\nAfter building MAX heap:");
    for (int n : arr) System.out.print(n + " ");
    System.out.println();

    heapsort(arr);
    System.out.println("\nAfter heapsort (ascending order):");
    for (int n : arr) System.out.print(n + " ");
    System.out.println();

    int[] arr2 = {81, 40, 27, 9, 87, 63, 94, 28, 15, 90};

    buildminheap(arr2);
    System.out.println("\nAfter building MIN heap:");
    for (int n : arr2) System.out.print(n + " ");
    System.out.println();
  }
}

