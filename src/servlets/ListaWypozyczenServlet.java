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

@WebServlet("/listaWypozyczen")
public class ListaWypozyczenServlet extends HttpServlet {

    /**
     *
     * Metoda sprawdza czy użytkownik jest zalogowany jeżeli nie to przenosi go do strony logowania.
     * Następnie w zależności od tego czy jest klientem czy pracownikiem wyświetla adekwatną tablicę wypożyczeń
     * i tablicę zamówień.
     * Metoda obsługuje możliwość zmiany statusu wypożyczenia przez pracownika
     * i anulowania wypożyczenia prze klienta.
     * Metoda umożliwia anulowanie zamówienia przez klienta
     *
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");

        if (zalogowany != null) {
            String nowyStatus = request.getParameter("nowyStatus");
            String idWypozyczenia = request.getParameter("idWypozyczenia");
            String idZamowienia = request.getParameter("idZamowienia");
            WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();
            ZamowienieDAO zamowienieDAO = new ZamowienieDAO();

            if (zalogowany.getRola().equals("klient")) {

                //Anulowanie przez klienta wypożyczenia
                if (nowyStatus != null && nowyStatus.equals("Anuluj wypożyczenie")) {
                    Wypozyczenie wypozyczenie = wypozyczenieDAO.getWypozyczenie(Integer.parseInt(idWypozyczenia));
                    SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();

                    try{
                        addWypozyczenie(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    }catch (NoResultException | IndexOutOfBoundsException e){
                        sklepFilmDAO.zwiekszIloscFilmow(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                    }
                    finally {
                        wypozyczenieDAO.deleteWypozyczenie(wypozyczenie);
                    }
                }

                //Anulowanie przez klienta zamówienia
                if (nowyStatus != null && nowyStatus.equals("Anuluj zamówienie")) {
                    Zamowienie zamowienie = zamowienieDAO.getZamowienie(Integer.parseInt(idZamowienia));
                    zamowienieDAO.deleteZamowienie(zamowienie);
                }

                //Pobranie listy wypożyczeń danego klienta
                List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getWypozyczeniaKlientaList(zalogowany.getIdUzytkownika());
                request.setAttribute("wypozyczenie", wypozyczenie);

                //Pobranie listy zamówień danego klienta
                List<Zamowienie> zamowienie = zamowienieDAO.getZamowieniaKlientaList(zalogowany.getIdUzytkownika());
                request.setAttribute("zamowienie", zamowienie);

            } else if (zalogowany.getRola().equals("pracownik")) {
                if (nowyStatus != null) {
                    Wypozyczenie wypozyczenie = wypozyczenieDAO.getWypozyczenie(Integer.parseInt(idWypozyczenia));

                    //Zmiana statusu
                    wypozyczenie.setStatus(nowyStatus);
                    if (nowyStatus.equals("Zakończony")) {
                        SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();

                        //Zwrot filmu do sklepu i dopisane daty zwrotu wypożyczenia
                        try{
                            addWypozyczenie(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                        }catch (NoResultException | IndexOutOfBoundsException e){
                            sklepFilmDAO.zwiekszIloscFilmow(wypozyczenie.getIdFilmu(), wypozyczenie.getIdSklepu());
                        }
                        finally {
                            wypozyczenie.setDataZwrotu(new Timestamp(new Date().getTime()));
                        }
                    }
                    wypozyczenieDAO.updateWypozyczenie(wypozyczenie);
                }

                //Pobranie listy wszystkich wypożyczeń
                List<Wypozyczenie> wypozyczenie = wypozyczenieDAO.getAllWypozyczeniaList();
                request.setAttribute("wypozyczenie", wypozyczenie);

                //Pobranie listy wszystkich zamówień
                List<Zamowienie> zamowienie = zamowienieDAO.getAllZamowieniaList();
                request.setAttribute("zamowienie", zamowienie);
            }
            doGet(request, response);
        } else
            response.sendRedirect(request.getContextPath() + "/login");
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/listaWypozyczen.jsp").forward(request, response);
    }

    /**
     * Metoda sprawdza czy jest zamówienie na dany film jeśli tak to tworzy nowe wypożyczenie na podstawie zamówienia
     * a następnie usuwa zamówienie z bazy
     */
    private void addWypozyczenie(int idFilmu, int idSklepu){
        WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();
        ZamowienieDAO zamowienieDAO = new ZamowienieDAO();
        Zamowienie zamowienie = zamowienieDAO.getZamowienie(idFilmu,idSklepu);
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
