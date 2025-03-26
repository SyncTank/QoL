import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
      System.out.println("Assignment 8\n");
      Scanner scn = new Scanner(System.in);

      System.out.println("How many people are in the room?");
      int hands = 0;

      hands = scn.nextInt();

      int handshakes = handshake(hands) - hands;
      System.out.println("\nIf everyone shakes hands once, there will be " + handshakes + " handsakes.\n");

      System.out.println("Enter value for n: ");
      int n = scn.nextInt();

      System.out.println("Enter value for r: ");
      int r = scn.nextInt();

      Task2 comb = new Task2(n, r);
      System.out.println("There are " + comb.toString() + " possible combinations.");
  }

  public static int handshake(int hands){
    int results = 0;
    if (hands == 0){
      return results;
    }
    results += handshake(hands - 1);
    return  results + hands;
  }

}
