import java.util.Scanner;

public class Bill
{
  public static double RATE = 150.00; // Dollars

  private int hours;
  private int minutes;
  private double fee;

  public void outputBill()
  {
    System.out.println("Bill : " + RATE);
  }

}

