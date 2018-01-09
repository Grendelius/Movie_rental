package servlets;

import dao.*;
import models.*;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/usunFilm")
public class UsunFilmServlet extends HttpServlet {

    /**
     * Metoda odczytuje idFilmu, sprawdza czy została podjęta ostateczna decyzja o usunięciu,
     * jeśli nie to Użytkownik zostanie przeniesiony do strony z wyborem,
     * następnie usuwa wybrany film razem z wszystkimi powiązaniami z innymi tabelami w bazie.
     * Jeżeli film jest aktualnie wypożyczony lub zamówiony to usunięcie filmu zostanie zablokowane, a na stronie
     * ukaże informacja o błędzie
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));

        FilmDAO filmDAO = new FilmDAO();

        int errCounter = 0;

        if (request.getParameter("czyUsun") != null) {
            try {
                WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();
                Wypozyczenie wypozyczenie = wypozyczenieDAO.getAktualneWypozyczeniaFilmu(idFilmu);
            } catch (NoResultException | IndexOutOfBoundsException e) {
                errCounter++;
            }

            try {
                ZamowienieDAO zamowienieDAO = new ZamowienieDAO();
                Zamowienie zamowienie = zamowienieDAO.getZamowienieFilmu(idFilmu);
            } catch (NoResultException | IndexOutOfBoundsException e) {
                errCounter++;
            }

            // Sprawdzanie czy film nie jest już wypożyczony lub zamówiony
            if (errCounter == 2) {
                Film film = filmDAO.getWybranyFilm(idFilmu);
                GatunekFilmDAO gatunekFilmDAO = new GatunekFilmDAO();
                List<GatunekFilm> gatunekFilm = gatunekFilmDAO.getGatunekFilmPoFilmieList(idFilmu);

                // Usuwanie połączeń z Gatunkiem
                for (GatunekFilm gf : gatunekFilm) {
                    gatunekFilmDAO.deleteGatunekFilm(gf);
                    try {
                        GatunekFilm gatunkuList = gatunekFilmDAO.getGatunekFilmPoGatunku(gf.getIdGatunku());
                    } catch (NoResultException | IndexOutOfBoundsException e) {
                        //Usuwanie nieużywanego gatunku
                        GatunekDAO gatunekDAO = new GatunekDAO();
                        Gatunek gatunek = gatunekDAO.getWybranyGatunekPoId(gf.getIdGatunku());
                        gatunekDAO.deleteGatunek(gatunek);
                    }
                }

                // Usuwanie ocen filmu
                OcenaDAO ocenaDAO = new OcenaDAO();
                List<Ocena> ocenaList = ocenaDAO.getOcenyFilmuList(idFilmu);
                for (Ocena o : ocenaList) {
                    ocenaDAO.deleteOcene(o);
                }

                // Usuwanie recenzji filmu
                RecenzjaDAO recenzjaDAO = new RecenzjaDAO();
                List<Recenzja> recenzjaList = recenzjaDAO.getRecenzjeList(idFilmu);
                for (Recenzja r : recenzjaList) {
                    recenzjaDAO.deleteRecenzje(r);
                }

                // Usuwanie połączeń SklepFilm
                SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();
                List<SklepFilm> sklepFilmList = sklepFilmDAO.getWybraneSklepFilmList(idFilmu);
                for (SklepFilm sf : sklepFilmList) {
                    sklepFilmDAO.deleteSklepFilm(sf);
                }

                // Usuwanie filmu
                filmDAO.deleteFilm(film);
                request.setAttribute("info", "<br> Film został usunięty!");
            } else {
                request.setAttribute("blad", "<br> Nie możesz usunąć wypożyczonego lub zamówionego filmu!");
            }
            request.setAttribute("czyUsun", "false");
        } else {
            request.setAttribute("czyUsun", "true");
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/stronaGlowna").forward(request, response);
    }
}
