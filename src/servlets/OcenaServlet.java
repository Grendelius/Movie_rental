package servlets;

import dao.FilmDAO;
import dao.OcenaDAO;
import models.Ocena;
import models.Uzytkownik;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ocena")
public class OcenaServlet extends HttpServlet {

    /**
     * Metoda pobiera Ocenę wystawioną przez użytkownika, dodaje ją do bazy, aktualizuje średnią Ocenę filmu
     * i przenosi użytkownika do strony FilmInfoServlet
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        int ocena = Integer.parseInt(request.getParameter("ocena"));
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        OcenaDAO ocenaDAO = new OcenaDAO();
        FilmDAO filmDAO = new FilmDAO();
        Ocena nowaOcena = new Ocena();

        // Wypełnienie pól nowej Oceny
        nowaOcena.setIdFilmu(idFilmu);
        nowaOcena.setIdUzytkownika(zalogowany.getIdUzytkownika());
        nowaOcena.setOcena(ocena);

        // Utworzenie nowej Oceny
        ocenaDAO.addOcene(nowaOcena);

        // Aktualizacja średniej oceny danego filmu
        filmDAO.updateSredniaOcena(idFilmu);

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/filmInfo").forward(request, response);
    }


}
