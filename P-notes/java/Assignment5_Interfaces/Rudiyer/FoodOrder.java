import java.util.ArrayList;

public class FoodOrder implements Order {
    private ArrayList<FoodItem> FoodList;

    // Default constructor to initialize the FoodList
    public FoodOrder() {
        this.FoodList = new ArrayList<FoodItem>();
    }

    // Copy constructor
    public FoodOrder(FoodOrder cpFoodOrder) {
        this();
        for (int i = 0; i < cpFoodOrder.getCapacity(); i++) {
            FoodList.add(cpFoodOrder.getItem(i));
        }
    }

    public FoodItem getItem(int index) {
        return this.FoodList.get(index);
    }

    public int getCapacity() {
        return this.FoodList.size();
    }

    @Override
    public void addItem(FoodItem item) {
      if (item == null) {
        System.out.println("Error: Cannot add a null food item.");
        return;
      }
      this.FoodList.add(item);
    }

    @Override
    public double calculateTotal() {
      double result = 0;
      if (this.FoodList.isEmpty()) {
        System.out.println("Warning: The order is empty. Total cost is $0.00.");
        return 0.0;
      }
      for (FoodItem food : this.FoodList) {
        result += food.getPrice();
      }
      return result;
    }

    @Override
    public void displayOrderDetails() {
      if (this.FoodList.isEmpty()) {
        System.out.println("The order is empty. Please add items.");
        return;
      }
        System.out.println("Order Details: \n");
        for (FoodItem food : this.FoodList) {
            System.out.println(food.getName() + " " +
            food.getDescription() + " " +
            "$" + food.getPrice());
        }
        System.out.println("\nTotal Cost: $" + this.calculateTotal());
    }
}
