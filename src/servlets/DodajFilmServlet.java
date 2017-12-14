package servlets;

import dao.FilmDAO;
import dao.GatunekDAO;
import dao.GatunekFilmDAO;
import models.Film;
import models.Gatunek;
import models.GatunekFilm;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.regex.Pattern;

@WebServlet("/dodajFilm")
public class DodajFilmServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tytul = request.getParameter("tytul");
        String rokProdukcji = request.getParameter("rokProdukcji");
        String opis = request.getParameter("opis");
        String[] newGatunek = request.getParameterValues("gatunek");

        String patternPusty = ".+";
        String patternOpis = ".{1,255}";
        String patternRokProdukcji = "19[0-9]{2}|20[0-9]{2}";

        if (tytul != null) {
            if (Pattern.matches(patternPusty, tytul) && Pattern.matches(patternPusty, rokProdukcji)
                    && Pattern.matches(patternRokProdukcji, rokProdukcji) && Pattern.matches(patternOpis, opis)) {
                Film film = new Film();
                film.setTytul(tytul);
                film.setRokProdukcji(Integer.parseInt(rokProdukcji));
                film.setOpis(opis);
                film.setDataDodania(new Timestamp(new Date().getTime()));
                FilmDAO filmDAO = new FilmDAO();
                filmDAO.addFilm(film);

                GatunekDAO gatunekDAO = new GatunekDAO();
                Gatunek gatunek;
                GatunekFilm newGatunekFilm = new GatunekFilm();
                GatunekFilmDAO gatunekFilmDAO = new GatunekFilmDAO();

                for (int i = 0; i < newGatunek.length; i++) {
                    if (Pattern.matches(patternPusty, newGatunek[i])) {
                        try {
                            // Szukanie gatunku w bazie
                            gatunek = gatunekDAO.getWybranyGatunekPoNazwie(newGatunek[i]);
                        } catch (NoResultException e) {
                            // Tworzenie nowego gatunku
                            gatunek = new Gatunek();
                            gatunek.setNazwa(newGatunek[i]);
                            gatunekDAO.addGatunek(gatunek);
                        }
                        // Dodanie nowego połączenia gatunekFilm
                        newGatunekFilm.setIdGatunku(gatunekDAO.getId());
                        newGatunekFilm.setIdFilmu(filmDAO.getId());
                        gatunekFilmDAO.addGatunekFilm(newGatunekFilm);
                    }
                }
                request.setAttribute("wynik", "Film został dodany!");
            } else
                request.setAttribute("blad", "Podałeś błędne dane!");
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/dodajFilm.jsp").forward(request, response);
    }
}
