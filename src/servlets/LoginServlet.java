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

    /**
     * Metoda przenosi użytkownika do strony logowania login.jsp.
     * Po wprowadzeniu danych logowania sprawdza ich poprawność, zalogowuje użytkownika i przenosi go do strony
     * StronaGlownaServlet. W razie błędnego wprowadzenia danych metoda ponownie przenosi użytkownika do strony logowania login.jsp.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        String login = request.getParameter("login");
        String haslo = request.getParameter("haslo");
        if (login != null && haslo != null && !"".equals(haslo)) {
            try {
                UzytkownicyDAO dao = new UzytkownicyDAO();
                Uzytkownik u = dao.getUzytkownikPoLoginie(login);
                if (u.getHaslo().equals(dao.getMD5(haslo))) {

                    //Tworzenie sesji użytkownika
                    HttpSession session = request.getSession();
                    session.setAttribute("uzytkownik", u);
                    request.setAttribute("czyLogin",null);
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
        if(request.getAttribute("czyLogin")==null) {
            request.setAttribute("czyLogin", "true");
        }
        request.getRequestDispatcher("/stronaGlowna").forward(request, response);
    }


}



