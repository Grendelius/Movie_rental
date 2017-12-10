package dao;

import models.SklepFilm;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class SklepFilmDAO {
    private EntityManager em;

    public SklepFilmDAO() {
        em = DBConfig.createEntityManager();
    }

    // Metoda zwraca listę SklepFilm dla wybranego filmu
    public List<SklepFilm> getWybraneSklepFilmList(int idFilmu) {
        List<SklepFilm> s = this.em.createQuery("select s from SklepFilm s where s.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return s;
    }

    // Metoda zwraca wybrany SklepList dla wybranego filmu i sklepu
    private SklepFilm getWybranySklepFilm(int idFilmu, int idSklepu) {
        SklepFilm s = (SklepFilm) em.createQuery("select s from SklepFilm s where s.idFilmu = :idFilmu and s.idSklepu = :idSklepu")
                .setParameter("idFilmu", idFilmu)
                .setParameter("idSklepu", idSklepu)
                .getSingleResult();
        return s;
    }

    // Metoda zmniejsza w tabeli ilość sztuk wybranego filmu w wybranym sklepie
    public boolean zmniejszIloscFilmow(int idFilmu, int idSklepu) {
        SklepFilm sklepFilm = getWybranySklepFilm(idFilmu, idSklepu);
        sklepFilm.setIloscFilmow(sklepFilm.getIloscFilmow() - 1);
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.merge(sklepFilm);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Metoda zmniejsza w tabeli ilość sztuk wybranego filmu w wybranym sklepie
    public boolean zwiekszIloscFilmow(int idFilmu, int idSklepu) {
        SklepFilm sklepFilm = getWybranySklepFilm(idFilmu, idSklepu);
        sklepFilm.setIloscFilmow(sklepFilm.getIloscFilmow() + 1);
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.merge(sklepFilm);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }


}


