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
import java.util.Arrays;
import java.util.Date;
import java.util.List;
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

        // Ograniczenie treści do 249 znaków
        String patternTresc = ".{1,249}";

        if (tresc != null) {
            if (Pattern.matches(patternTresc, tresc)) {
                Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");

                // Wypełnienie pól nowej Recenzji
                recenzja.setData(new Timestamp(new Date().getTime()));
                recenzja.setIdFilmu(idFilmu);
                recenzja.setIdUzytkownika(zalogowany.getIdUzytkownika());
                recenzja.setTresc(checkWordLength(tresc));
                // Utworzenie nowej Recenzji
                recenzjaDAO.addRecenzje(recenzja);
            } else
                request.setAttribute("blad", "Błędna długość recenzji (od 1 do 249 znaków)!");
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
            recenzja.setTresc(checkWordLength(trescEdycji));
            recenzjaDAO.updateRecenzje(recenzja);
        } else
            request.setAttribute("blad", "Błędna długość recenzji (od 1 do 249 znaków)!");

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/filmInfo").forward(request, response);
    }

    /**
     * Metoda Sprawdza czy wyrazy w recenzji nie są dłuższe niż 38 znaków (ograniczenie szerokości strony),
     * jeżeli tak to są one przedzielane białymi znakami co 38 znaków.
     */
    private String checkWordLength(String tresc) {
        String[] word = tresc.split(" ");
        List<String> words = Arrays.asList(word);
        int counter, a;
        for (int i = 0; i < words.size(); i++) {
            words.set(i, words.get(i) + " ");
            if (words.get(i).length() > 38) {
                counter = words.get(i).length() / 38;
                a = 38;
                for (int j = 0; j < counter; j++) {

                    words.set(i, words.get(i).substring(0, a) + " " + words.get(i).substring(a));
                    a += 39;
                }
            }
        }
        return String.join("", words);
    }


}
