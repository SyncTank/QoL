public class Vehicle 
{
  private double tankSize; // initial size of tank
  private double efficiency; // mpg store initial efficiency
  private double fuelInTank; // initial fuel in tank
  private int index;
  private static int ID = 0;
  
  // Constructor
  public Vehicle()
  {
    this(0,0,0);
  }

  // Agrument Constructor
  public Vehicle(double tankSize, double efficiency, double fuelInTank){
    this.index = ID;
    ID += 1;
    this.setTankSize(tankSize);
    this.setEfficiency(efficiency);
    this.setFuelInTank(fuelInTank);
    System.out.println("New car created : ID " + this.getIndex() + "\n" + this.toString() + "\n");
  }
  
  // Copy Constructor
  public Vehicle(Vehicle cpVehicle){
    this(cpVehicle.getTankSize(), cpVehicle.getEfficiency(), cpVehicle.getFuelInTank());
  }

  // toString
  @Override
  public String toString(){
    return "Tank Size = " + this.getTankSize() + 
    ",\nEfficiency = " + this.getEfficiency() + 
    ",\nFuel in Tank = " + this.getFuelInTank() +
    ",\nID = " + this.index;
  }

  // toEqual
  @Override
  public boolean equals(Object obj){
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    Vehicle eqVehicle = (Vehicle) obj;
    if( (this.tankSize == eqVehicle.tankSize) && 
    (this.efficiency == eqVehicle.efficiency) && 
    (this.fuelInTank == eqVehicle.fuelInTank) ){
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

  public int getIndex(){
    return this.index;
  }

  // setter\mutator
  public void setTankSize(double size){
    if (size < 0){
      System.out.println("Invaild Size");
      return;
    }
    this.tankSize = size;
  }

  public void setEfficiency(double efficiency){
    if (efficiency < 0){
      System.out.println("Invaild efficiency");
      return;
    }
    this.efficiency = efficiency;
  }

  public void setFuelInTank(double gallons){
    if (gallons < 0){
      System.out.println("Invaild gallons");
      return;
    }
    this.fuelInTank += gallons;
  }

  // methods\actions
  public void addPetrol(double gallons){
    if (this.availableTankCapacity() < gallons ){
      System.out.println("Invaild operation, gallons to add is more than the Tank's Capacity");
      return;
      //throw new IllegalArgumentException("Gallons to add is more than the Tank's Capacity");
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
