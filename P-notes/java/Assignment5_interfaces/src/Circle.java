public class Circle implements Shape {

  private double radius;

  public Circle(){
    this(0);
  }

  public Circle(double r){
    this.setRadius(r);
  }

  public Circle(Circle cpCircle){
    this(cpCircle.getRadius());
  }

  @Override
  public double area(){
    return (this.getRadius() * this.getRadius()) * Math.PI;
  }

  void setRadius(double r){
    this.radius = r;
  }

  double getRadius(){
    return this.radius;
  }

}
