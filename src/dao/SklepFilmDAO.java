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

    public List<SklepFilm> getSklepFilmPoIdFilmu(int idFilmu) {
        List<SklepFilm> s = this.em.createQuery("select s from SklepFilm s where s.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return s;
    }

    private SklepFilm getWybranySklepFilm(int idFilmu, int idSklepu) {
        SklepFilm s = (SklepFilm) em.createQuery("select s from SklepFilm s where s.idFilmu = :idFilmu and s.idSklepu = :idSklepu")
                .setParameter("idFilmu", idFilmu)
                .setParameter("idSklepu", idSklepu)
                .getSingleResult();
        return s;
    }

    public boolean updateIloscFilmow(int idFilmu, int idSklepu) {
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
}


