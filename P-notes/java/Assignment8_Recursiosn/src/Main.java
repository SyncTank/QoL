import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
      System.out.println("Assignment 8\n");
      Scanner scn = new Scanner(System.in);

      System.out.println("How many people are in the room?");
      int hands = 0;

      hands = scn.nextInt();

      int handshakes = handshake2(hands);
      System.out.println("If everyone shakes hands once, there will be " + handshakes + " handsakes.");
  }

  public static int handshake(int hands){
    int results = (hands * (hands - 1)) / 2;
    return results;
  }

  public static int handshake2(int hands){
    int results = 0;
    if (hands == 0){
      return results;
    }
    System.out.println(results + " " + hands);
    results += handshake2(hands-1);
    return  results;
  }

}
