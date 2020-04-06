package database;

import entity.Account;
import entity.Discipline;
import entity.Term;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class DBManager {
    private static Connection con;
    private static PreparedStatement modifyDiscipline;
    private static PreparedStatement getAccountByLoginPasswordRole;
    private static PreparedStatement getAllActiveTerm;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_crm?useUnicode=true&serverTimezone=UTC", "root", "");
            modifyDiscipline = con.prepareStatement("UPDATE `discipline` SET `discipline` = ? WHERE (`id` = ?);");
            getAccountByLoginPasswordRole = con.prepareStatement("SELECT * FROM user_role\n" +
                    "left join user on user_role.id_user = user.id\n" +
                    "where user.login = ? and user.password = ? and user_role.id_role = ?;");
            getAllActiveTerm = con.prepareStatement("SELECT * FROM term_discipline as td\n" +
                    "left join term as t on td.id_term = t.id\n" +
                    "left join discipline as d on td.id_discipline = d.id\n" +
                    "where t.status = 1 and d.status = 1 order by td.id_term");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static List<Discipline> GetAllActiveDisciplines() {
        ArrayList<Discipline> disciplines = new ArrayList<Discipline>();
        try {

            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from discipline WHERE status=1");
            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                disciplines.add(discipline);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return disciplines;
    }

    public static void insertNewDiscipline(String newDiscipline) {

        try {
            Statement stm = con.createStatement();
            stm.execute("INSERT INTO `student_crm`.`discipline` (`discipline`) VALUES ('" + newDiscipline + "');");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static Discipline getDisciplineById(String id) {
        Discipline discipline = new Discipline();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from discipline WHERE status = 1 AND id = " + id);
            while (rs.next()) {
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discipline;
    }

    public static void modifyDiscipline(String newDiscipline, String id) {

        try {
            modifyDiscipline.setString(1, newDiscipline);
            modifyDiscipline.setString(2, id);
            modifyDiscipline.execute();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteDiscipline(String ids) {

        try {
            Statement stm = con.createStatement();
            stm.execute("UPDATE `discipline` SET `status` = '0' WHERE (`id` in (" + ids + "));");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean getAccountByLoginPasswordRole(String login, String password, String role) {
        Discipline discipline = new Discipline();
        try {
            getAccountByLoginPasswordRole.setString(1, login);
            getAccountByLoginPasswordRole.setString(2, password);
            getAccountByLoginPasswordRole.setString(3, role);
            ResultSet rs = getAccountByLoginPasswordRole.executeQuery();

            while (rs.next()) {
                return true;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<Term> getAllActiveTerm() {
        LinkedList<Term> terms = new LinkedList<Term>();
        try {
            ResultSet rs = getAllActiveTerm.executeQuery();
            int lastTermId = -1;

            while (rs.next()) {
                if (lastTermId == -1) {
                    Term term = new Term();
                    term.setId(rs.getInt("id_term"));
                    term.setName(rs.getString("name"));
                    term.setDuration(rs.getString("duration"));

                    Discipline discipline = new Discipline();
                    discipline.setId(rs.getInt("id_discipline"));
                    discipline.setDiscipline(rs.getString("discipline"));

                    term.addDiscipline(discipline);
                    terms.add(term);
                    lastTermId = rs.getInt("id_term");
                } else {
                    int currentTermId = rs.getInt("id_term");
                    if (currentTermId == lastTermId) {
                        Discipline discipline = new Discipline();
                        discipline.setId(rs.getInt("id_discipline"));
                        discipline.setDiscipline(rs.getString("discipline"));

                        Term lastTerm = terms.removeLast();
                        lastTerm.addDiscipline(discipline);
                        terms.add(lastTerm);
                        lastTermId = rs.getInt("id_term");
                    } else {
                        Term term = new Term();
                        term.setId(rs.getInt("id_term"));
                        term.setName(rs.getString("name"));
                        term.setDuration(rs.getString("duration"));

                        Discipline discipline = new Discipline();
                        discipline.setId(rs.getInt("id_discipline"));
                        discipline.setDiscipline(rs.getString("discipline"));

                        term.addDiscipline(discipline);
                        terms.add(term);
                        lastTermId = rs.getInt("id_term");

                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return terms;
    }

}
