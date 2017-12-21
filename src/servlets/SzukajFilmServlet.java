package servlets;

import dao.FilmDAO;
import dao.GatunekDAO;
import models.Film;
import models.Gatunek;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

@WebServlet("/szukajFilm")
public class SzukajFilmServlet extends HttpServlet {

    /**
     * Metoda pobiera szukany film, a następnie szuka w bazie pasuące filmy i wysyła je do wyświetlenia na stronie stronaGlowna.jsp
     * Jeżeli nie uda się znaleźć pasującego filmu to zostaje wysłany komunikat na stronę główną
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String szukanyFilm = request.getParameter("szukanyFilm");

        FilmDAO filmDAO = new FilmDAO();
        GatunekDAO gatunekDAO = new GatunekDAO();

        List<Film> filmList = filmDAO.getNajnowszeFilmyList();
        Set<Film> pasujące = new HashSet<>();

        String patternPusty = ".*" + szukanyFilm.toLowerCase() + ".*";

        // Szukanie najlepiej pasujących filmów
        for (Film f : filmList) {
            if (f.getTytul().toLowerCase().equals(szukanyFilm.toLowerCase()))
                pasujące.add(f);
        }

        // Szukanie podobnych filmów
        for (Film f : filmList) {
            if (Pattern.matches(patternPusty, f.getTytul().toLowerCase()))
                pasujące.add(f);
        }

        // Sprawdzanie czy znaleziono pasujący film
        if (pasujące.isEmpty()) {
            request.setAttribute("inforight", "Nie ma takiego filmu!");
            request.getRequestDispatcher("/stronaGlowna").forward(request, response);
        }

        request.setAttribute("film", new ArrayList(pasujące));
        List<Gatunek> gatunek = gatunekDAO.getAllGatunkiList();
        request.setAttribute("gatunek", gatunek);
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/stronaGlowna.jsp").forward(request, response);
    }
}
