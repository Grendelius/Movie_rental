package models;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Entity
@Table(name = "wypozyczenie")
public class Wypozyczenie implements Serializable {
    private int idWypozyczenia;
    private Timestamp dataWypozyczenia;
    private Timestamp dataZwrotu;
    private int idUzytkownika;
    private int idFilmu;
    private int idSklepu;
    private String status;

    @Id
    @Column(name = "idWypozyczenia")
    public int getIdWypozyczenia() {
        return idWypozyczenia;
    }

    public void setIdWypozyczenia(int idWypozyczenia) {
        this.idWypozyczenia = idWypozyczenia;
    }

    @Basic
    @Column(name = "dataWypozyczenia")
    public Timestamp getDataWypozyczenia() {
        return dataWypozyczenia;
    }

    public void setDataWypozyczenia(Timestamp dataWypozyczenia) {
        this.dataWypozyczenia = dataWypozyczenia;
    }

    @Basic
    @Column(name = "dataZwrotu")
    public Timestamp getDataZwrotu() {
        return dataZwrotu;
    }

    public void setDataZwrotu(Timestamp dataZwrotu) {
        this.dataZwrotu = dataZwrotu;
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

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Wypozyczenie that = (Wypozyczenie) o;

        if (idWypozyczenia != that.idWypozyczenia) return false;
        if (idUzytkownika != that.idUzytkownika) return false;
        if (idFilmu != that.idFilmu) return false;
        if (idSklepu != that.idSklepu) return false;
        if (dataWypozyczenia != null ? !dataWypozyczenia.equals(that.dataWypozyczenia) : that.dataWypozyczenia != null)
            return false;
        if (dataZwrotu != null ? !dataZwrotu.equals(that.dataZwrotu) : that.dataZwrotu != null) return false;
        return status != null ? status.equals(that.status) : that.status == null;
    }

    @Override
    public int hashCode() {
        int result = idWypozyczenia;
        result = 31 * result + (dataWypozyczenia != null ? dataWypozyczenia.hashCode() : 0);
        result = 31 * result + (dataZwrotu != null ? dataZwrotu.hashCode() : 0);
        result = 31 * result + idUzytkownika;
        result = 31 * result + idFilmu;
        result = 31 * result + idSklepu;
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
