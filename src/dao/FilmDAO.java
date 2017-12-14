package dao;

import models.Film;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class FilmDAO {
    private EntityManager em;

    public FilmDAO() {
        em = DBConfig.createEntityManager();
    }

    // Metoda zwraca listę filmów posortowanych od najnowszych do najstarszych
    public List<Film> getNajnowszeFilmyList(){
        List<Film> film = this.em.createQuery("select f from Film f order by dataDodania desc")
                .getResultList();
        return film;
    }

    // Metoda zwraca wybrany film
    public Film getWybranyFilm(int idFilmu) {
        Film f = (Film) em.createQuery("select f from Film f where f.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getSingleResult();
        return f;
    }

    public int getId() {
        int id = (int) this.em.createQuery("select MAX(idFilmu) from Film")
                .getSingleResult();
        return id;
    }

    public List<Film> getFilmyGatunkowe(int idGatunku){
        List<Film> f =  this.em.createQuery("select f from Film f where f.idFilmu = (select idFilmu from GatunekFilm where idGatunku =:idGatunku)")
                .setParameter("idGatunku", idGatunku)
                .getResultList();
        return f;
    }

    // Metoda dodaje Film do bazy
    public boolean addFilm(Film f) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(f);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Metoda edytuje wybrany Film
    public boolean updateFilm(Film f) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.merge(f);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Metoda zmienia średnią ocenę na podstawie wszystkich ocen danego filmu
    public boolean updateSredniaOcena(int idFilmu) {
        OcenaDAO ocenaDAO = new OcenaDAO();
        List<Integer> oceny = ocenaDAO.getOcenyFilmu(idFilmu);
        double srednia = 0.0;
        for (Integer o : oceny)
            srednia += o;
        srednia /= oceny.size();
        srednia = Math.round(srednia*100.0)/100.0;
        Film film = getWybranyFilm(idFilmu);
        film.setSredniaOcena(srednia);
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.merge(film);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }


}
