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

@WebServlet("/edytujProfil")
public class EdycjaProfiluServlet extends HttpServlet {

    /**
     * Metoda umożliwia  edycję profilu przez użytkownika
     * W razie błędów w formularzu zostaje wyświetlony komunikat o błędzie.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Uzytkownik uzytkownik = (Uzytkownik) request.getSession().getAttribute("uzytkownik");

        // Pobieranie danych z formularza na temat użytkownika
        String login = request.getParameter("login");
        String imie = request.getParameter("imie");
        String nazwisko = request.getParameter("nazwisko");
        String numerTelefonu = request.getParameter("numerTelefonu");
        String miejsceZamieszkania = request.getParameter("miejsceZamieszkania");
        String email = request.getParameter("email");

        // Tworzenie regex-ów
        String patternLogin = "[a-zA-Z0-9]{6,15}";
        String patternNumerTelefonu = "[0-9]{9}";
        String patternEmail = "^[\\w!#$%&’*+/=\\-?^_`{|}~]+(\\.[\\w!#$%&’*+/=\\-?^_`{|}~]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
        String patternPusty = ".+";

        // Pominięcie edycji jeśli wchodzimy w edycje pierwszy raz
        if (login != null) {
            if (Pattern.matches(patternPusty, login) && Pattern.matches(patternPusty, imie)
                    && Pattern.matches(patternPusty, nazwisko) && Pattern.matches(patternPusty, numerTelefonu)
                    && Pattern.matches(patternPusty, miejsceZamieszkania) && Pattern.matches(patternPusty, email)) {
                if (Pattern.matches(patternLogin, login)) {
                    if (Pattern.matches(patternNumerTelefonu, numerTelefonu)) {
                        if (Pattern.matches(patternEmail, email)) {
                            UzytkownicyDAO dao = new UzytkownicyDAO();
                            uzytkownik.setLogin(login);
                            uzytkownik.setImie(imie);
                            uzytkownik.setNazwisko(nazwisko);
                            uzytkownik.setNumerTelefonu(Integer.parseInt(numerTelefonu));
                            uzytkownik.setMiejsceZamieszkania(miejsceZamieszkania);
                            uzytkownik.setEmail(email);
                            if (dao.updateUzytkownika(uzytkownik)) {
                                request.setAttribute("info", "Zmiany zostały wprowadzone!");
                                request.setAttribute("czyEdytujProfil", "true");
                                request.getRequestDispatcher("/stronaGlowna").forward(request, response);
                            } else
                                request.setAttribute("blad", "Nie udało się zakończyć edycji!");
                        } else {
                            request.setAttribute("blad", "Błędny adres e-mail!");
                            doGet(request, response);
                        }
                    } else {
                        request.setAttribute("blad", "Błędny numer telefonu! Długość 9 cyfr");
                        doGet(request, response);
                    }
                } else {
                    request.setAttribute("blad", "Błędny login! Długość od 6 do 15 znaków (brak znaków szczególnych).");
                    doGet(request, response);
                }
            } else {
                request.setAttribute("blad", "Wypełnij wszystkie pola!");
                doGet(request, response);
            }
        } else
            doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("czyEdytujProfil") == null) {
            request.setAttribute("czyEdytujProfil", "true");
        }
        request.getRequestDispatcher("/stronaGlowna").forward(request, response);
    }
}
