public class Billing {
    private double amountDue;
    private Doctor physician;
    private Patient customer;

    // Default Constructor
    public Billing() {
        this(0.0, null, null);
    }

    // Argument Constructor
    public Billing(double amountDue, Doctor physician, Patient customer) {
        this.setPhysician(physician);
        this.setCustomer(customer);
        this.setAmountDue(amountDue);
    }

    // Copy Constructor
    public Billing(Billing cpBilling) {
        this(cpBilling.getAmountDue(), cpBilling.getPhysician(), cpBilling.getCustomer());
    }

    public double getAmountDue() {
        return amountDue;
    }

    public void setAmountDue(double amountDue) {
        this.amountDue = amountDue * this.physician.getFee();
    }

    public Doctor getPhysician() {
        return physician;
    }

    public void setPhysician(Doctor physician) {
        this.physician = physician;
    }

    public Patient getCustomer() {
        return customer;
    }

    public void setCustomer(Patient customer) {
        this.customer = customer;
    }

    // toString
    @Override
    public String toString() {
        return "Patient: " + (customer != null ? customer.getName() : "None") +
    "\nDoctor: " + (physician != null ? physician.getName() : "None") + 
    "\nAmountDue: $" + this.getAmountDue();
    }

    // equals
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Billing eqBilling = (Billing) obj;
        return Double.compare(eqBilling.amountDue, amountDue) == 0 &&
               (physician != null ? physician.equals(eqBilling.physician) : eqBilling.physician == null) &&
               (customer != null ? customer.equals(eqBilling.customer) : eqBilling.customer == null);
    }
}
