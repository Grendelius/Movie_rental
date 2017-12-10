package serwlety;

import dao.SklepFilmDAO;
import dao.WypozyczenieDAO;
import models.SklepFilm;
import models.Uzytkownik;
import models.Wypozyczenie;

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
     *
     * Metoda sprawdza czy użytkownik jest zalogowany jeżeli nie to przenosi go do strony logowania.
     * Następnie wyświetla informacje na temat sklepów w których jest wybrany film.
     * Jeżeli klient wybrał już sklep to metoda tworzy nowe wypożyczenie i przenosi go do strony logowania.
     *
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

            //Wypełnienie pól nowego wypożyczenia
            wypozyczenie.setDataWypozyczenia(new Timestamp(new Date().getTime()));
            wypozyczenie.setIdFilmu(idFilmu);
            wypozyczenie.setIdUzytkownika(zalogowany.getIdUzytkownika());
            wypozyczenie.setIdSklepu(idSklepu);
            wypozyczenie.setStatus("W trakcie realizacji");

            //Utworzenie nowego wypożyczenia i zminiejszenie sztuk danego filmu w sklepie
            wypozyczenieDAO.addWypozyczenie(wypozyczenie);
            sklepFilmDAO.zmniejszIloscFilmow(idFilmu, idSklepu);

            response.sendRedirect(request.getContextPath() + "/stronaGlowna");
        } else if (zalogowany != null) {
            //Pobranie listy sklepów
            List<SklepFilm> sklepFilmList = sklepFilmDAO.getWybraneSklepFilmList(idFilmu);

            request.setAttribute("sklepFilmList", sklepFilmList);
            doGet(request, response);
        } else
            response.sendRedirect(request.getContextPath() + "/login");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/widok/wypozyczenie.jsp").forward(request, response);
    }
}
