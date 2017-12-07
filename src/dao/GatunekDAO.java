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

    public List<Gatunek> getWszystkieGatunki() {
        List<Gatunek> g = this.em.createQuery("select g from Gatunek g")
                .getResultList();
        return g;
    }

    public List<String> getGatunki() {
        List<String> gatunek = this.em.createQuery("select distinct nazwa from Gatunek ")
                .getResultList();
        return gatunek;
    }

    public List<Gatunek> getWybraneGatunki(int idFilmu) {
        List<Gatunek> g = this.em.createQuery("select g from Gatunek g where g.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();;
        return g;
    }

     {
    }

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
}
