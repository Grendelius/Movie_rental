package dao;

import models.Zapowiedz;
import utils.DBConfig;

import javax.persistence.EntityManager;
import java.util.List;

public class ZapowiedzDAO {
    private EntityManager em;

    public ZapowiedzDAO() {
        em = DBConfig.createEntityManager();
    }

    public List<Zapowiedz> getAllZapowiedz(int idFilmu) {
        List<Zapowiedz> z = this.em.createQuery("select z from Zapowiedz z where z.idFilmu = :idFilmu ")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return z;
    }
}
