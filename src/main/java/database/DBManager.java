package database;

import entity.Account;
import entity.Discipline;
import entity.Student;
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

    public static List<Discipline> getAllActiveDisciplines() {
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

    public static void deleteTerm(String id) {
        try {
            Statement stm = con.createStatement();
            stm.execute("UPDATE `student_crm`.`term` SET `status` = '0' WHERE (`id` = '" + id + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static List<Discipline> showDisciplinesForSelectTerm(String idTerm) {
        List<Discipline> disciplines = new LinkedList<Discipline>();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM term_discipline  as td\n" +
                    "left join discipline as d on td.id_discipline = d.id\n" +
                    "where td.id_term=" + idTerm + " and td.status = 1 and d.status = 1;");

            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt(5));
                discipline.setDiscipline(rs.getString(6));
                disciplines.add(discipline);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return disciplines;
    }

    public static String createTerm(String nameDisc, String duration) {
        String id = "";
        try {
            Statement stm = con.createStatement();
            stm.execute("INSERT INTO `term` (`name`, `duration`) VALUES ('" + nameDisc + "', '" + duration + "');");
            ResultSet rs = stm.executeQuery("SELECT * FROM term where term.name = '" + nameDisc + "';");
            while (rs.next()) {
                id = Integer.toString(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public static void modifyTerm(String termId, String termName, String duration, String oldIds, String newIds) {
        try {
            Statement stm = con.createStatement();
            stm.execute("UPDATE term SET `name` = '" + termName + "', `duration` = '" + duration + "' WHERE (`id` = '" + termId + "');");
            for (String oldId : oldIds.split(",")) {
                boolean got = false;
                for (String newId : newIds.split(",")) {
                    if (oldId == newId) {
                        got = true;
                        break;
                    }
                }
                if (!got) {
                    stm.execute("UPDATE term_discipline SET status = '0' WHERE id_term = '" + termId + "' and id_discipline = '" + oldId + "';");
                }
            }
            for (String newId : newIds.split(",")) {
                boolean got = false;
                for (String oldId : oldIds.split(",")) {
                    if (oldId == newId) {
                        got = true;
                        break;
                    }
                }
                if (!got) {
                    stm.execute("INSERT INTO term_discipline (`id_term`, `id_discipline`) VALUES ('" + termId + "', '" + newId + "');");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void addDisciplinesInNewTerm(String termId, String idDisc) {
        try {
            Statement stm = con.createStatement();
            for (String idsDisc1 : idDisc.split(",")) {
                System.out.println(idsDisc1);
                stm.execute("INSERT INTO `term_discipline` (`id_term`, `id_discipline`) VALUES ('" + termId + "', '" + idsDisc1 + "');");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Term getTerm(String idTerm) {
        Term term = new Term();
        try {
            Statement stm = con.createStatement();
            Statement stm1 = con.createStatement();
            ResultSet rs1 = stm1.executeQuery("SELECT * FROM term where id=" + idTerm + ";");
            term.setId(rs1.getInt(1));
            term.setName(rs1.getString(2));
            term.setDuration(rs1.getString(3));

            List<Discipline> disciplines = DBManager.getAllActiveDisciplines();
            ResultSet rs = stm.executeQuery("SELECT id_discipline FROM term_discipline  as td where  td.id_term = " + idTerm + " order by td.id_term;");
            for (Discipline disc : disciplines) {
                while (rs.next()) {
                    if (disc.getId() == rs.getInt(1)) {
                        disc.setFlag(1);
                    } else {
                        disc.setFlag(0);
                    }
                    term.addDiscipline(disc);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return term;
    }

    public static Term getTerm1(String idTerm, String oldIds) {
        Term term = new Term();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM term where  term.id = '" + idTerm + "';");
            while (rs.next()) {
                term.setId(rs.getInt(1));
                term.setName(rs.getString(2));
                term.setDuration(rs.getString(3));
            }
            List<Discipline> disciplines = DBManager.getAllActiveDisciplines();
            for (Discipline disc : disciplines) {
                for (String s : oldIds.split(",")) {
                    if (Integer.parseInt(s) == disc.getId()) {
                        disc.setFlag(1);
                        break;
                    }
                }
                term.addDiscipline(disc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return term;
    }
    public static List<Student> getAllStudents() {
        ArrayList<Student> students = new ArrayList<Student>();
        try {
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM student WHERE `status`=1 ");
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt(1));
                student.setName(rs.getString(2));
                student.setSurname(rs.getString(3));
                student.setGroup(rs.getString(4));
                student.setDate(rs.getString(5));
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }
    public static void deleteStudent(String ids) {
        try {
            Statement stm = con.createStatement();
            stm.execute("UPDATE `student` SET `status` = '0' WHERE (`id` in (" + ids + "));");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void insertNewStudent(String firstName, String lastName, String group, String date) {

        try {
            Statement stm = con.createStatement();
            stm.execute("INSERT INTO `student` (`name`, `surname`, `group`, `date`) VALUES ('" + firstName + "', '" + lastName + "', '" + group + "', '" + date + "');");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
