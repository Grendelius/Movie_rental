package servlets;

import dao.ZamowienieDAO;
import models.Uzytkownik;
import models.Zamowienie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/zamowienia")
public class ZamowieniaServlet extends HttpServlet {

    /**
     * W zależności od tego czy użytkownik jest klientem czy pracownikiem wyświetla
     * adekwatną tablicę zamówień na stronie zamowienia.jsp.
     * Metoda obsługuje możliwość anulowania zamówienia przez pracownika i klienta.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        String idZamowienia = request.getParameter("idZamowienia");
        String nowyStatus = request.getParameter("nowyStatus");

        ZamowienieDAO zamowienieDAO = new ZamowienieDAO();

        if (zalogowany.getRola().equals("klient")) {
            if (nowyStatus != null && nowyStatus.equals("Anuluj zamówienie")) {
                //Anulowanie przez klienta zamówienia
                Zamowienie zamowienie = zamowienieDAO.getZamowienie(Integer.parseInt(idZamowienia));
                zamowienieDAO.deleteZamowienie(zamowienie);
            }

            //Pobranie listy zamówień danego klienta
            List<Zamowienie> zamowienie = zamowienieDAO.getZamowieniaKlientaList(zalogowany.getIdUzytkownika());
            request.setAttribute("zamowienie", zamowienie);

        } else if (zalogowany.getRola().equals("pracownik")) {
            //Anulowanie przez pracownika zamówienia
            if (nowyStatus != null && nowyStatus.equals("Anuluj zamówienie")) {
                Zamowienie zamowienie = zamowienieDAO.getZamowienie(Integer.parseInt(idZamowienia));
                zamowienieDAO.deleteZamowienie(zamowienie);
            }

            //Pobranie listy wszystkich zamówień
            List<Zamowienie> zamowienie = zamowienieDAO.getAllZamowieniaList();
            request.setAttribute("zamowienie", zamowienie);
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/zamowienia.jsp").forward(request, response);
    }
}
