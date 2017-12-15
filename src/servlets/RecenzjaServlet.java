package servlets;

import dao.RecenzjaDAO;
import models.Recenzja;
import models.Uzytkownik;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.regex.Pattern;

@WebServlet("/recenzja")
public class RecenzjaServlet extends HttpServlet {

    /**
     * Metoda pobiera Recenzję wystawioną przez użytkownika, dodaje ją do bazy i przenosi użytkownika do strony FilmInfoServlet
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String tresc = request.getParameter("tresc");
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        RecenzjaDAO recenzjaDAO = new RecenzjaDAO();

        // Ograniczenie treści do 255 znaków
        String patternTresc = ".{1,255}";

        if (tresc != null) {
            if (Pattern.matches(patternTresc, tresc)){
                Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
                Recenzja recenzja = new Recenzja();

                // Wypełnienie pól nowej Recenzji
                recenzja.setData(new Timestamp(new Date().getTime()));
                recenzja.setIdFilmu(idFilmu);
                recenzja.setIdUzytkownika(zalogowany.getIdUzytkownika());
                recenzja.setTresc(tresc);

                // Utworzenie nowej Recenzji
                recenzjaDAO.addRecenzje(recenzja);
            }
            else
                request.setAttribute("blad", "Zbyt długa treść recenzji (do 255 znaków)!");
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/filmInfo").forward(request, response);
    }


}
