import java.util.*;

public class BSTChecker {
   public static BSTNode checkBSTValidity(BSTNode rootNode)  {
      if (rootNode == null) {
         return null;
      }
      return validHelper(rootNode, Integer.MIN_VALUE, Integer.MAX_VALUE);
   }

   public static BSTNode validHelper(BSTNode node, int min, int max){
      if (node == null){
         return null;
      }

      if (node.key <= min || node.key >= max) {
         return node;
      }

      //System.out.println(node.key + " " + min + " " + max);

      BSTNode newnode = validHelper(node.left, min, node.key);
      if (newnode != null) return newnode ;

      newnode = validHelper(node.right, node.key, max);
      if (newnode != null) return newnode ;

      return null;
   }
} 
