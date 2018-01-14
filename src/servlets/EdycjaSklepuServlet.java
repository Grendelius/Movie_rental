package servlets;

import dao.SklepFilmDAO;
import models.SklepFilm;

import java.util.List;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/edytujSklep")
public class EdycjaSklepuServlet extends HttpServlet {

    /**
     * Metoda pobiera informacje o tym czy ma stworzyć nowy SklepFilm lub zmienić już istniejący.
     * Usuwa również SklepFilm jeśli ilość sztuk filmu w sklepie jest równa 0.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Pobieranie informacji o sklepie i o jego edycji
        String iloscFilmow = request.getParameter("iloscFilmow");
        String idFilmu = request.getParameter("idFilmu");
        String idSklepu = request.getParameter("idSklepu");
        String value = request.getParameter("value");

        String patternIloscFilmow = "[1-9]{1}[0-9]*";

        SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();
        SklepFilm sklepFilm = new SklepFilm();

        if (request.getParameter("czyEdytujSklep") != null) {
            // Pominięcie edycji jeśli wchodzimy w edycje pierwszy raz
            if (idFilmu != null) {
                try {
                    // Sprawdzanie czy jest już wybrany film w wybranym sklepie
                    sklepFilm = sklepFilmDAO.getWybranySklepFilm(Integer.parseInt(idFilmu), Integer.parseInt(idSklepu));

                    // Jeżeli został wciśnięty minus to zostaje odjęta jedna sztuka filmu
                    if (value.equals("-") && sklepFilm.getIloscDostepnychFilmow() != 0)
                        sklepFilmDAO.zmniejszIloscFilmow(Integer.parseInt(idFilmu), Integer.parseInt(idSklepu));

                        // Jeżeli został wciśnięty plus to zostaje dodana jedna sztuka filmu
                    else if (value.equals("+"))
                        sklepFilmDAO.zwiekszIloscFilmow(Integer.parseInt(idFilmu), Integer.parseInt(idSklepu));

                    // Jeśli w sklepie jest 0 sztuk danego filmu to jest on usuwany ze sklepu
                    if (sklepFilm.getIloscFilmow() == 0)
                        sklepFilmDAO.deleteSklepFilm(sklepFilm);

                } catch (NoResultException e) {
                    // Dodanie nowego SklepFilm
                    if (Pattern.matches(patternIloscFilmow, iloscFilmow)) {
                        sklepFilm.setIdSklepu(Integer.parseInt(idSklepu));
                        sklepFilm.setIdFilmu(Integer.parseInt(idFilmu));
                        sklepFilm.setIloscFilmow(Integer.parseInt(iloscFilmow));
                        sklepFilm.setIloscDostepnychFilmow(Integer.parseInt(iloscFilmow));
                        sklepFilmDAO.addSklepFilm(sklepFilm);
                    }
                }
            }
        } else {
            request.setAttribute("czyWyborSklepu", "true");
            request.getRequestDispatcher("/stronaGlowna").forward(request, response);
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getAttribute("czyEdytujSklep")==null) {
            request.setAttribute("czyEdytujSklep", "true");
        }


        request.getRequestDispatcher("/panelUzytkownika").forward(request, response);
    }
}
