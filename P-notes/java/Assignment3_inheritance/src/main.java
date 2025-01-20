public class Main {
    public static void main(String[] args) {
        System.out.println("Assignment 3\n");

        // Create 3 patients, doctors, billing records
        Doctor[] Docs = {
            new Doctor("Joe", new Date(11, 02, 1996), 25000, "Pediatrician", 10.5),
            new Doctor("Mary", new Date(06, 11, 1992), 45260, "Kidney", 150.5),
            new Doctor("Sue", new Date(01, 03, 1986), 650300, "Surgeon", 95.5)
        };

        Patient[] Pats = {
            new Patient("Harry", Docs[0]),
            new Patient("Carl", Docs[1]),
            new Patient("Mimi", Docs[2])
        };

        Billing[] records = {
          new Billing(2, Pats[0].getPrimaryPhysician(), Pats[0]),
          new Billing(1, Pats[1].getPrimaryPhysician(), Pats[1]),
          new Billing(1.78, Pats[2].getPrimaryPhysician(), Pats[2])
        };

        System.out.println("*Physician's Information*");
        for (Doctor Doc : Docs) {
          System.out.println(Doc.toString());
        }

       System.out.println("\n");

        System.out.println("*Patient's Information*");
        for (Patient Pat : Pats){
          System.out.println(Pat.toString());
        }

       System.out.println("\n");

        System.out.println("*Billing's Information*"); // Print billing records
        for (int i = 0; i < 3; i++) {
            System.out.println(records[i].toString());
        }

        // Calculate and print total income
        double totalIncome = 0;
        for (Billing record : records) {
            totalIncome += record.getAmountDue();
        }
        System.out.println("\nThe total Income from biling records is: $" + totalIncome);
    }
}
