import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("Assignment 6\n");
        Scanner scn = new Scanner(System.in);

        String dataStr = "";
        String[] data = new String[3];
        boolean isDone = false;

        while (!isDone) {
            try {
                System.out.println("Enter a date to parse (MM/DD/YYYY format):");

                if (scn.hasNextLine()) {
                    dataStr = scn.nextLine();
                } else {
                    throw new IllegalArgumentException("No input provided.");
                }

                data = dataStr.split("/");

                if (data.length != 3) {
                    throw new IllegalArgumentException("Invalid date format. Please use MM/DD/YYYY.");
                }

                if (!isNumeric(data[0]) || !isNumeric(data[1]) || !isNumeric(data[2])) {
                    throw new IllegalArgumentException("Date components must be numeric.");
                }

                boolean testYear = yearChecker(data[2]);
                boolean testMonth = monthChecker(data[0]);
                boolean testDay = dayChecker(data[0], data[1], data[2]);

                if (testYear && testMonth && testDay) {
                    isDone = true;
                }

            } catch (YearException e) {
                System.out.println(e.getMessage());
            } catch (MonthException e) {
                System.out.println(e.getMessage());
            } catch (DayException e) {
                System.out.println(e.getMessage());
            }
        }
        String month = swapMonth(data[0]);
        System.out.println("Parsed date: " + month + " " + data[1] + ", " + data[2]);
        scn.close();
    }

    public static String swapMonth(String month) {
      int number = Integer.parseInt(month);
      String monthName;

    switch (number) {
        case 1:
            monthName = "January";
            break;
        case 2:
            monthName = "February";
            break;
        case 3:
            monthName = "March";
            break;
        case 4:
            monthName = "April";
            break;
        case 5:
            monthName = "May";
            break;
        case 6:
            monthName = "June";
            break;
        case 7:
            monthName = "July";
            break;
        case 8:
            monthName = "August";
            break;
        case 9:
            monthName = "September";
            break;
        case 10:
            monthName = "October";
            break;
        case 11:
            monthName = "November";
            break;
        case 12:
            monthName = "December";
            break;
        default:
            throw new IllegalArgumentException("Invalid month number: " + month);
      }
      return monthName;
    }

    public static boolean yearChecker(String year) throws YearException {
        int number = Integer.parseInt(year);
        if (number < 1000 || number > 3000) {
            throw new YearException("Invalid year. Reenter a valid year:");
        }
        return true;
    }

    public static boolean isNumeric(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean monthChecker(String month) throws MonthException {
        int number = Integer.parseInt(month);
        if (number < 1 || number > 12) {
            throw new MonthException("Invaild Month. Reenter a valid month:");
        }
        return true;
    }

    public static boolean dayChecker(String month, String day, String year) throws DayException {
        int yearNumber = Integer.parseInt(year);
        int dayNumber = Integer.parseInt(day);
        int monthNumber = Integer.parseInt(month);

        if (dayNumber < 1) {
            throw new DayException("Invaild day. Reenter a valid day:");
        }

        switch (monthNumber) {
            case 1: // January
            case 3: // March
            case 5: // May
            case 7: // July
            case 8: // August
            case 10: // October
            case 12: // December
                if (dayNumber > 31) {
                    throw new DayException("Invaild day. Reenter a valid day:");
                }
                break;
            case 4: // April
            case 6: // June
            case 9: // September
            case 11: // November
                if (dayNumber > 30) {
                    throw new DayException("Invaild day. Reenter a valid day:");
                }
                break;
            case 2: // February
                if (isLeapYear(yearNumber)) {
                    if (dayNumber > 29) {
                        throw new DayException("Invaild day. Reenter a valid day:");
                    }
                } else {
                    if (dayNumber > 28) {
                        throw new DayException("Invaild day. Reenter a valid day:");
                    }
                }
                break;
            default:
                throw new DayException("Invalid month. Reenter a valid month:");
        }
        return true;
    }

    public static boolean isLeapYear(int year) {
        if (year % 4 == 0) {
            if (year % 100 == 0) {
                return year % 400 == 0;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }
}
