package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/gatunek")
public class GatunekFilmowyServlet extends HttpServlet {

    /**
     * Metoda pobiera ze strony left-menu.jsp wybrany gatunek, przesyła go do servletu stronaGlownaServlet
     * a następnie jest wykorzystany na stronie center.jsp
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String g = request.getParameter("wybranyGatunek");
        request.setAttribute("g", g);
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/stronaGlowna").forward(request, response);
    }


}