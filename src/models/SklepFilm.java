package models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "sklep_film")
public class SklepFilm implements Serializable {
    private int idSklepu;
    private int idFilmu;
    private int iloscFilmow;
    private int iloscDostepnychFilmow;

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

    @Basic
    @Column(name = "iloscDostepnychFilmow")
    public int getIloscDostepnychFilmow() {
        return iloscDostepnychFilmow;
    }

    public void setIloscDostepnychFilmow(int iloscDostepnychFilmow) {
        this.iloscDostepnychFilmow = iloscDostepnychFilmow;
    }
}
