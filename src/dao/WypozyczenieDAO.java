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

    // Metoda zwraca listę wszystkich aktualnych Wypożyczeń posortowaną po statusie
    public List<Wypozyczenie> getAllAktualneWypozyczeniaList() {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w where w.status != 'Zakończony' order by status")
                .getResultList();
        return w;
    }

    // Metoda zwraca jedno aktualne Wypożyczenie danego filmu
    public Wypozyczenie getAktualneWypozyczeniaFilmu(int idFilmu) {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w where w.status != 'Zakończony' and w.idFilmu =:idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return w.get(0);
    }

    // Metoda zwraca listę wszystkich zakończonych Wypożyczeń posortowaną po dacie
    public List<Wypozyczenie> getAllHistorieWypozyczeniaList() {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w where w.status = 'Zakończony' order by dataWypozyczenia")
                .getResultList();
        return w;
    }

    // Metoda zwraca listę aktualnych Wypożyczeń wybranego klienta posortowaną po statusie
    public List<Wypozyczenie> getAktualneWypozyczeniaKlientaList(int idUzytkownika) {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w where w.idUzytkownika = :idUzytkownika and w.status != 'Zakończony' order by status")
                .setParameter("idUzytkownika", idUzytkownika)
                .getResultList();
        return w;
    }

    // Metoda zwraca listę zakończonych Wypożyczeń wybranego klienta posortowaną po dacie
    public List<Wypozyczenie> getHistorieWypozyczeniaKlientaList(int idUzytkownika) {
        List<Wypozyczenie> w = this.em.createQuery("select w from Wypozyczenie w where w.idUzytkownika = :idUzytkownika and w.status = 'Zakończony' order by dataWypozyczenia")
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

    // Metoda dodaje Wypożyczenie do bazy
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

    // Metoda zmienia w bazie wybrane Wypożyczenie
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

    // Metoda usuwa z bazy wybrane Wypożyczenie
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
