public class Main {
  public static void main(String[] args) {
    System.out.println("Assignment 5");
    System.out.println("Task 1\n");

    Circle c = new Circle(4); // radius
    Rectangle r = new Rectangle(4,3); // Height, Width
    ShowArea(c);
    ShowArea(r);

    System.out.println("\nTask 2\n");

    FoodOrder order = new FoodOrder();

    Burger item1 = new Burger("Burger", "Combo", 9.99);
    Pizza item2 = new Pizza("Pizza", "Large", 12.99);
    Salad item3 = new Salad("Salad", "Casear", 6.49);

    order.addItem(item1);
    order.addItem(item2);
    order.addItem(item3);

    order.displayOrderDetails();
  }

  public static void ShowArea(Shape s){
    double area = s.area();
    System.out.println("The area of the shape is " + area);
  }

}
