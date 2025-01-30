public class Employee {
  static private int ID = 0;
  private int EmployeeID = 0;
  private int Present;
  private float Salary;
  private float Deducation;
  private String Name;
  private String Department;
  private String Designation = "Employee";

  // Default Constructor
  public Employee(){
    this(10.0f, "Bob", "IT");
  }

  // Argument Constructor
  public Employee(float salary, String name, String dep) {
    this.setID();
    this.setSalary(salary);
    this.setName(name);
    this.setDepartment(dep);
  }

  // Copy Constructor
  public Employee(Employee cpEmployee) {
    this(cpEmployee.getSalary(), cpEmployee.getName(), cpEmployee.getDepartment());
  }

  // setters | getters
  private void setID() {
    this.EmployeeID = ID + 1;
    ID++;
  }

  public int getID() {
    return this.EmployeeID;
  }

  public void setSalary(float salary) {
    this.Salary = salary;
  }

  public float getSalary() {
    return this.Salary;
  }

  public void setName(String name) {
    this.Name = name;
  }

  public String getName() {
    return this.Name;
  }

  public void setDepartment(String dep) {
    this.Department = dep;
  }

  public String getDepartment() {
    return this.Department;
  }

  public void setDesignation(String design) {
    this.Designation = design;
  }

  public String getDesignation() {
    return this.Designation;
  }

  public void setPresent(int presnt) {
    this.Present = presnt;
  }

  public int getPresent() {
    return this.Present;
  }

  public float calDeducation() {
    int totalWorkDays = 20;
    float dailySalary = this.addBonus() / totalWorkDays;
    return (dailySalary * (totalWorkDays - this.Present));
  }

  // toString
  @Override
  public String toString() {
    return "Name=" + this.getName();
  }

  // equals
  @Override
  public boolean equals(Object other) {
    if (this == other) return true;
    if (other == null || getClass() != other.getClass()) return false;
    Employee eqEmployee = (Employee) other;
      return this.getDesignation().equals(eqEmployee.getDesignation());
  }

  // Actions
  public float addBonus() {
    return this.getSalary() + 200;
  }

  public void display() {
    System.out.println("EmployeeID: " + "E" + this.getID() +
      "\nEmployee Name: " + this.getName() +
      "\nDepartment Name: " + this.getDepartment() +
      "\nSalary: " + this.getSalary() +
      "\nDesignation: " + this.getDesignation() +
      "\nSalary after adding the bonus is: " + this.addBonus() + "\n");
  }

}
