public interface Order {
  void addItem(FoodItem item);
  double calculateTotal();
  void displayOrderDetails();
}
