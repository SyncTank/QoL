public class Date {
    private int day;
    private int month;
    private int year;

    // Argument Constructor
    public Date(int day, int month, int year) {
        this.day = day;
        this.month = month;
        this.year = year;
    }

    // Copy Constructor
    public Date(Date cpDate) {
        this(cpDate.getDay(), cpDate.getMonth(), cpDate.getYear());
    }

    public int getDay() {
        return this.day;
    }

    public int getMonth() {
        return this.month;
    }

    public int getYear() {
        return this.year;
    }

    // toString
    @Override
    public String toString() {
        return this.getMonth() + "/" + this.getDay() + "/" + this.getYear();
    }

    // equals
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Date eqDate = (Date) obj;
        return day == eqDate.day && month == eqDate.month && year == eqDate.year;
    }
}
