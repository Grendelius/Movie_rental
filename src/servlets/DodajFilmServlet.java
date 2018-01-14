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
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

@WebServlet("/dodajFilm")
public class DodajFilmServlet extends HttpServlet {

    /**
     * Metoda umożliwia dodanie filmu do bazy. W razie potrzeby tworzy również nowe gatunki filmu.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pobieranie danych z formularza na temat filmu
        String tytul = request.getParameter("tytul");
        String rokProdukcji = request.getParameter("rokProdukcji");
        String opis = request.getParameter("opis");
        String okladka = request.getParameter("okladka");
        String rezyser = request.getParameter("rezyser");
        String czasTrwania = request.getParameter("czasTrwania");
        String[] gat = request.getParameterValues("gatunek");

        // Tworzenie Regex-ów
        String patternPusty = ".+";
        String patternOpis = ".{1,255}";
        String patternRokProdukcji = "19[0-9]{2}|20[0-9]{2}";
        String patternCzasTrwania = "[1-9]{1}[0-9]{0,2}";

        // Pominięcie dodawania jeśli wchodzimy w dodawanie pierwszy raz
        if (tytul != null) {

            // Sprawdzenie czy dane zostały poprawnie wstawione
            if (Pattern.matches(patternPusty, tytul) && Pattern.matches(patternPusty, rokProdukcji)
                    && Pattern.matches(patternRokProdukcji, rokProdukcji) && Pattern.matches(patternOpis, opis)
                    && Pattern.matches(patternPusty, okladka) && Pattern.matches(patternPusty, rezyser)
                    && Pattern.matches(patternCzasTrwania, czasTrwania)) {

                // Dodanie danych o filmie
                Film film = new Film();
                film.setTytul(tytul);
                film.setRokProdukcji(Integer.parseInt(rokProdukcji));
                film.setOpis(opis);
                film.setOkladka(okladka);
                film.setDataDodania(new Timestamp(new Date().getTime()));
                film.setRezyser(rezyser);
                film.setCzasTrwania(Integer.parseInt(czasTrwania));
                FilmDAO filmDAO = new FilmDAO();

                // Dodanie nowego filmu
                filmDAO.addFilm(film);

                GatunekFilmDAO gatunekFilmDAO = new GatunekFilmDAO();
                GatunekDAO gatunekDAO = new GatunekDAO();
                Gatunek gatunek;

                // Pozbycie się powtórzeń w gatunkach za pomocą zbioru
                Set<String> newGatunek = new HashSet<>(Arrays.asList(gat));

                // Iteracja po podanych gatunkach
                for (String g: newGatunek) {
                    // Sprawdzenie czy gatunek nie jest pusty
                    if (Pattern.matches(patternPusty, g)) {
                        g = g.substring(0, 1).toUpperCase() + g.substring(1);
                        try {
                            // Szukanie gatunku w bazie
                            gatunek = gatunekDAO.getWybranyGatunekPoNazwie(g);
                        } catch (NoResultException e) {
                            // Tworzenie nowego gatunku
                            gatunek = new Gatunek();
                            gatunek.setNazwa(g);
                            gatunekDAO.addGatunek(gatunek);
                        }
                        // Dodanie nowego połączenia gatunekFilm
                        GatunekFilm newGatunekFilm = new GatunekFilm();
                        newGatunekFilm.setIdGatunku(gatunekDAO.getWybranyGatunekPoNazwie(g).getIdGatunku());
                        newGatunekFilm.setIdFilmu(filmDAO.getId());
                        gatunekFilmDAO.addGatunekFilm(newGatunekFilm);
                    }
                }
                request.setAttribute("info", "Film został dodany!");
                request.setAttribute("czyDodajFilm", "false");
            } else
                request.setAttribute("blad", "Podałeś błędne dane!");
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getAttribute("czyDodajFilm")==null) {
            request.setAttribute("czyDodajFilm", "true");
        }
        request.getRequestDispatcher("/panelUzytkownika").forward(request, response);
    }
}
