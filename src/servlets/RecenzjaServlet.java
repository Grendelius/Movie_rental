package servlets;

import dao.RecenzjaDAO;
import models.Recenzja;
import models.Uzytkownik;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/recenzja")
public class RecenzjaServlet extends HttpServlet {

    /**
     * Metoda pobiera Recenzję wystawioną przez użytkownika, dodaje ją do bazy i przenosi użytkownika do strony FilmInfoServlet
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tresc = request.getParameter("tresc");
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        RecenzjaDAO recenzjaDAO = new RecenzjaDAO();

        if (tresc != null && tresc.length() > 0) {
            Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
            Recenzja recenzja = new Recenzja();

            // Wypełnienie pól nowej Recenzji
            recenzja.setData(new Timestamp(new Date().getTime()));
            recenzja.setIdFilmu(idFilmu);
            recenzja.setIdUzytkownika(zalogowany.getIdUzytkownika());
            recenzja.setTresc(tresc);

            System.out.println(recenzja.getTresc());
            System.out.println(recenzja.getData());
            System.out.println(recenzja.getIdFilmu());
            System.out.println(recenzja.getIdReceznji());
            System.out.println(recenzja.getIdUzytkownika());


            // Utworzenie nowej Recenzji
            recenzjaDAO.addRecenzje(recenzja);
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/filmInfo").forward(request, response);
    }


}
