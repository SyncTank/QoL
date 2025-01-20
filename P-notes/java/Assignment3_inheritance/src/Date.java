import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.ZoneId;
import java.time.ZonedDateTime;

public class Date {
    private LocalDateTime dateTime;

    // Argument Constructor
    public Date(int day, int month, int year) {
        this.dateTime = LocalDateTime.of(year, month, day, 0, 0);
    }

    // Copy Constructor
    public Date(Date cpDate) {
        this.dateTime = cpDate.dateTime;
    }

    public int getDay() {
        return this.dateTime.getDayOfMonth();
    }

    public int getMonth() {
        return this.dateTime.getMonthValue();
    }

    public int getYear() {
        return this.dateTime.getYear();
    }

    // toString
    @Override
    public String toString() {
        ZonedDateTime zonedDateTime = dateTime.atZone(ZoneId.systemDefault());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM dd yyyy z");
        return zonedDateTime.format(formatter);
    }

    // equals
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Date eqDate = (Date) obj;
        return dateTime.equals(eqDate.dateTime);
    }
}
