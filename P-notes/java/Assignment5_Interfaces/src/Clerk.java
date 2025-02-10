public class Clerk extends Employee {

  public Clerk() {
    this(1500, "bob", "IT");
  }

  public Clerk(float salary, String name, String dep) {
    super(salary, name, dep);
    this.setDesignation("Clerk");
  }

  public Clerk(Clerk cpClerk) {
    this(cpClerk.getSalary(), cpClerk.getName(), cpClerk.getDepartment());
  }

  @Override
  public float addBonus() {
    return this.getSalary() + 100;
  }

  @Override
  public float calDeducation() {
    int totalWorkDays = 20;
    float dailySalary = this.addBonus() / totalWorkDays;
    return (dailySalary * (totalWorkDays - this.getPresent()));
  }

 }
