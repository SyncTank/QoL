public class Main {
  public static void main(String[] args) {
    System.out.println("Assignment 5");
    System.out.println("Task 1\n");

    Circle c = new Circle(4); // radius
    Rectangle r = new Rectangle(4,3); // Height, Width
    ShowArea(c);
    ShowArea(r);
  }

  public static void ShowArea(Shape s){
    double area = s.area();
    System.out.println("The area of the shape is " + area);
  }

}
