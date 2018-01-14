package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/listaUzytkownikow")
public class ListaUzytkownikow extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getAttribute("czyListaUzytkownikow") == null) {
            request.setAttribute("czyListaUzytkownikow", "true");
        }
        request.getRequestDispatcher("/panelUzytkownika").forward(request, response);
    }


}
