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
        List<Gatunek> g = this.em.createQuery("select g from Gatunek g")
                .getResultList();
        return g;
    }

    // Metoda zwraca listę gatunków bez powtórzeń
    public List<String> getDistinctGatunkiList() {
        List<String> gatunek = this.em.createQuery("select distinct nazwa from Gatunek ")
                .getResultList();
        return gatunek;
    }

    // Metoda zwraca listę wszystkich gatunków wybranego filmu
    public List<Gatunek> getGatunkiFilmuList(int idFilmu) {
        List<Gatunek> g = this.em.createQuery("select g from Gatunek g where g.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
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


}
