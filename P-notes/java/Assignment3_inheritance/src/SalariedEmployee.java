public class SalariedEmployee extends Employee {
    private float salary;

    // Default Constructor
    public SalariedEmployee() {
        this("", new Date(1, 1, 2000), 0.0f); 
    }

    // Argument Constructor
    public SalariedEmployee(String name, Date hireDate, float salary) {
        super(name, hireDate); // Call the constructor of the Employee class
        this.setSalary(salary);
    }

    // Copy Constructor
    public SalariedEmployee(SalariedEmployee cpSalariedEmployee) {
        this(cpSalariedEmployee.getName(), cpSalariedEmployee.getHireDate(), cpSalariedEmployee.getSalary());
    }

    public float getSalary() {
        return this.salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    // toString
    @Override
    public String toString() {
        return "Name=" + this.getName() + " Hired= " + this.getHireDate() + " Salary= " + this.getSalary();
    }

    // equals
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        SalariedEmployee eqSalariedEmployee = (SalariedEmployee) obj;
        return this.getName().equals(eqSalariedEmployee.getName()) && this.getHireDate().equals(eqSalariedEmployee.getHireDate()) && this.salary == eqSalariedEmployee.getSalary();
    }
}
