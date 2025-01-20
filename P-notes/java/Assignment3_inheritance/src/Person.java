public class Person {
    private String name;

    // Default Constructor
    public Person() {
        this("");
    }

    // Argument Constructor
    public Person(String name) {
        this.setName(name);
    }

    // Copy Constructor
    public Person(Person cpPerson) {
        this(cpPerson.getName());
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // toString
    @Override
    public String toString() {
        return "Name=" + this.getName();
    }

    // equals
    public boolean equals(Person other) {
        if (this == other) return true;
        if (other == null) return false;
        return this.name.equals(other.name);
    }
}
