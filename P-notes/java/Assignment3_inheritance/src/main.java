import java.util.Scanner;

public class main {
  public static void main(String[] args){
    System.out.println("Assignement 3\n");

    // create 3 patients, doctors, bill records.
    Billing[] records = new Billing[3];
    
    Doctor[] Docs = {
      new Doctor("Joe", new Date(11,20,1996), 25000, "Pediatrist", 10.5),
      new Doctor("Mary", new Date(06,11,1992), 45260, "Kideny", 95.5),
      new Doctor("Sue", new Date(01,31,1986), 65030, "Surgeon", 150.2)
    };

    Patient[] Pats = {
      new Patient("Harry", Docs[0]),
      new Patient("Carl", Docs[1]),
      new Patient("Mimi", Docs[2])
    };

    for (int i = 0; i < 3; i++) {
      records[i] = new Billing((i + 1)*1.5, Pats[i].getPrimaryPhysician(), Pats[i]);
    }

    for (int i = 0; i < 3; i++) {
      System.out.println(records[i].toString());
    }

  }
}
