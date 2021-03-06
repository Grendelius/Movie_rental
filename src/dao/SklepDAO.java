package dao;

import models.Sklep;
import utils.DBConfig;

import javax.persistence.EntityManager;
import java.util.List;

public class SklepDAO {
    private EntityManager em;

    public SklepDAO() {
        em = DBConfig.createEntityManager();
    }

    // Metoda zwraca wybrany sklep
    public Sklep getSklep(int idSklepu) {
        Sklep s = (Sklep) em.createQuery("select s from Sklep s where s.idSklepu = :idSklepu")
                .setParameter("idSklepu", idSklepu)
                .getSingleResult();
        return s;
    }

    // Metoda zwraca wszystkie sklepy
    public List<Sklep> getSklepList() {
        List<Sklep> s = (List<Sklep>) em.createQuery("select s from Sklep s")
                .getResultList();
        return s;
    }

}
