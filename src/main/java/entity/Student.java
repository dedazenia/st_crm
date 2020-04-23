package entity;

import java.text.SimpleDateFormat;

public class Student {
    private int id;
    private String surname;
    private String name;
    private String group;
    private String date;

    public Student() {
    }

    public Student(String surname, String name, String group, String date) {
        this.surname = surname;
        this.name = name;
        this.group = group;
        this.date = date;
    }

    public Student(int id, String surname, String name, String group, String date) {
        this.id = id;
        this.surname = surname;
        this.name = name;
        this.group = group;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        SimpleDateFormat fromDB = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat toUser = new SimpleDateFormat("MM/dd/yyyy");

        try {
            toUser.format(fromDB.parse(date));
            String reformattedStr = toUser.format(fromDB.parse(date));
            this.date = reformattedStr;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Student)) return false;

        Student student = (Student) o;

        if (getId() != student.getId()) return false;
        if (getSurname() != null ? !getSurname().equals(student.getSurname()) : student.getSurname() != null)
            return false;
        if (getName() != null ? !getName().equals(student.getName()) : student.getName() != null) return false;
        if (getGroup() != null ? !getGroup().equals(student.getGroup()) : student.getGroup() != null) return false;
        return getDate() != null ? getDate().equals(student.getDate()) : student.getDate() == null;
    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + (getSurname() != null ? getSurname().hashCode() : 0);
        result = 31 * result + (getName() != null ? getName().hashCode() : 0);
        result = 31 * result + (getGroup() != null ? getGroup().hashCode() : 0);
        result = 31 * result + (getDate() != null ? getDate().hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", surname='" + surname + '\'' +
                ", name='" + name + '\'' +
                ", group='" + group + '\'' +
                ", date='" + date + '\'' +
                '}';
    }
}
