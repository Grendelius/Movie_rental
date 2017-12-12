package servlets;

import dao.FilmDAO;
import dao.GatunekDAO;
import dao.GatunekFilmDAO;
import dao.RecenzjaDAO;
import models.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/filmInfo")
public class FilmInfoServlet extends HttpServlet {

    /**
     * Metoda odczytuje idFilmu przekazanego ze strony StronaGlowna.jsp, przekazuje do wyświetlenia
     * informacje o filmie, jego gatunkach i recenzjach użytkowników
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));

        FilmDAO filmDAO = new FilmDAO();
        GatunekDAO gatunekDAO = new GatunekDAO();
        GatunekFilmDAO gatunekFilmDAO = new GatunekFilmDAO();
        RecenzjaDAO recenzjaDAO = new RecenzjaDAO();

        Film film = filmDAO.getWybranyFilm(idFilmu);
        request.setAttribute("film", film);
        List<Gatunek> gatunek = gatunekDAO.getAllGatunkiList();
        request.setAttribute("gatunek", gatunek);
        List<GatunekFilm> gatunekFilm = gatunekFilmDAO.getGatunekFilmPoFilmieList(idFilmu);
        request.setAttribute("gatunekFilm", gatunekFilm);
        List<Recenzja> recenzjaList = recenzjaDAO.getRecenzje(idFilmu);
        request.setAttribute("recenzja", recenzjaList);

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/film.jsp").forward(request, response);
    }


}
