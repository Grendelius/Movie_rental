package servlets;

import dao.UzytkownicyDAO;
import models.Uzytkownik;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/panelUzytkownika")
public class PanelUzytkownikaServlet extends HttpServlet {

    /**
     * Metoda sprawdza czy użytkownik jest zalogowany jęsli nie to przenosi go do
     * servletu LoginServlet. W innym przypadku sprawdza jaka opcja została wybrana i wykonuje ją.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        String akcja = request.getParameter("akcja");

        if (zalogowany != null)
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
                } else {
                    // Zmiana roli
                    uzytkownik.setRola(akcja);
                    uzytkownicyDAO.updateUzytkownika(uzytkownik);
                }
                doGet(request, response);
            } else
                doGet(request, response);
        else {
            request.setAttribute("blad", "<br> Dostęp do Panelu użytkownika mają tylko zalogowane osoby!");
            request.getRequestDispatcher("/login").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/panelUzytkownika.jsp").forward(request, response);
    }
}
