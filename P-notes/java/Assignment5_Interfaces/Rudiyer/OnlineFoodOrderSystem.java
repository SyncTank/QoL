public class OnlineFoodOrderSystem {
  public static void main(String[] args){
    System.out.println("Assignment 5");
    try {

    System.out.println("\nTask 2\n");

    FoodOrder order = new FoodOrder();

    Burger item1 = new Burger("Burger", "Combo", 9.99);
    Pizza item2 = new Pizza("Pizza", "Large", 12.99);
    Salad item3 = new Salad("Salad", "Casear", 6.49);

    order.addItem(item1);
    order.addItem(item2);
    order.addItem(item3);

    order.displayOrderDetails();

    System.out.println("");

    order.addItem(null);

    // Calculating and displaying total cost of an empty order
    FoodOrder emptyOrder = new FoodOrder();
    emptyOrder.calculateTotal();
    emptyOrder.displayOrderDetails();

    } catch (IllegalArgumentException e){
      System.out.println("Error: " + e.getMessage());
    }
  }
}
