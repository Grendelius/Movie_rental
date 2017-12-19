package servlets;

import models.Uzytkownik;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/panelUzytkownika")
public class PanelUzytkownikaServlet extends HttpServlet {

    /**
     * Metoda sprawdza czy użytkownik jest zalogowany jęsli nie to przenosi go do
     * servletu LoginServlet, w innym przypadku przenosi użytkownika do strony panelUzytkownika.jsp.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Uzytkownik uzytkownik = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        if (uzytkownik == null)
            request.getRequestDispatcher("/login").forward(request, response);
        else
            doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/panelUzytkownika.jsp").forward(request, response);
    }
}
