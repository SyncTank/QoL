public class Burger implements FoodItem {
  private final String Name;
  private final String Description;
  private final double Price;

  public Burger(){
    this("CheeseBurger", "Burger with Cheese", 12.0);
  }
  
  public Burger(String name, String Description, double price){
    if (price < 0) {
      throw new IllegalArgumentException("Price cannot be negative.");
    }
    this.Name = name;
    this.Description = Description;
    this.Price = price;
  }

  public Burger(Burger cpBurger){
    this(cpBurger.getName(), cpBurger.getDescription(), cpBurger.getPrice());
  }

  @Override
  public String getName(){
    return this.Name;
  }

  @Override
  public String getDescription(){
    return this.Description;
  }

  @Override
  public double getPrice(){
    return this.Price;
  }
}
