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

    // Metoda zwraca listę wszystkich Wypożyczeń posortowaną po statusie
    public List<Wypozyczenie> getAllWypozyczeniaList() {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w order by status")
                .getResultList();
        return w;
    }

    // Metoda zwraca listę Wypożyczeń wybranego klienta posortowaną po statusie
    public List<Wypozyczenie> getWypozyczeniaKlientaList(int idUzytkownika) {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w where w.idUzytkownika = :idUzytkownika order by status")
                .setParameter("idUzytkownika", idUzytkownika)
                .getResultList();
        return w;
    }

    // Metoda zwraca wybrane Wypożyczenie
    public Wypozyczenie getWypozyczenie(int idWypozyczenia) {
        Wypozyczenie w = (Wypozyczenie) this.em.createQuery("select w from Wypozyczenie w where w.idWypozyczenia = :idWypozyczenia ")
                .setParameter("idWypozyczenia", idWypozyczenia)
                .getSingleResult();
        return w;
    }

    // Metoda zwraca aktualne wypożyczenie wybranego klienta danego filmu
    public Wypozyczenie getAktualneWypozyczenie(int idUzytkownika, int idFilmu) {
        Wypozyczenie w = (Wypozyczenie) this.em.createQuery("select w from Wypozyczenie w where w.idUzytkownika = :idUzytkownika and w.idFilmu =:idFilmu and w.dataZwrotu IS NULL")
                .setParameter("idUzytkownika", idUzytkownika)
                .setParameter("idFilmu", idFilmu)
                .getSingleResult();
        return w;
    }

    // Metoda dodaje Wypożyczenie do tabeli
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

    // Metoda zmienia w tabeli wybrane Wypożyczenie
    public boolean updateWypozyczenie(Wypozyczenie w) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.merge(w);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Metoda usuwa z tabeli wybrane Wypożyczenie
    public boolean deleteWypozyczenie(Wypozyczenie w) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.remove(w);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

}
