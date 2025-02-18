public class Pizza implements FoodItem {
  private final String Name;
  private final String Description;
  private final double Price;

  public Pizza(){
    this("CheesePizza", "Pizza with Cheese", 10.0);
  }
  
  public Pizza(String name, String Description, double price){
    if (price < 0) {
      throw new IllegalArgumentException("Price cannot be negative.");
    }
    this.Name = name;
    this.Description = Description;
    this.Price = price;
  }

  public Pizza(Pizza cpPizza){
    this(cpPizza.getName(), cpPizza.getDescription(), cpPizza.getPrice());
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
