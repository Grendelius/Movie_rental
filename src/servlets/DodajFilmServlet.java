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
import java.util.regex.Pattern;

@WebServlet("/dodajFilm")
public class DodajFilmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String tytul = request.getParameter("tytul");
//        String rokProdukcji = request.getParameter("rokProdukcji");
//
//        String[] gatunek = request.getParameterValues("gatunek");
//        System.out.println(gatunek[0]);
//        System.out.println(gatunek[1]);
//        System.out.println(gatunek[2]);
//        System.out.println(gatunek.length);
//        String patternPusty = ".+";
//        String patternRokProdukcji = "19[0-9]{2}|20[0-9]{2}";
//
//        if (Pattern.matches(patternPusty, tytul) && Pattern.matches(patternPusty, gatunek[0])
//                && Pattern.matches(patternPusty, rokProdukcji) && Pattern.matches(patternRokProdukcji, rokProdukcji)) {
//            Film film = new Film();
//            film.setTytul(tytul);
//            film.setRokProdukcji(Integer.parseInt(rokProdukcji));
//            FilmDAO filmDAO = new FilmDAO();
//            filmDAO.addFilm(film);
//
//            Gatunek g = new Gatunek();
//            GatunekDAO gatunekDAO;
//            for(int i = 0;i<gatunek.length;i++) {
//                gatunekDAO = new GatunekDAO();
//                g.setIdFilmu(filmDAO.getIdDoPoprawy());  //Do poprawy!!!!!!!!!
//                g.setNazwa(gatunek[i]);
//                gatunekDAO.addGatunek(g);
//            }
//            request.setAttribute("wynik", "Film został dodany!");
//        } else {
//            request.setAttribute("blad", "Podałeś błędne dane!");
//        }
//        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/dodajFilm.jsp").forward(request, response);
    }
}
