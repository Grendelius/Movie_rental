package servlets;

import dao.WypozyczenieDAO;
import models.Uzytkownik;
import models.Wypozyczenie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/historiaWypozyczen")
public class HistoriaWypozyczenServlet extends HttpServlet {

    /**
     * Metoda pobiera historię wypożyczeń użytkownika lub jeśli to pracownik to całą historię wypożyczeń
     * i przekazuje ją do wyświetlenia  do strony historiaWypozyczen.jsp
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();

        if (zalogowany.getRola().equals("klient")) {
            //Pobranie historii wypożyczeń danego klienta
            List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getHistorieWypozyczeniaKlientaList(zalogowany.getIdUzytkownika());
            request.setAttribute("wypozyczenie", wypozyczenie);
        } else if (zalogowany.getRola().equals("pracownik")) {
            //Pobranie historii wypożyczeń wszystkich klientów
            List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getAllHistorieWypozyczeniaList();
            request.setAttribute("wypozyczenie", wypozyczenie);
        }
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("czyHistoriaWypozyczen") == null) {
            request.setAttribute("czyHistoriaWypozyczen", "true");
        }

        request.getRequestDispatcher("/panelUzytkownika").forward(request, response);
    }
}
