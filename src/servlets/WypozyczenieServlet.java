package servlets;

import dao.SklepFilmDAO;
import dao.WypozyczenieDAO;
import dao.ZamowienieDAO;
import models.SklepFilm;
import models.Uzytkownik;
import models.Wypozyczenie;
import models.Zamowienie;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@WebServlet("/wypozycz")
public class WypozyczenieServlet extends HttpServlet {
    /**
     * Metoda sprawdza czy użytkownik jest zalogowany jeżeli nie to przenosi go do strony LoginServlet.
     * Następnie wyświetla informacje na temat sklepów w których jest wybrany film.
     * Jeżeli klient wybrał już sklep to metoda tworzy nowe wypożyczenie lub nowe zamówienie i przenosi go do strony StronaGlownaServlet
     * Jeżeli klient wybrał film, który już wypożycza lub zamawia to program blokuje wypożyczenie i przenosi
     * go do strony LoginServlet
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        String idsklepu = request.getParameter("idSklepu");
        SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();

        if (idsklepu != null) {
            int idSklepu = Integer.parseInt(idsklepu);
            Wypozyczenie wypozyczenie = new Wypozyczenie();
            WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();

            // Wypełnienie pól nowego wypożyczenia
            wypozyczenie.setDataWypozyczenia(new Timestamp(new Date().getTime()));
            wypozyczenie.setIdFilmu(idFilmu);
            wypozyczenie.setIdUzytkownika(zalogowany.getIdUzytkownika());
            wypozyczenie.setIdSklepu(idSklepu);
            wypozyczenie.setStatus("W trakcie realizacji");

            // Utworzenie nowego wypożyczenia i zminiejszenie sztuk danego filmu w sklepie
            wypozyczenieDAO.addWypozyczenie(wypozyczenie);
            sklepFilmDAO.zmniejszIloscDostepnychFilmow(idFilmu, idSklepu);
            request.setAttribute("info", "<br> Twoje zlecenie zostało przekazane do realizacji!");
            request.setAttribute("czyWypozyczenie", "false");
        } else if (zalogowany != null && zalogowany.getRola().equals("klient")) {
            int errCounter = 0;

            // Sprawdzanie czy klient już wypożycza ten film
            try {
                WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();
                Wypozyczenie wypozyczenie = wypozyczenieDAO.getAktualneWypozyczenie(zalogowany.getIdUzytkownika(), idFilmu);
            } catch (NoResultException | NullPointerException e) {
                errCounter++;
            }

            // Sprawdzanie czy klient już zamawia ten film
            try {
                ZamowienieDAO zamowienieDAO = new ZamowienieDAO();
                Zamowienie zamowienie = zamowienieDAO.getAktualneZamowienie(zalogowany.getIdUzytkownika(), idFilmu);
            } catch (NoResultException | NullPointerException e) {
                errCounter++;
            }

            // Jeżeli klient nie wypożyczył i nie zamówił tego filmu to zostaje wyświetlona lista sklepów z tym filmem
            if (errCounter == 2) {
                List<SklepFilm> sklepFilmList = sklepFilmDAO.getWybraneSklepFilmList(idFilmu);
                request.setAttribute("sklepFilmList", sklepFilmList);
                doGet(request, response);
            } else {
                request.setAttribute("info","<br> Nie możesz wypożyczyć/zamówić więcej niż jedną sztukę wybranego filmu!");
                request.setAttribute("czyWypozyczenie", "false");
            }
        } else if (zalogowany != null && (zalogowany.getRola().equals("pracownik") || zalogowany.getRola().equals("administrator"))){
            request.setAttribute("info","<br> Filmy mogą wypożyczać jedynie klienci!");
            request.setAttribute("czyWypozyczenie", "false");
        }
        else{
            request.setAttribute("blad", "<br> Aby wypożyczyć film musisz być zalogowany!");
            request.getRequestDispatcher("/login").forward(request, response);
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getAttribute("czyWypozyczenie")==null) {
            request.setAttribute("czyWypozyczenie", "true");
        }
        request.getRequestDispatcher("/stronaGlowna").forward(request, response);
    }
}
