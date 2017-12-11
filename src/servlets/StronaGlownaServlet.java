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
import java.util.List;

@WebServlet("/stronaGlowna")
public class StronaGlownaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    /**
     * Metoda pobiera z bazy wszystkie filmy, gatunki, gatunki bez powtórzeń (gatunekdistinct)
     * a następnie przesyła je do stony stronaGlowna.jsp
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FilmDAO filmDAO = new FilmDAO();
        GatunekDAO gatunekDAO = new GatunekDAO();
        List<Film> film = filmDAO.getNajnowszeFilmyList();
        request.setAttribute("film", film);
        List<Gatunek> gatunek = gatunekDAO.getAllGatunkiList();
        request.setAttribute("gatunek", gatunek);
        List<String> gatunekdistinct = gatunekDAO.getDistinctGatunkiList();
        request.setAttribute("gatunekdistinct", gatunekdistinct);
        request.getRequestDispatcher("/WEB-INF/views/stronaGlowna.jsp").forward(request, response);
    }


}
