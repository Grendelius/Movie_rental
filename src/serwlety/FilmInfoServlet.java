package serwlety;

import dao.FilmDAO;
import dao.GatunekDAO;
import dao.RecenzjaDAO;
import models.Film;
import models.Gatunek;
import models.Recenzja;
import models.Uzytkownik;

import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/filmInfo")
public class FilmInfoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String tresc = request.getParameter("tresc");
        int idFilmu = Integer.parseInt(request.getParameter("id"));         // ID wybramnego filmu na stronie index.jsp
        RecenzjaDAO recenzjaDAO = new RecenzjaDAO();

        if (tresc != null && tresc.length() > 0 && idFilmu != 0) {
            Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
            Recenzja recenzja = new Recenzja();
            recenzja.setData(new Timestamp(new Date().getTime()));
            recenzja.setIdFilmu(idFilmu);
            recenzja.setIdUzytkownika(zalogowany.getIdUzytkownika());
            recenzja.setTresc(tresc);
            recenzjaDAO.addRecenzje(recenzja);
        }

        FilmDAO filmDAO = new FilmDAO();
        GatunekDAO gatunekDAO = new GatunekDAO();
        Film film = filmDAO.getWybranyFilm(idFilmu);
        request.setAttribute("film", film);
        List<Gatunek> gatunek = gatunekDAO.getWybraneGatunki(idFilmu);
        request.setAttribute("gatunek", gatunek);
        List<Recenzja> recenzjaList = recenzjaDAO.getRecenzje(idFilmu);
        request.setAttribute("recenzja", recenzjaList);

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/widok/film.jsp").forward(request, response);
    }


}
