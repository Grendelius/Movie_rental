package serwlety;

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

@WebServlet("/listaRezerwacji")
public class ListaRezerwacjiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();
        if (zalogowany != null && zalogowany.getRola().equals("klient")) {
            List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getWypozyczeniaKlienta(zalogowany.getIdUzytkownika());
            request.setAttribute("wypozyczenie", wypozyczenie);
            doGet(request, response);
        } else if (zalogowany != null && zalogowany.getRola().equals("pracownik")) {
            List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getAllWypozyczenia();
            request.setAttribute("wypozyczenie", wypozyczenie);
            doGet(request, response);
        } else
            response.sendRedirect(request.getContextPath() + "/login");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/widok/listaRezerwacji.jsp").forward(request, response);
    }
}
