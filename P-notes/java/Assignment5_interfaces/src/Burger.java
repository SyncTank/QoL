public class Burger implements FoodItem {
  private String Name;
  private String Description;
  private double Price;

  public Burger(){
    this("CheeseBurger", "Burger with Cheese", 12.0);
  }
  
  public Burger(String name, String Description, double price){
    this.setName(name);
    this.setDescription(Description);
    this.setPrice(price);
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

  void setName(String n){
    this.Name = n;
  }

  void setDescription(String d){
    this.Description = d;
  }

  void setPrice(double p){
    this.Price = p;
  }

}
