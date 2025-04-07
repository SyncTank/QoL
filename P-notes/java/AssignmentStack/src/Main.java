import java.util.Scanner;
import java.util.Stack;
import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
      System.out.println("Assignment 10\n");
      Scanner scn = new Scanner(System.in);
      Stack<String> stack = new Stack<>();
      Map<String, String> pairs = new HashMap<String, String>();
      pairs.put("[","]");
      pairs.put("{","}");
      pairs.put("(",")");

      // [ ( ] ) not balanced
      // [()]{}{[()()]()} balanced
      // [ peek ] pop [ peek ) 
    // [ peek ( peek ) pop peek ] pop 

      System.out.println("Enter the parenthese expression:");
      String readIn = scn.nextLine();
      String[] items = readIn.split("");

      System.out.println(readIn);
      stack.push("11");
      stack.push("11");

      for (String item : items){
        System.out.println("item " + item + " " + stack.peek() + " " + pairs.get(stack.peek()));
        if (stack.isEmpty()){
          stack.push(item);
        } else if(pairs.get(stack.peek()) == item){
          System.out.println("pop");
          stack.pop();
        } else {
          stack.push(item);
        }
      }
      System.out.println(stack);

      if (stack.isEmpty()){
        System.out.println("Balanced");
      } else {
        System.out.println("Not Balanced");
      }
  }
}
