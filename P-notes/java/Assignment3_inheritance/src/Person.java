public class Person
{
  private String name;
  // Constructor
  public Person()
  {
    this("");
  }

  // Agrument Constructor
  public Person(String name){
    this.setName(name);
  }
  
  // Copy Constructor
  public Person(Person cpPerson){
    this(cpPerson.getName());
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name){
    this.name = name;
  }

  // toString
  @Override
  public String toString(){
    return "Name=" + this.getName();
  }

  // toEqual
  @Override
  public boolean equals(Object obj){
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    Person eqPerson = (Person) obj;
    return this.name.equals(eqPerson.name);
  }


}
