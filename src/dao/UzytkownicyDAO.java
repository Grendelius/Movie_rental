package dao;

import models.Uzytkownik;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class UzytkownicyDAO {
    private EntityManager em;

    public UzytkownicyDAO() {
        em = DBConfig.createEntityManager();
    }

    // Metoda zwraca Użytkownika o danym liginie
    public Uzytkownik getUzytkownikPoLoginie(String login) {
        Uzytkownik u = (Uzytkownik) em.createQuery("select u from Uzytkownik u where u.login = :login")
                .setParameter("login", login)
                .getSingleResult();
        return u;
    }

    // Metoda zwraca Użytkownika o danym id
    public Uzytkownik getUzytkownikPoId(int id) {
        Uzytkownik u = (Uzytkownik) em.createQuery("select u from Uzytkownik u where u.id = :id")
                .setParameter("id", id)
                .getSingleResult();
        return u;
    }

    // Metoda sprawdza czy dany login jest już w bazie
    public boolean isLogin(String login) {
        try {
            Uzytkownik u = (Uzytkownik) em.createQuery("select u from Uzytkownik u where u.login = :login")
                    .setParameter("login", login)
                    .getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // Metoda sprawdza czy dany e-mail jest już w bazie
    public boolean isEmail(String email) {
        try {
            Uzytkownik u = (Uzytkownik) em.createQuery("select u from Uzytkownik u where u.email = :email")
                    .setParameter("email", email)
                    .getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // Metoda sprawdza czy dany numer telefonu jest już w bazie
    public boolean isNumerTelefonu(int numerTelefonu) {
        try {
            Uzytkownik u = (Uzytkownik) em.createQuery("select u from Uzytkownik u where u.numerTelefonu = :numerTelefonu")
                    .setParameter("numerTelefonu", numerTelefonu)
                    .getSingleResult();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // Metoda dodaje Użytkownika do bazy
    public boolean addUzytkownika(Uzytkownik u) {
        u.setHaslo(this.getMD5(u.getHaslo()));
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(u);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Metoda zamienia hasło na postać MD5
    public String getMD5(String dane) {
        MessageDigest md5;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
        md5.update(dane.getBytes());
        BigInteger hasz = new BigInteger(1, md5.digest());
        String gotowy = hasz.toString(16);
        if (gotowy.length() == 31)
            gotowy = "0" + gotowy;
        return gotowy;
    }


}
