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

    public List<Film> getFilmy() {
        List<Film> film = this.em.createQuery("select f from Film f")
                .getResultList();
        return film;
    }

    public Film getWybranyFilm(int idFilmu) {
        Film f = (Film) em.createQuery("select f from Film f where f.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getSingleResult();
        return f;
    }

    public int getID() {
        int id = (int) this.em.createQuery("select MAX(idFilmu) from Film")
                .getSingleResult();
        return id;
    }

    public List<Film> getNajnowszeFilmy(){
        List<Film> film = this.em.createQuery("select f from Film f order by dataDodania desc")
                .getResultList();
        return film;
    }


    public boolean setSredniaOcena(int idFilmu) {
        OcenaDAO ocenaDAO = new OcenaDAO();
        List<Integer> oceny = ocenaDAO.getOcenyFilmu(idFilmu);
        double srednia = 0.0;
        for (Integer o : oceny)
            srednia += o;
        srednia /= oceny.size();
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

    public boolean addFilm(Film f) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(f);
            et.commit();
            System.out.println(f.getIdFilmu());
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }


}
