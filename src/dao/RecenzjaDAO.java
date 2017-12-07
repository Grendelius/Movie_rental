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

    public List<Recenzja> getKomentarze(int idFilmu) {
        System.out.println(idFilmu);
        List<Recenzja> r = this.em.createQuery("select r from Recenzja r where idFilmu = :idFilmu order by data DESC")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
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

}
