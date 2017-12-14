package dao;

import models.Gatunek;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class GatunekDAO {

    private EntityManager em;

    public GatunekDAO() {
        em = DBConfig.createEntityManager();
    }

    // Metoda zwraca listę wszystkich gatunków
    public List<Gatunek> getAllGatunkiList() {
        List<Gatunek> g = this.em.createQuery("select g from Gatunek g order by nazwa")
                .getResultList();
        return g;
    }

    // Metoda zwraca wybrany gatunek
    public Gatunek getWybranyGatunekPoId(int idGatunku) {
        Gatunek g = (Gatunek) em.createQuery("select g from Gatunek g where g.idGatunku =:idGatunku")
                .setParameter("idGatunku", idGatunku)
                .getSingleResult();
        return g;
    }

    // Metoda zwraca wybrany gatunek o danej nazwie
    public Gatunek getWybranyGatunekPoNazwie(String nazwa) {
        Gatunek g = (Gatunek) em.createQuery("select g from Gatunek g where g.nazwa =:nazwa")
                .setParameter("nazwa", nazwa)
                .getSingleResult();
        return g;
    }

    // Metoda dodaje Gatunek do bazy
    public boolean addGatunek(Gatunek g) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(g);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Metoda usuwa Gatunek z bazy
    public boolean deleteGatunek(Gatunek g) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.remove(g);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

}
