package entity;

public class Mark {

    private int id;
    private int graduate;
    private String discipline;

    public Mark() {
    }

    public Mark(int id, int graduate, String discipline) {
        this.id = id;
        this.graduate = graduate;
        this.discipline = discipline;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGraduate() {
        return graduate;
    }

    public void setGraduate(int graduate) {
        this.graduate = graduate;
    }

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Mark)) return false;

        Mark mark = (Mark) o;

        if (getId() != mark.getId()) return false;
        if (getGraduate() != mark.getGraduate()) return false;
        return getDiscipline() != null ? getDiscipline().equals(mark.getDiscipline()) : mark.getDiscipline() == null;
    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + getGraduate();
        result = 31 * result + (getDiscipline() != null ? getDiscipline().hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Mark{" +
                "id=" + id +
                ", graduate=" + graduate +
                ", discipline='" + discipline + '\'' +
                '}';
    }
}
