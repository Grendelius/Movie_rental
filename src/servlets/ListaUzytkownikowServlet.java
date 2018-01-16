package servlets;
import dao.UzytkownicyDAO;
import models.Uzytkownik;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/listaUzytkownikow")
public class ListaUzytkownikowServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String akcja = request.getParameter("akcja");

        if (akcja != null) {
            String idUzytkownika = request.getParameter("idUzytkownika");
            UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();
            Uzytkownik uzytkownik = uzytkownicyDAO.getUzytkownikPoId(Integer.parseInt(idUzytkownika));
            if (akcja.equals("Zablokuj konto")) {
                uzytkownik.setZablokowany(true);
                uzytkownicyDAO.updateUzytkownika(uzytkownik);
            } else if (akcja.equals("Odblokuj konto")) {
                uzytkownik.setZablokowany(false);
                uzytkownicyDAO.updateUzytkownika(uzytkownik);
            } else if (akcja.equals("Usuń konto")) {
                uzytkownicyDAO.deleteUzytkownika(uzytkownik);
            } else if (isNumber(akcja)){
                uzytkownik.setIdSklepu(Integer.parseInt(akcja));
                uzytkownicyDAO.updateUzytkownika(uzytkownik);
            } else {
                // Zmiana roli
                uzytkownik.setRola(akcja);
                uzytkownicyDAO.updateUzytkownika(uzytkownik);
            }
        }
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("czyListaUzytkownikow") == null) {
            request.setAttribute("czyListaUzytkownikow", "true");
        }
        request.getRequestDispatcher("/WEB-INF/views/panelUzytkownika.jsp").forward(request, response);
    }

    private boolean isNumber(String input)
    {
        try
        {
            Integer.parseInt(input);
        }
        catch(NumberFormatException ex)
        {
            return false;
        }
        return true;
    }
}
