import java.util.Scanner;
import java.util.Stack;

public class Main {
    public static void main(String[] args) {
      System.out.println("Assignment 10\n");
      Scanner scn = new Scanner(System.in);
      Stack<String> stack = new Stack<>();

      System.out.println("Enter the parenthese expression:");
      String readIn = scn.nextLine();
      String[] items = readIn.split("");

      for (String item : items){
        if (stack.isEmpty()){
          stack.push(item);
        } else if (stack.peek().equals("[") && item.equals("]")) {
          stack.pop();
        } else if (stack.peek().equals("{") && item.equals("}")) {
          stack.pop();
        } else if (stack.peek().equals("(") && item.equals(")")) {
          stack.pop();
        } else {
          stack.push(item);
        }
      }

      if (stack.isEmpty()){
        System.out.println("Balanced");
      } else {
        System.out.println("Not Balanced");
      }
  }
}
