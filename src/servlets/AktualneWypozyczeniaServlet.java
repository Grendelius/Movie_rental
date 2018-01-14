package servlets;

import dao.SklepFilmDAO;
import dao.WypozyczenieDAO;
import dao.ZamowienieDAO;
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

@WebServlet("/aktualneWypozyczenia")
public class AktualneWypozyczeniaServlet extends HttpServlet {

    /**
     * W zależności od tego czy użytkownik jest klientem czy pracownikiem wyświetla
     * adekwatną tablicę aktualnych wypożyczeń na stronie aktualneWypozyczenia.jsp.
     * Metoda obsługuje możliwość zmiany statusu wypożyczenia przez pracownika
     * i anulowania wypożyczenia prze klienta.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        String nowyStatus = request.getParameter("nowyStatus");
        String idWypozyczenia = request.getParameter("idWypozyczenia");

        WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();

        if (zalogowany.getRola().equals("klient")) {
            if (nowyStatus != null) {
                //Anulowanie przez klienta wypożyczenia
                if (nowyStatus.equals("Anuluj wypożyczenie")) {
                    Wypozyczenie wypozyczenie = wypozyczenieDAO.getWypozyczenie(Integer.parseInt(idWypozyczenia));
                    SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();

                    //Zwrot filmu do sklepu i dopisane daty zwrotu wypożyczenia
                    try {
                        // Szukanie pasującego zamówienia
                        addWypozyczenie(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    } catch (NoResultException | IndexOutOfBoundsException e) {
                        sklepFilmDAO.zwiekszIloscDostepnychFilmow(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    } finally {
                        wypozyczenieDAO.deleteWypozyczenie(wypozyczenie);
                    }
                }
            }

            //Pobranie listy wypożyczeń danego klienta
            List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getAktualneWypozyczeniaKlientaList(zalogowany.getIdUzytkownika());
            request.setAttribute("wypozyczenie", wypozyczenie);

        } else if (zalogowany.getRola().equals("pracownik")) {
            if (nowyStatus != null && !nowyStatus.equals("Anuluj zamówienie")) {
                Wypozyczenie wypozyczenie = wypozyczenieDAO.getWypozyczenie(Integer.parseInt(idWypozyczenia));
                SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();

                //Zmiana statusu
                wypozyczenie.setStatus(nowyStatus);

                //Zakończenie przez pracownika wypożyczenia
                if (nowyStatus.equals("Zakończony")) {

                    //Zwrot filmu do sklepu i dopisane daty zwrotu wypożyczenia
                    try {
                        // Szukanie pasującego zamówienia
                        addWypozyczenie(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    } catch (NoResultException | IndexOutOfBoundsException e) {
                        sklepFilmDAO.zwiekszIloscDostepnychFilmow(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    } finally {
                        wypozyczenie.setDataZwrotu(new Timestamp(new Date().getTime()));
                    }
                    wypozyczenieDAO.updateWypozyczenie(wypozyczenie);
                }
                //Anulowanie przez pracownika wypożyczenia
                else if (nowyStatus.equals("Anuluj wypożyczenie")) {
                    try {
                        addWypozyczenie(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    } catch (NoResultException | IndexOutOfBoundsException e) {
                        sklepFilmDAO.zwiekszIloscDostepnychFilmow(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    } finally {
                        wypozyczenieDAO.deleteWypozyczenie(wypozyczenie);
                    }
                } else
                    // Zmiana statusu
                    wypozyczenieDAO.updateWypozyczenie(wypozyczenie);
            }

            //Pobranie listy wszystkich wypożyczeń
            List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getAllAktualneWypozyczeniaList();
            request.setAttribute("wypozyczenie", wypozyczenie);

        }
        doGet(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("czyAktualneWypozyczenia") == null) {
            request.setAttribute("czyAktualneWypozyczenia", "true");
        }
        request.getRequestDispatcher("/panelUzytkownika").forward(request, response);
    }

    /**
     * Metoda sprawdza czy jest zamówienie na dany film jeśli tak to tworzy nowe wypożyczenie na podstawie zamówienia
     * a następnie usuwa zamówienie z bazy
     */
    private void addWypozyczenie(int idFilmu, int idSklepu) {
        WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();
        ZamowienieDAO zamowienieDAO = new ZamowienieDAO();
        Zamowienie zamowienie = zamowienieDAO.getZamowienie(idFilmu, idSklepu);
        Wypozyczenie wypozyczenieNowe = new Wypozyczenie();
        wypozyczenieNowe.setDataWypozyczenia(zamowienie.getDataZamowienia());
        wypozyczenieNowe.setIdFilmu(zamowienie.getIdFilmu());
        wypozyczenieNowe.setIdUzytkownika(zamowienie.getIdUzytkownika());
        wypozyczenieNowe.setIdSklepu(zamowienie.getIdSklepu());
        wypozyczenieNowe.setStatus("W trakcie realizacji");
        wypozyczenieDAO.addWypozyczenie(wypozyczenieNowe);
        zamowienieDAO.deleteZamowienie(zamowienie);
    }


}
