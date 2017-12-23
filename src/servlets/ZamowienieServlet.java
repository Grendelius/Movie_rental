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
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/zamow")
public class ZamowienieServlet extends HttpServlet {

    /**
     * Metoda pobiera informacje na temat użytkownika, filmu i sklepu, a następnie tworzy nowe zamówienie
     * po czym przeci użytkownika do strony StronaGlownaServlet
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        String idSklepu = request.getParameter("idSklepu");
        Zamowienie zamowienie = new Zamowienie();
        ZamowienieDAO zamowienieDAO = new ZamowienieDAO();

        //Wypełnienie pól nowego zamówienia
        zamowienie.setDataZamowienia(new Timestamp(new Date().getTime()));
        zamowienie.setIdFilmu(idFilmu);
        zamowienie.setIdUzytkownika(zalogowany.getIdUzytkownika());
        zamowienie.setIdSklepu(Integer.parseInt(idSklepu));

        //Utworzenie nowego zamówienia
        zamowienieDAO.addZamowienie(zamowienie);

        request.setAttribute("info", "<br> Twoje zamówienie zostało przekazane do kolejki oczekujących!");
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/stronaGlowna").forward(request, response);
    }


}
