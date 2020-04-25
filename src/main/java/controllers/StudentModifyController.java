package controllers;

import database.DBManager;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet(name = "StudentModifyController", urlPatterns = "/student-modify")
public class StudentModifyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStud = req.getParameter("idModifyStudent");
        Student student = DBManager.getStudentById(idStud);
        req.setAttribute("studentos", student);
        req.setAttribute("currentPage", "/WEB-INF/jsp/studentmodify.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idModifyStud = req.getParameter("idModifyStud");
        String firstName = req.getParameter("fName");
        String lastName = req.getParameter("lName");
        String group = req.getParameter("group");
        String date;
        SimpleDateFormat fromUser = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            String reformattedStr = myFormat.format(fromUser.parse(req.getParameter("date")));
            date = reformattedStr;
            DBManager.modifyStudent(firstName, lastName, group, date, idModifyStud);
            resp.sendRedirect("/students");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

