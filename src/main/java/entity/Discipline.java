package entity;

public class Discipline {
    private int id;
    private String discipline;
    private int status = 1;
    private int flag;

    public Discipline() {
    }

    public Discipline(int id, String discipline, int status, int flag) {
        this.id = id;
        this.discipline = discipline;
        this.status = status;
        this.flag = flag;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Discipline)) return false;

        Discipline that = (Discipline) o;

        if (getId() != that.getId()) return false;
        if (getStatus() != that.getStatus()) return false;
        if (getFlag() != that.getFlag()) return false;
        return getDiscipline() != null ? getDiscipline().equals(that.getDiscipline()) : that.getDiscipline() == null;
    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + (getDiscipline() != null ? getDiscipline().hashCode() : 0);
        result = 31 * result + getStatus();
        result = 31 * result + getFlag();
        return result;
    }

    @Override
    public String toString() {
        return "Discipline{" +
                "id=" + id +
                ", discipline='" + discipline + '\'' +
                ", status=" + status +
                ", flag=" + flag +
                '}';
    }
}
