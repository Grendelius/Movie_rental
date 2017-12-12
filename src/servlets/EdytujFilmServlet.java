package servlets;

import dao.FilmDAO;
import dao.GatunekDAO;
import dao.GatunekFilmDAO;
import dao.RecenzjaDAO;
import models.Film;
import models.Gatunek;
import models.GatunekFilm;

import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet("/edytujFilm")
public class EdytujFilmServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        String tytul = request.getParameter("tytul");
        String opis = request.getParameter("opis");
        String rokProdukcji = request.getParameter("rokProdukcji");
        String[] newgatunek = request.getParameterValues("gatunek");

        String patternPusty = ".+";
        String patternRokProdukcji = "19[0-9]{2}|20[0-9]{2}";

        FilmDAO filmDAO = new FilmDAO();
        Film film = filmDAO.getWybranyFilm(idFilmu);
        GatunekDAO gatunekDAO = new GatunekDAO();
        GatunekFilmDAO gatunekFilmDAO = new GatunekFilmDAO();
        List<GatunekFilm> gatunekFilm = gatunekFilmDAO.getGatunekFilmPoFilmieList(idFilmu);

        if (tytul != null ){
            if (Pattern.matches(patternPusty, tytul) && Pattern.matches(patternPusty, opis)
                    && Pattern.matches(patternRokProdukcji, rokProdukcji) && Pattern.matches(patternPusty, newgatunek[0])){
//                for (String n: newgatunek) {
//                    if (Pattern.matches(patternPusty, n)){
//                        try{
//                            Gatunek gatunek = gatunekDAO.getWybranyGatunek(n);
//                        }catch (NoResultException e){
//                            Gatunek gatunek = new Gatunek();
//                            gatunek.setNazwa(n);
//                            gatunekDAO.addGatunek(gatunek);
//                        }
//                    }
//
//                }
                film.setTytul(tytul);
                film.setOpis(opis);
                film.setRokProdukcji(Integer.parseInt(rokProdukcji));
                filmDAO.updateFilm(film);

                for(int i=0;i<gatunekFilm.size();i++){
                    //Sprawdzanie czy zmieniono dany gatunek
                    if(!gatunekDAO.getWybranyGatunek(gatunekFilm.get(i).getIdGatunku()).equals(newgatunek[i])){
                        // Szukanie nowego gatunku w bazie
                        try{
                            Gatunek gatunek = gatunekDAO.getWybranyGatunek(newgatunek[i]);
                            GatunekFilm newGatunekFilm = gatunekFilmDAO.getWybranyGatunek(idFilmu, gatunekFilm.get(i).getIdGatunku());
                            newGatunekFilm.setIdGatunku(gatunek.getIdGatunku());
                            gatunekFilmDAO.updateGatunekFilm(newGatunekFilm);
                            //Tworzenie nowego gatunku
                        }catch (NoResultException e){
                            Gatunek gatunek = new Gatunek();
                            gatunek.setNazwa(newgatunek[i]);
                            gatunekDAO.addGatunek(gatunek);
                            GatunekFilm newGatunekFilm = gatunekFilmDAO.getWybranyGatunek(idFilmu, gatunekFilm.get(i).getIdGatunku());
                            gatunek = gatunekDAO.getWybranyGatunek(newgatunek[i]);
                            newGatunekFilm.setIdGatunku(gatunek.getIdGatunku());
                            gatunekFilmDAO.updateGatunekFilm(newGatunekFilm);
                        }
                    }
                }
//                if (gatunekFilm.size() < newgatunek.length) {
//                    try {
//                        Gatunek gatunek = gatunekDAO.getWybranyGatunek(newgatunek[newgatunek.length-1]);
//                    } catch (NoResultException e) {
//
//                    }
//                }
            }
        else request.setAttribute("blad", "Podałeś błędne dane!");
        }



        RecenzjaDAO recenzjaDAO = new RecenzjaDAO();

        request.setAttribute("film", film);
        List<Gatunek> gatunek = gatunekDAO.getAllGatunkiList();
        request.setAttribute("gatunek", gatunek);

        request.setAttribute("gatunekFilm", gatunekFilm);

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/edytujFilm.jsp").forward(request, response);
    }


}
