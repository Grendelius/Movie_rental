package serwlety;

import dao.SklepFilmDAO;
import dao.WypozyczenieDAO;
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

@WebServlet("/listaWypozyczen")
public class ListaWypozyczenServlet extends HttpServlet {

    /**
     *
     * Metoda sprawdza czy użytkownik jest zalogowany jeżeli nie to przenosi go do strony logowania.
     * Następnie w zależności od tego czy jest klientem czy pracownikiem wyświetla adekwatną tablicę wypożyczeń.
     * Metoda obsługuje możliwość zmiany statusu wypożyczenia przez pracownika
     * i anulowania wypożyczenia prze klienta
     *
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");

        if (zalogowany != null) {
            String nowyStatus = request.getParameter("nowyStatus");
            String idWypozyczenia = request.getParameter("idWypozyczenia");
            WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();

            if (zalogowany.getRola().equals("klient")) {
                if (nowyStatus != null && nowyStatus.equals("Anuluj wypożyczenie")) {
                    Wypozyczenie wypozyczenie = wypozyczenieDAO.getWypozyczenie(Integer.parseInt(idWypozyczenia));
                    SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();

                    //Anulowanie przez klienta wypożyczenia i zwiększenie liczby filmów
                    sklepFilmDAO.zwiekszIloscFilmow(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    wypozyczenieDAO.deleteWypozyczenie(wypozyczenie);
                }
                //Pobranie listy wypożyczeń danego klienta
                List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getWypozyczeniaKlientaList(zalogowany.getIdUzytkownika());

                request.setAttribute("wypozyczenie", wypozyczenie);
            } else if (zalogowany.getRola().equals("pracownik")) {
                if (nowyStatus != null) {
                    Wypozyczenie wypozyczenie = wypozyczenieDAO.getWypozyczenie(Integer.parseInt(idWypozyczenia));

                    //Zmiana statusu
                    wypozyczenie.setStatus(nowyStatus);
                    if (nowyStatus.equals("Zakończony")) {
                        SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();

                        //Zwrot filmu do sklepu i dopisane daty zwrotu wypożyczenia
                        sklepFilmDAO.zwiekszIloscFilmow(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                        wypozyczenie.setDataZwrotu(new Timestamp(new Date().getTime()));
                    }
                    wypozyczenieDAO.updateWypozyczenie(wypozyczenie);
                }
                //Pobranie listy wszystkich wypożyczeń
                List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getAllWypozyczeniaList();

                request.setAttribute("wypozyczenie", wypozyczenie);
            }
            doGet(request, response);
        } else
            response.sendRedirect(request.getContextPath() + "/login");
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/widok/listaWypozyczen.jsp").forward(request, response);
    }
}
