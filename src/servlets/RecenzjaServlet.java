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
     * Metoda zarządza również edycją i usuwaniem recenzji.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        String tresc = request.getParameter("tresc");

        // Pobranie danych dotyczących edycji recenzji
        String usun = request.getParameter("usun");
        String edytuj = request.getParameter("edytuj");
        String trescEdycji = request.getParameter("trescEdycji");
        String idRecenzji = request.getParameter("idRecenzji");

        RecenzjaDAO recenzjaDAO = new RecenzjaDAO();
        Recenzja recenzja = new Recenzja();

        // Ograniczenie treści do 255 znaków
        String patternTresc = ".{1,255}";

        if (tresc != null) {
            if (Pattern.matches(patternTresc, tresc)) {
                Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");

                // Wypełnienie pól nowej Recenzji
                recenzja.setData(new Timestamp(new Date().getTime()));
                recenzja.setIdFilmu(idFilmu);
                recenzja.setIdUzytkownika(zalogowany.getIdUzytkownika());
                recenzja.setTresc(tresc);

                // Utworzenie nowej Recenzji
                recenzjaDAO.addRecenzje(recenzja);
            } else
                request.setAttribute("blad", "Błędna długość recenzji (od 1 do 255 znaków)!");
        } else if (usun != null) {
            // Usuwanie recenzji
            recenzjaDAO.deleteRecenzje(recenzjaDAO.getRecenzje(Integer.parseInt(idRecenzji)));
        } else if (edytuj != null) {
            // Przekazanie danych do wyświetlenia formularza do edycji
            request.setAttribute("edytuj", edytuj);
            request.setAttribute("idRec", idRecenzji);
        } else if (trescEdycji != null && Pattern.matches(patternTresc, trescEdycji)) {
            // Edycja recenzji
            recenzja = recenzjaDAO.getRecenzje(Integer.parseInt(idRecenzji));
            recenzja.setTresc(trescEdycji);
            recenzjaDAO.updateRecenzje(recenzja);
        } else
            request.setAttribute("blad", "Błędna długość recenzji (od 1 do 255 znaków)!");

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/filmInfo").forward(request, response);
    }


}
