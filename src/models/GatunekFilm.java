package models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "gatunek_film")
public class GatunekFilm implements Serializable{
    private int idFilmu;
    private int idGatunku;

    @Id
    @Column(name = "idFilmu")
    public int getIdFilmu() {
        return idFilmu;
    }

    public void setIdFilmu(int idFilmu) {
        this.idFilmu = idFilmu;
    }

    @Id
    @Column(name = "idGatunku")
    public int getIdGatunku() {
        return idGatunku;
    }

    public void setIdGatunku(int idGatunku) {
        this.idGatunku = idGatunku;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GatunekFilm that = (GatunekFilm) o;

        if (idFilmu != that.idFilmu) return false;
        if (idGatunku != that.idGatunku) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idFilmu;
        result = 31 * result + idGatunku;
        return result;
    }
}
