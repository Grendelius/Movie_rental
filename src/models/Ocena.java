package models;

import javax.persistence.*;

@Entity
@Table(name = "ocena")
public class Ocena {
    private int idOceny;
    private int wartosc;
    private int idUzytkownika;
    private int idFilmu;

    @Id
    @Column(name = "idOceny")
    public int getIdOceny() {
        return idOceny;
    }

    public void setIdOceny(int idOceny) {
        this.idOceny = idOceny;
    }

    @Basic
    @Column(name = "wartosc")
    public int getOcena() {
        return wartosc;
    }

    public void setOcena(int ocena) {
        this.wartosc = ocena;
    }

    @Basic
    @Column(name = "idUzytkownika")
    public int getIdUzytkownika() {
        return idUzytkownika;
    }

    public void setIdUzytkownika(int idUzytkownika) {
        this.idUzytkownika = idUzytkownika;
    }

    @Basic
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

        Ocena ocena1 = (Ocena) o;

        if (idOceny != ocena1.idOceny) return false;
        if (wartosc != ocena1.wartosc) return false;
        if (idUzytkownika != ocena1.idUzytkownika) return false;
        if (idFilmu != ocena1.idFilmu) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idOceny;
        result = 31 * result + wartosc;
        result = 31 * result + idUzytkownika;
        result = 31 * result + idFilmu;
        return result;
    }
}
