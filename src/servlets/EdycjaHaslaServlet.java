package servlets;

import dao.UzytkownicyDAO;
import models.Uzytkownik;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/edycjaHasla")
public class EdycjaHaslaServlet extends HttpServlet {

    /**
     * Metoda umożliwia zmianę hasła przez użytkownika
     * W razie błędów w formularzu zostaje wyświetlony komunikat o błędzie.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pobieranie danych z formularza na temat haseł
        String stareHaslo = request.getParameter("stareHaslo");
        String haslo1 = request.getParameter("haslo1");
        String haslo2 = request.getParameter("haslo2");

        // Tworzenie Regex-a
        String patternHaslo = "^(?=.*[0-9]).{8,15}$";

        // Pominięcie edycji jeśli wchodzimy w edycje pierwszy raz
        if (stareHaslo != null) {
            if (Pattern.matches(patternHaslo, stareHaslo) && Pattern.matches(patternHaslo, haslo1)
                    && Pattern.matches(patternHaslo, haslo2)) {
                UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();
                Uzytkownik uzytkownik = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
                if (uzytkownik.getHaslo().equals(uzytkownicyDAO.getMD5(stareHaslo))) {
                    if (haslo1.equals(haslo2)) {
                        if (!stareHaslo.equals(haslo1)) {
                            uzytkownik.setHaslo(uzytkownicyDAO.getMD5(haslo1));
                            uzytkownicyDAO.updateUzytkownika(uzytkownik);
                            request.setAttribute("info", "Hasło zostało zmienione!");
                            request.setAttribute("czyEdytujProfil", "true");
                            request.getRequestDispatcher("/panelUzytkownika").forward(request, response);
                        } else {
                            request.setAttribute("blad", "Nowe hasło musi się różnić od starego hasła!");
                            doGet(request, response);
                        }
                    } else {
                        request.setAttribute("blad", "Hasła są różne od siebie!");
                        doGet(request, response);
                    }
                } else {
                    request.setAttribute("blad", "Podałeś błędne hasło!");
                    doGet(request, response);
                }
            } else {
                request.setAttribute("blad", "Błędne hasło! Długość od 8 do 15 znaków (przynajmniej jedna cyfra).");
                doGet(request, response);
            }
        } else
            doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("czyEdytujHaslo") == null) {
            request.setAttribute("czyEdytujHaslo", "true");
        }
        request.getRequestDispatcher("/panelUzytkownika").forward(request, response);
    }
}
