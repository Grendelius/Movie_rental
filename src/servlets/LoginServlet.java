package servlets;

import dao.UzytkownicyDAO;
import models.Uzytkownik;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String login = request.getParameter("login");
        String haslo = request.getParameter("haslo");
        if (login != null && haslo != null && !"".equals(haslo)) {
            try {
                UzytkownicyDAO dao = new UzytkownicyDAO();
                Uzytkownik u = dao.getPoLoginie(login);
                if (u.getHaslo().equals(dao.getMD5(haslo))) {
                    HttpSession session = request.getSession();
                    session.setAttribute("uzytkownik", u);
                    response.sendRedirect(request.getContextPath() + "/stronaGlowna");
                } else {
                    request.setAttribute("blad", "Podałeś błędne hasło!");
                    doGet(request, response);
                }
            } catch (NoResultException e) {
                request.setAttribute("blad", "Nie ma takiego uzytkownika!");
                doGet(request, response);
            }
        } else {
            request.setAttribute("blad", "Błąd danych logowania!");
            doGet(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/views/login.jsp").forward(request, response);
    }


}



