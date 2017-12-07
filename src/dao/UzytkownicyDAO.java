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

    public Uzytkownik getPoLoginie(String login) {
        Uzytkownik u = (Uzytkownik) em.createQuery("select u from Uzytkownik u where u.login = :login")
                .setParameter("login", login)
                .getSingleResult();
        return u;
    }

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

    public Uzytkownik getPoId(int id) {
        Uzytkownik u = (Uzytkownik) em.createQuery("select u from Uzytkownik u where u.id = :id")
                .setParameter("id", id)
                .getSingleResult();
        return u;
    }

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
