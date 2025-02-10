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
        this.FoodList.add(item);
    }

    @Override
    public double calculateTotal() {
        double result = 0;
        for (FoodItem food : FoodList) {
            result += food.getPrice();
        }
        return result;
    }

    @Override
    public void displayOrderDetails() {
        System.out.println("Order Details: \n");
        for (FoodItem food : FoodList) {
            System.out.println(food.getName() + " " +
            food.getDescription() + " " +
            "$" + food.getPrice());
        }
        System.out.println("\nTotal Cost: $" + this.calculateTotal());
    }
}
