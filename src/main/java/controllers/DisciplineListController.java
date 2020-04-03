package controllers;

import database.DBManager;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisciplinesListController", urlPatterns = "/disciplines")

public class DisciplineListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Discipline> disciplines = DBManager.GetAllActiveDisciplines();

        req.setAttribute("disces", disciplines);
        req.setAttribute("currentPage", "/WEB-INF/jsp/disciplineslistadmin.jsp");
        req.getRequestDispatcher("./WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ids = req.getParameter("idsDeleteDisc");
        DBManager.deleteDiscipline(ids);
        resp.sendRedirect("/disciplines");

    }
}
