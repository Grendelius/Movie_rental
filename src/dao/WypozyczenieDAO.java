package dao;

import models.Wypozyczenie;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class WypozyczenieDAO {
    private EntityManager em;

    public WypozyczenieDAO() {
        em = DBConfig.createEntityManager();
    }

    public List<Wypozyczenie> getWypozyczeniaKlienta(int idUzytkownika) {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w where w.idUzytkownika = :idUzytkownika order by status DESC")
                .setParameter("idUzytkownika", idUzytkownika)
                .getResultList();
        return w;
    }

    public List<Wypozyczenie> getAllWypozyczenia() {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w order by status DESC")
                .getResultList();
        return w;
    }

    public boolean addWypozyczenie(Wypozyczenie w) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(w);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }


}
