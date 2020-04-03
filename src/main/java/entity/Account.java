package entity;

public class Account {
    private String id;
    private String login;
    private String role;

    public Account() {
    }

    public Account(String id, String login, String role) {
        this.id = id;
        this.login = login;
        this.role = role;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Account)) return false;

        Account account = (Account) o;

        if (!getId().equals(account.getId())) return false;
        if (!getLogin().equals(account.getLogin())) return false;
        return getRole().equals(account.getRole());
    }

    @Override
    public int hashCode() {
        int result = getId().hashCode();
        result = 31 * result + getLogin().hashCode();
        result = 31 * result + getRole().hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id='" + id + '\'' +
                ", login='" + login + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}
