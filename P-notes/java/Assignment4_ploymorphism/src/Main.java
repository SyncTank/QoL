public class Main {
    public static void main(String[] args) {
      System.out.println("Assignment 4\n");
      Manager ManOne = new Manager(15000.0f, "Mark", "HR");
      Manager ManTwo = new Manager(15000.0f, "Peter", "R&D");
      Clerk ClkOne = new Clerk(10000.0f, "Samual", "HR");
      Clerk ClkTwo = new Clerk(9900.0f, "Bill", "R&D");

      ManOne.display();
      ManTwo.display();
      ClkOne.display();

      if (!ClkOne.equals(ManTwo)) {
        System.out.println(ManOne.getName() + " and " + ClkOne.getName() + " have different Designations\n");
      }

      Employee[] employeeList = {ManOne, ManTwo, ClkOne, ClkTwo};
      int[] deducationList = { 18, 17, 19, 16};

      for (int i = 0; i < employeeList.length; i++) {
        employeeList[i].setPresent(deducationList[i]);
        System.out.println("Enter the number of days Employee E" + employeeList[i].getID() +
        " is Present out of 20: " + employeeList[i].getPresent() );
      }

      System.out.println();
      System.out.println("EmployeeID\tPresent  \tAbsent\t\tDeductions");
      int totalDec = 0;
      for (int i = 0; i < employeeList.length; i++) {
        System.out.println("E" + employeeList[i].getID() + "\t\t" + employeeList[i].getPresent() + "\t\t" + (20 - employeeList[i].getPresent()) + "\t\t$" + employeeList[i].calDeducation());
        totalDec += employeeList[i].calDeducation();
      }

      System.out.println();
      System.out.println("Total Deductions: $" + totalDec);

    }
}
