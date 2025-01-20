public class Doctor extends SalariedEmployee {
  private double fee;
  private String specialty;

    // Default Constructor
    public Doctor() {
        this("", new Date(1, 1, 2000), 0.0f); 
    }

    // Argument Constructor
    public Doctor(String name, Date hireDate, float salary) {
        super(name, hireDate); // Call the constructor of the Employee class
        this.setSalary(salary);
    }

    // Copy Constructor
    public Doctor(Doctor cpDoctor) {
        this(cpSalariedEmployee.getName(), cpSalariedEmployee.getHireDate(), cpSalariedEmployee.getSalary());
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
        Doctor eqDoctor = (Doctor) obj;
        return this.getName().equals(eqSalariedEmployee.getName()) && this.getHireDate().equals(eqSalariedEmployee.getHireDate()) && this.salary == eqSalariedEmployee.getSalary();
    }


}
