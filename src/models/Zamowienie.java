package models;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "zamowienie")
public class Zamowienie implements Serializable{
    private int idZamowienia;
    private Timestamp dataZamowienia;
    private int idUzytkownika;
    private int idFilmu;
    private int idSklepu;

    @Id
    @GenericGenerator(name="kaugen" , strategy="increment")
    @GeneratedValue(generator="kaugen")
    @Column(name = "idZamowienia")
    public int getIdZamowienia() {
        return idZamowienia;
    }

    public void setIdZamowienia(int idZamowienia) {
        this.idZamowienia = idZamowienia;
    }

    @Basic
    @Column(name = "dataZamowienia")
    public Timestamp getDataZamowienia() {
        return dataZamowienia;
    }

    public void setDataZamowienia(Timestamp dataZamowienia) {
        this.dataZamowienia = dataZamowienia;
    }

    @Id
    @Column(name = "idUzytkownika")
    public int getIdUzytkownika() {
        return idUzytkownika;
    }

    public void setIdUzytkownika(int idUzytkownika) {
        this.idUzytkownika = idUzytkownika;
    }

    @Id
    @Column(name = "idFilmu")
    public int getIdFilmu() {
        return idFilmu;
    }

    public void setIdFilmu(int idFilmu) {
        this.idFilmu = idFilmu;
    }

    @Id
    @Column(name = "idSklepu")
    public int getIdSklepu() {
        return idSklepu;
    }

    public void setIdSklepu(int idSklepu) {
        this.idSklepu = idSklepu;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Zamowienie that = (Zamowienie) o;

        if (idZamowienia != that.idZamowienia) return false;
        if (idUzytkownika != that.idUzytkownika) return false;
        if (idFilmu != that.idFilmu) return false;
        if (idSklepu != that.idSklepu) return false;
        return dataZamowienia != null ? dataZamowienia.equals(that.dataZamowienia) : that.dataZamowienia == null;
    }

    @Override
    public int hashCode() {
        int result = idZamowienia;
        result = 31 * result + (dataZamowienia != null ? dataZamowienia.hashCode() : 0);
        result = 31 * result + idUzytkownika;
        result = 31 * result + idFilmu;
        result = 31 * result + idSklepu;
        return result;
    }
}
