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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        String idsklepu = request.getParameter("idSklepu");
        if (idsklepu != null) {
            int idSklepu = Integer.parseInt(idsklepu);
            Wypozyczenie wypozyczenie = new Wypozyczenie();
            wypozyczenie.setDataWypozyczenia(new Timestamp(new Date().getTime()));
            wypozyczenie.setIdFilmu(idFilmu);
            wypozyczenie.setIdUzytkownika(zalogowany.getIdUzytkownika());
            wypozyczenie.setIdSklepu(idSklepu);
            wypozyczenie.setStatus("W trakcie realizacji");
            WypozyczenieDAO wypozyczenieDAO = new WypozyczenieDAO();
            wypozyczenieDAO.addWypozyczenie(wypozyczenie);
            SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();
            sklepFilmDAO.updateIloscFilmow(idFilmu, idSklepu);
            response.sendRedirect(request.getContextPath() + "/stronaGlowna");
        } else if (zalogowany != null && zalogowany.getRola().equals("klient")) {
            request.setAttribute("idFilmu", idFilmu);
            SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();
            List<SklepFilm> sklepFilmList = sklepFilmDAO.getSklepFilmPoIdFilmu(idFilmu);
            request.setAttribute("sklepFilmList", sklepFilmList);
            doGet(request, response);
        } else
            response.sendRedirect(request.getContextPath() + "/login");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/widok/wypozyczenie.jsp").forward(request, response);
    }
}
