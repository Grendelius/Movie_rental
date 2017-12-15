package dao;

import models.Recenzja;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class RecenzjaDAO {
    private EntityManager em;

    public RecenzjaDAO() {
        em = DBConfig.createEntityManager();
    }

    public List<Recenzja> getRecenzjeList(int idFilmu) {
        List<Recenzja> r = this.em.createQuery("select r from Recenzja r where r.idFilmu = :idFilmu order by data DESC")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return r;
    }

    public Recenzja getRecenzje(int idRecenzji) {
        Recenzja r = (Recenzja) this.em.createQuery("select r from Recenzja r where r.idRecenzji = :idRecenzji")
                .setParameter("idRecenzji", idRecenzji)
                .getSingleResult();
        return r;
    }

    public boolean addRecenzje(Recenzja r) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(r);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateRecenzje(Recenzja r) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.merge(r);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteRecenzje(Recenzja r) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.remove(r);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

}
