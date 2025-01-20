public class Patient extends Person {
    private Doctor primaryPhysician;

    // Default Constructor
    public Patient() {
        this("", null);
    }

    // Argument Constructor
    public Patient(String name, Doctor primaryPhysician) {
        super(name); // Call the constructor of the Person class
        this.primaryPhysician = primaryPhysician;
    }

    // Copy Constructor
    public Patient(Patient cpPatient) {
        super(cpPatient.getName());
        this.primaryPhysician = cpPatient.primaryPhysician;
    }

    public Doctor getPrimaryPhysician() {
        return primaryPhysician;
    }

    public void setPrimaryPhysician(Doctor primaryPhysician) {
        this.primaryPhysician = primaryPhysician;
    }

    // toString
    @Override
    public String toString() {
        return "Name= " + this.getName() + ", Primary Physician= " + (primaryPhysician != null ? primaryPhysician.getName() : "None");
    }

    // equals
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Patient eqPatient = (Patient) obj;
        return this.getName().equals(eqPatient.getName()) && 
               (this.primaryPhysician != null ? this.primaryPhysician.equals(eqPatient.primaryPhysician) : eqPatient.primaryPhysician == null);
    }
}
