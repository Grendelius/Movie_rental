package dao;

import models.Ocena;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import java.util.List;

public class OcenaDAO {
    private EntityManager em;

    public OcenaDAO() {
        em = DBConfig.createEntityManager();
    }

    public boolean getPoUzytkowniku(int idUzytkownika, int idFilmu) {
        try {
            Ocena o = (Ocena) em.createQuery("select o from Ocena o where o.idUzytkownika = :idUzytkownika and o.idFilmu = :idFilmu")
                    .setParameter("idFilmu", idFilmu)
                    .setParameter("idUzytkownika", idUzytkownika)
                    .getSingleResult();
            return true;
        } catch (NoResultException e) {
            return false;
        }
    }

    public List<Integer> getOcenyFilmu(int idFilmu) {
        List<Integer> oceny = em.createQuery("select ocena from Ocena where idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return oceny;
    }

    public List<Ocena> getOcenyFilmuList(int idFilmu) {
        List<Ocena> o = em.createQuery("select o from Ocena o where o.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return o;
    }


    public Ocena getOcene(int idUzytkownika, int idFilmu) {
        Ocena o = (Ocena) em.createQuery("select o from Ocena o where o.idUzytkownika = :idUzytkownika and o.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .setParameter("idUzytkownika", idUzytkownika)
                .getSingleResult();
        return o;
    }

    public boolean addOcene(Ocena o) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(o);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }

    }

    public boolean deleteOcene(Ocena o) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.remove(o);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }


}
