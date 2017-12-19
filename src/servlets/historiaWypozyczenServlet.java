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
public class historiaWypozyczenServlet extends HttpServlet {
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
        request.getRequestDispatcher("/WEB-INF/views/historiaWypozyczen.jsp").forward(request, response);
    }
}
