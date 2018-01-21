package dao;

import models.GatunekFilm;
import utils.DBConfig;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class GatunekFilmDAO {
    private EntityManager em;

    public GatunekFilmDAO() {
        em = DBConfig.createEntityManager();
    }

    // Metoda zwraca listę wszystkich GatunekFilm
    public List<GatunekFilm> getAllGatunekFilm() {
        List<GatunekFilm> g = this.em.createQuery("select g from GatunekFilm g")
                .getResultList();
        return g;
    }

    // Metoda zwraca listę GatunekFilm dla wybranego gatunku
    public List<GatunekFilm> getGatunekFilmPoGatunkuList(int idGatunku) {
        List<GatunekFilm> g = this.em.createQuery("select g from GatunekFilm g where g.idGatunku = :idGatunku")
                .setParameter("idGatunku", idGatunku)
                .getResultList();
        return g;
    }

    public GatunekFilm getGatunekFilmPoGatunku(int idGatunku) {
        List<GatunekFilm> g = this.em.createQuery("select g from GatunekFilm g where g.idGatunku = :idGatunku")
                .setParameter("idGatunku", idGatunku)
                .getResultList();
        return g.get(0);
    }

    // Metoda zwraca listę GatunekFilm dla wybranego filmu
    public List<GatunekFilm> getGatunekFilmPoFilmieList(int idFilmu) {
        List<GatunekFilm> g = this.em.createQuery("select g from GatunekFilm g where g.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return g;
    }

    // Metoda zwraca wybrany gatunekFilm
    public GatunekFilm getWybranyGatunek(int idFilmu, int idGatunku) {
        GatunekFilm g = (GatunekFilm) em.createQuery("select g from GatunekFilm g where g.idFilmu =:idFilmu and g.idGatunku =:idGatunku")
                .setParameter("idFilmu", idFilmu)
                .setParameter("idGatunku", idGatunku)
                .getSingleResult();
        return g;
    }

    // Metoda dodaje nowy GatunekFilm
    public boolean addGatunekFilm(GatunekFilm g) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(g);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Metoda usuwa wybrany GatunekFilm
    public boolean deleteGatunekFilm(GatunekFilm g) {
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.remove(g);
            et.commit();
            return true;
        } catch (Exception e) {
            et.rollback();
            e.printStackTrace();
            return false;
        }
    }


}
