package dao;

import models.Zamowienie;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class ZamowienieDAO {
    private EntityManager em;

    public ZamowienieDAO() {
        em = DBConfig.createEntityManager();
    }

    // Metoda zwraca listę wszystkich Zamówień posortowaną po dacie zamówień
    public List<Zamowienie> getAllZamowieniaList() {
        List<Zamowienie> z = this.em.createQuery("select z from Zamowienie z order by dataZamowienia")
                .getResultList();
        return z;
    }

    // Metoda zwraca listę Zamówień wybranego klienta posortowaną po dacie zamówienia
    public List<Zamowienie> getZamowieniaKlientaList(int idUzytkownika) {
        List<Zamowienie> z = this.em.createQuery("select z from Zamowienie z where z.idUzytkownika = :idUzytkownika order by dataZamowienia")
                .setParameter("idUzytkownika", idUzytkownika)
                .getResultList();
        return z;
    }

    // Metoda zwraca wybrane Zamówienie
    public Zamowienie getZamowienie(int idZamowienia) {
        Zamowienie z = (Zamowienie) this.em.createQuery("select z from Zamowienie z where z.idZamowienia =:idZamowienia ")
                .setParameter("idZamowienia", idZamowienia)
                .getSingleResult();
        return z;
    }

    // Metoda zwraca pierwsze zamówienie z listy oczekujących na wybrany film w danym sklepie
    public Zamowienie getZamowienie(int idFilmu, int idSklepu){
        List<Zamowienie> z = (List<Zamowienie>) this.em.createQuery("select z from Zamowienie z where z.idFilmu =:idFilmu and z.idSklepu =:idSklepu order by dataZamowienia ASC")
                .setParameter("idFilmu", idFilmu)
                .setParameter("idSklepu", idSklepu)
                .getResultList();
        return z.get(0);
    }

    // Metoda zwraca zamówienie wybranego klienta danego filmu
    public Zamowienie getAktualneZamowienie(int idUzytkownika, int idFilmu) {
        Zamowienie z = (Zamowienie) this.em.createQuery("select z from Zamowienie z where z.idUzytkownika = :idUzytkownika and z.idFilmu =:idFilmu")
                .setParameter("idUzytkownika", idUzytkownika)
                .setParameter("idFilmu", idFilmu)
                .getSingleResult();
        return z;
    }

    // Metoda dodaje Zamówienie do bazy
    public boolean addZamowienie(Zamowienie z) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(z);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Metoda usuwa z bazy wybrane Wypożyczenie
    public boolean deleteZamowienie(Zamowienie z) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.remove(z);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }


}
