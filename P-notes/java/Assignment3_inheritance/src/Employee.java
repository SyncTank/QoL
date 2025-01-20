public class Employee extends Person {
    private Date hireDate;

    // Default Constructor
    public Employee() {
        this("", new Date(1, 1, 2000)); // Default date
    }

    // Argument Constructor
    public Employee(String name, Date hireDate) {
        super(name); // Call the constructor of the Person class
        this.setHireDate(hireDate);
    }

    // Copy Constructor
    public Employee(Employee cpEmployee) {
        this(cpEmployee.getName(), cpEmployee.getHireDate());
    }

    public Date getHireDate() {
        return this.hireDate;
    }

    public void setHireDate(Date newDate) {
        this.hireDate = new Date(newDate);
    }

    // toString
    @Override
    public String toString() {
        return "Name=" + this.getName() + " Hired: " + this.getHireDate();
    }

    // equals
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Employee eqEmployee = (Employee) obj;
        return this.getName().equals(eqEmployee.getName()) && this.hireDate.equals(eqEmployee.hireDate);
    }
}
