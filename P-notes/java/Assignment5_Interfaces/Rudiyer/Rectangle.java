public class Rectangle implements Shape {

  private double Width;
  private double Height;

  public Rectangle(){
    this(0,0);
  }

  public Rectangle(double heigth, double width){
   this.setWidth(width);
   this.setHeight(heigth);
  }

  public Rectangle(Rectangle cpRectangle){
    this(cpRectangle.getWidth(), cpRectangle.getHeight());
  }

  @Override
  public double area(){
    return (this.getWidth() * this.getHeight());
  }

  void setWidth(double w){
    this.Width = w;
  }

  double getWidth(){
    return this.Width;
  }

  void setHeight(double h){
    this.Height = h;
  }

  double getHeight(){
    return this.Height;
  }

}
