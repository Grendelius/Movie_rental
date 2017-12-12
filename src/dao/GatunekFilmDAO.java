package dao;

import models.GatunekFilm;
import utils.DBConfig;

import javax.persistence.EntityManager;
import java.util.List;

public class GatunekFilmDAO {
    private EntityManager em;

    public GatunekFilmDAO() {
        em = DBConfig.createEntityManager();
    }

    // Metoda zwraca listę GatunekFilm dla wybranego gatunku
    public List<GatunekFilm> getGatunekFilmPoGatunkuList(int idGatunku) {
        List<GatunekFilm> g = this.em.createQuery("select g from GatunekFilm g where g.idGatunku = :idGatunku")
                .setParameter("idGatunku", idGatunku)
                .getResultList();
        return g;
    }

    // Metoda zwraca listę GatunekFilm dla wybranego filmu
    public List<GatunekFilm> getGatunekFilmPoFilmieList(int idFilmu) {
        List<GatunekFilm> g = this.em.createQuery("select g from GatunekFilm g where g.idFilmu = :idFilmu")
                .setParameter("idFilmu", idFilmu)
                .getResultList();
        return g;
    }


}
