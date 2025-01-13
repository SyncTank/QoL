public class Plane
{
  private int rows;
  private int columns;
  private int[][] planeSeats;
  private char seats[] = {'X','A','B','C','D','E', 'F', 'G', 'H'};

  // Constructor
  public Plane()
  {
    this(5,5);
  }

  // Agrument Constructor
  public Plane(int rowsSize, int columnsSize){
    if (rowsSize > 8 || columnsSize > 8){
      System.out.println("Invaild row or columns size");
      return;
    }

    this.rows = rowsSize;
    this.columns = columnsSize + 1;
    this.planeSeats = new int[this.rows][this.columns];

    String str = "Row : " + this.rows + " Columns : " + this.columns; 
    System.out.println(str);

    System.out.println("Seats options possible");
    for (int seat = 0; seat < seats.length; seat++){
      System.out.printf(seats[seat] + " ");
    }

    System.out.println("");

    for (int i = 0; i < this.rows; i++){
      this.planeSeats[i][0] = i + 1;
      System.out.printf("%d ", this.planeSeats[i][0]);
      for (int j = 1; j < this.columns; j++){
        this.planeSeats[i][j] = j;
        System.out.printf("%d ", this.planeSeats[i][j]);
      }
      System.out.println();
    }

    System.out.println("");

    System.out.println("\nPlane has landed!");
    System.out.println(this.toString());
  }
  
  // Copy Constructor
  public Plane(Plane cpPlane){
    this(cpPlane.rows, cpPlane.columns - 1);
    for (int i = 0; i < this.rows; i++){
      this.planeSeats[i][0] = cpPlane.planeSeats[i][0];
      for (int j = 1; j < this.columns; j++){
        this.planeSeats[i][j] = cpPlane.planeSeats[i][j];
      }
    }
  }

  // toString
  @Override
  public String toString(){
    String result = "";
    for (int i = 0; i < this.rows; i++){
      result += this.planeSeats[i][0] + " ";
      for(int j = 1; j < this.columns; j++){
        result += this.seatLetter(this.planeSeats[i][j]) + " ";
      }
      result += "\n";
    }
    return result;
  }

  // toEqual
  @Override
  public boolean equals(Object obj){
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    Plane eqVehicle = (Plane) obj;
    for (int i = 0; i < this.rows; i++){
      if (this.planeSeats[i][0] != eqVehicle.planeSeats[i][0]){
        return false;
      }
      for (int j = 1; j < this.columns; j++){
        if(this.planeSeats[i][j] != eqVehicle.planeSeats[i][j]){
          return false;
        }
      }
    }
    return true;
  }

  // Getters\accessors
  int rowsLength(){
    return this.rows;
  }

  int columnsLength(){
    return this.columns;
  }
  
  
  // setter\mutator
  void crossSeat(int row, char seat){
    int toCross = 0;
    for (int i = 0; i < seats.length; i++){
      if (seats[i] == seat){
        toCross = i;
        break;
      }
    }
    this.planeSeats[row-1][toCross] = 0;
  }


  // methods\actions
  char seatLetter(int seat){
    switch(seat){
      case 0:
        return seats[0];
      case 1:
        return seats[1];
      case 2:
        return seats[2];
      case 3:
        return seats[3];
      case 4:
        return seats[4];
      case 5:
        return seats[5];
      case 6:
        return seats[6];
      default:
        System.out.println("Out of bound letters");
        return ' ';
    }
  }
  
  boolean vaildSeat(char seat){
    for (int i = 1; i < seats.length; i++){
        //System.out.printf(seats[i] + " = " + seat + "\n");
      if (seats[i] == seat){
        return true;
      }
    }
    return false;
  }
}
