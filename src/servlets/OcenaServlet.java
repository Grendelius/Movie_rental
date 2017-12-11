package servlets;

import dao.FilmDAO;
import dao.OcenaDAO;
import models.Ocena;
import models.Uzytkownik;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ocen")
public class OcenaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String o = request.getParameter("ocena");
        int idFilmu = Integer.parseInt(request.getParameter("id"));
        if (o != null) {
            int ocena = Integer.parseInt(request.getParameter("ocena"));
            System.out.println(ocena);
            Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
            OcenaDAO ocenaDAO = new OcenaDAO();
            Ocena nowaOcena = new Ocena();
            nowaOcena.setIdFilmu(idFilmu);
            nowaOcena.setIdUzytkownika(zalogowany.getIdUzytkownika());
            nowaOcena.setOcena(ocena);
            ocenaDAO.addOcene(nowaOcena);
            FilmDAO filmDAO = new FilmDAO();
            filmDAO.updateSredniaOcena(idFilmu);
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/filmInfo").forward(request, response);
    }
}
