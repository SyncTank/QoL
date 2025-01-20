public class Doctor extends SalariedEmployee {
    private double fee;
    private String specialty;

    // Default Constructor
    public Doctor() {
        super("", new Date(1, 1, 2000), 0.0f);
        this.specialty = "Pediatrician";
        this.fee = 50.0;
    }

    // Argument Constructor
    public Doctor(String name, Date hireDate, float salary, String specialty, double fee) {
        super(name, hireDate, salary); // Call the constructor of the SalariedEmployee class
        this.specialty = specialty;
        this.fee = fee;
    }

    // Copy Constructor
    public Doctor(Doctor cpDoctor) {
        super(cpDoctor.getName(), cpDoctor.getHireDate(), cpDoctor.getSalary());
        this.specialty = cpDoctor.getSpecialty();
        this.fee = cpDoctor.getFee();
    }

    public String getSpecialty() {
        return this.specialty;
    }

    public double getFee() {
        return this.fee;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }

    // toString
    @Override
    public String toString() {
        return "Name=" + this.getName() + " Hired= " + this.getHireDate() + " Salary= " + this.getSalary() + " Specialty= " + this.getSpecialty() + " Fee= " + this.getFee();
    }

    // equals
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Doctor eqDoctor = (Doctor) obj;
        return this.getName().equals(eqDoctor.getName()) && this.getHireDate().equals(eqDoctor.getHireDate()) && this.getSalary() == eqDoctor.getSalary() && this.getSpecialty().equals(eqDoctor.getSpecialty()) && this.getFee() == eqDoctor.getFee();
    }
}
