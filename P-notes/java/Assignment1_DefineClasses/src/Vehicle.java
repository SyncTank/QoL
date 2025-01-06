import java.util.Scanner;

public class Vehicle 
{
  private double tankSize; // initial size of tank
  private double efficiency; // mpg store initial efficiency
  private double fuelInTank = 0; // initial fuel in tank
  
  // Constructor
  public Vehicle()
  {
    Scanner scn = new Scanner(System.in);
    System.out.println("Enter tank size of your car:");
    this.tankSize = scn.nextDouble();

    System.out.println("Enter efficiency of your car:");
    this.efficiency = scn.nextDouble();

    System.out.println("Fuel in Tank = " + this.getFuelInTank());

    System.out.println("Total Capacity in Tank = " + this.getTankSize());

    System.out.println("Fuel Efficiency = " + this.getEfficiency());

    System.out.println("Available Capacity in Tank = " + this.availableTankCapacity());

  }

  // Getters\accessors
  public double getTankSize(){
    return this.tankSize;
  }

  public double getEfficiency(){
    return this.efficiency;
  }

  public double getFuelInTank(){
    return this.fuelInTank;
  }

  public double availableTankCapacity(){
    return this.tankSize - this.fuelInTank;
  }

  // setter\mutator
  public void addPetrol(double gallons){
    if (this.availableTankCapacity() < gallons ){
      return;
    }
    else {
      this.fuelInTank += gallons;
      return;
    }
  }

  public double driveTo(){
    return this.fuelInTank * this.efficiency;
  }

}
