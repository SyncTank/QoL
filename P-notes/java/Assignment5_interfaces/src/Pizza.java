public class Pizza implements FoodItem {
  private String Name;
  private String Description;
  private double Price;

  public Pizza(){
    this("CheesePizza", "Pizza with Cheese", 10.0);
  }
  
  public Pizza(String name, String Description, double price){
    this.setName(name);
    this.setDescription(Description);
    this.setPrice(price);
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
