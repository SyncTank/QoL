public class Manager extends Employee {

  public Manager() {
    this(1500, "bob", "IT");
  }

  public Manager(float salary, String name, String dep) {
    super(salary, name, dep);
    this.setDesignation("Manager");
  }

  public Manager(Manager cpManager) {
    this(cpManager.getSalary(), cpManager.getName(), cpManager.getDepartment());
  }

  @Override
  public float addBonus() {
    return this.getSalary() + 300;
  }

 }
