public class Salad implements FoodItem {
  private final String Name;
  private final String Description;
  private final double Price;

  public Salad(){
    this("CasearSalad", "Salad with Cheese", 8.5);
  }
  
  public Salad(String name, String Description, double price){
    if (price < 0) {
      throw new IllegalArgumentException("Price cannot be negative.");
    }
    this.Name = name;
    this.Description = Description;
    this.Price = price;
  }

  public Salad(Salad cpSalad){
    this(cpSalad.getName(), cpSalad.getDescription(), cpSalad.getPrice());
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
