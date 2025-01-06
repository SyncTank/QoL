import java.util.Scanner;

public class main {
  public static void main(String[] args){
    System.out.println("Assignement 1");

    Vehicle car = new Vehicle();

    Scanner scn = new Scanner(System.in);

    System.out.println("How much gallons of Petrol to add: ");
    double gallons = scn.nextDouble();
    car.addPetrol(gallons);

    System.out.println("Fuel in Tank = " + car.getFuelInTank() + " gallons");

    System.out.println("Current Travel distance " + car.driveTo() + " miles with available fuel");

  }
}
