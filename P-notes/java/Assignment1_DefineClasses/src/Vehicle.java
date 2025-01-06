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
    this.setTankSize(scn.nextDouble());

    System.out.println("Enter efficiency of your car:");
    this.setEfficiency(scn.nextDouble());

    System.out.println("Fuel in Tank = " + this.getFuelInTank());

    System.out.println("Total Capacity in Tank = " + this.getTankSize());

    System.out.println("Fuel Efficiency = " + this.getEfficiency());

    System.out.println("Available Capacity in Tank = " + this.availableTankCapacity());

  }
  
  // Copy Constructor
  public Vehicle(Vehicle cpVehicle){
    if (cpVehicle == null){
      System.out.println("Invaild Vehicle object");
    }
    else{
      this.tankSize = cpVehicle.tankSize;
      this.efficiency = cpVehicle.efficiency;
      this.fuelInTank = cpVehicle.fuelInTank;
    }
  }

  // toString
  public String toString(Vehicle aVehicle){
    return this.getTankSize() + ", " + this.getEfficiency() + ", " + this.getFuelInTank();
  }

  // toEqual
  public boolean equals(Vehicle eqVehicle){
    if( (this.tankSize == eqVehicle.tankSize) && (this.efficiency == eqVehicle.efficiency) && (this.fuelInTank == eqVehicle.fuelInTank) ){
      return true;
    } else {
      return false;
    }
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

  // setter\mutator
  private void setTankSize(double size){
    this.tankSize = size;
  }

  private void setEfficiency(double efficiency){
    this.efficiency = efficiency;
  }

  private void setFuelInTank(double gallons){
    this.fuelInTank += gallons;
  }

  // methods\actions
  public void addPetrol(double gallons){
    if (this.availableTankCapacity() < gallons ){
      throw new IllegalArgumentException("Gallons to add is more than the Tank's Capacity");
    }
    else {
      this.setFuelInTank(gallons);
      return;
    }
  }

  public double driveTo(){
    return this.fuelInTank * this.efficiency;
  }

  public double availableTankCapacity(){
    return this.tankSize - this.fuelInTank;
  }
}
