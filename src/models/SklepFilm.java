package models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "sklep_film")
public class SklepFilm implements Serializable {
    private int idSklepu;
    private int idFilmu;
    private int iloscFilmow;

    @Basic
    @Column(name = "iloscFilmow")
    public int getIloscFilmow() {
        return iloscFilmow;
    }

    public void setIloscFilmow(int iloscFilmow) {
        this.iloscFilmow = iloscFilmow;
    }

    @Id
    @Column(name = "idSklepu")
    public int getIdSklepu() {
        return idSklepu;
    }

    public void setIdSklepu(int idSklepu) {
        this.idSklepu = idSklepu;
    }

    @Id
    @Column(name = "idFilmu")
    public int getIdFilmu() {
        return idFilmu;
    }

    public void setIdFilmu(int idFilmu) {
        this.idFilmu = idFilmu;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SklepFilm sklepFilm = (SklepFilm) o;

        if (idSklepu != sklepFilm.idSklepu) return false;
        if (idFilmu != sklepFilm.idFilmu) return false;
        return iloscFilmow == sklepFilm.iloscFilmow;
    }

    @Override
    public int hashCode() {
        int result = idSklepu;
        result = 31 * result + idFilmu;
        result = 31 * result + iloscFilmow;
        return result;
    }
}
