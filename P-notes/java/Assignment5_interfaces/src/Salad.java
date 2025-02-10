public class Salad implements FoodItem {
  private String Name;
  private String Description;
  private double Price;

  public Salad(){
    this("CasearSalad", "Salad with Cheese", 8.5);
  }
  
  public Salad(String name, String Description, double price){
    this.setName(name);
    this.setDescription(Description);
    this.setPrice(price);
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
