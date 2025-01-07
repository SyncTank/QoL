import java.util.Scanner;

public class main {
  public static void main(String[] args){
    System.out.println("Assignement 1\n");

    Vehicle car = new Vehicle();

    Scanner scn = new Scanner(System.in);
    System.out.println("Enter tank size of your car:");

    car.setTankSize(scn.nextDouble());

    System.out.println("Enter efficiency of your car:");
    car.setEfficiency(scn.nextDouble());

    System.out.println("\nCar 1 Status: \n" + car.toString() + "\nCurrent Capacity: " + car.availableTankCapacity());

    System.out.println("How many gallons of Petrol to add: ");

    double gallons = scn.nextDouble();
    car.addPetrol(gallons);

    scn.close();

    System.out.println("Fuel in Tank = " + car.getFuelInTank() + " gallons");

    System.out.printf("Current Travel distance %.2f miles with available fuel\n\n", car.driveTo());

    Vehicle car2 = new Vehicle(15.5, 25, 10);
    System.out.println("Does car1 equal car2? : " + car.equals(car2.toString()));

    car2.addPetrol(2);
    System.out.printf("Car 2 drives to = %.2f \n\n", car2.driveTo());

    Vehicle car3 = new Vehicle(car2);
    System.out.println("Does car2 equal car3? " + car2.equals(car3));

  }
}
