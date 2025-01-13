import java.util.Scanner;

public class main {
  public static void main(String[] args){
    System.out.println("Assignement 2\n");

    Scanner scn = new Scanner(System.in);

    Plane bo777 = new Plane();

    Plane air89 = new Plane(bo777);

    System.out.println(bo777.equals(air89));
    System.out.println("Air89 "+"\n"+ air89.toString());

    System.out.println("You will be selecting seats for Airplane bo777");
    System.out.println(bo777.toString());

    System.out.println("You will input the seat selection using the row number and then the seat letter (ex - 3B)\nPlease enter the seat number or Q to quit.");

    String option = "";
    while(true){
      option = scn.nextLine().toLowerCase();
      if (option.equals("q")){
        break;
      } else if (option.length() != 2 ){
        System.out.println("Invaild please input a vaild 2 characters i.e 3E or Q");
        continue;
      }

      char r = option.charAt(0);
      int row = 0;
      if (Character.isDigit(r)){
        row = r - '0'; 
      } else {
        System.out.println("Invaild please input a vaild 2 characters i.e 3E or Q");
        continue;
      }

      char c = Character.toUpperCase(option.charAt(1));
      if(row > 0 && row <= bo777.rowsLength() && bo777.vaildSeat(c)){
        bo777.crossSeat(row, c);
      } else {
        System.out.println("Invaild please input a 2 characters i.e 3E or Q");
        continue;
      }

      System.out.println(bo777.toString());
      System.out.println("Please enter the seat number or Q to quit");
    }

    scn.close();
  }
}
