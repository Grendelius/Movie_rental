package models;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "recenzja")
public class Recenzja {
    private int idRecenzji;
    private String tresc;
    private Timestamp data;
    private int idUzytkownika;
    private int idFilmu;

    @Id
    @GenericGenerator(name="kaugen" , strategy="increment")
    @GeneratedValue(generator="kaugen")
    @Column(name = "idRecenzji")
    public int getIdReceznji() {
        return idRecenzji;
    }

    public void setIdReceznji(int idReceznji) {
        this.idRecenzji = idRecenzji;
    }

    @Basic
    @Column(name = "tresc")
    public String getTresc() {
        return tresc;
    }

    public void setTresc(String tresc) {
        this.tresc = tresc;
    }

    @Basic
    @Column(name = "data")
    public Timestamp getData() {
        return data;
    }

    public void setData(Timestamp data) {
        this.data = data;
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

        Recenzja recenzja = (Recenzja) o;

        if (idRecenzji != recenzja.idRecenzji) return false;
        if (idUzytkownika != recenzja.idUzytkownika) return false;
        if (idFilmu != recenzja.idFilmu) return false;
        if (tresc != null ? !tresc.equals(recenzja.tresc) : recenzja.tresc != null) return false;
        if (data != null ? !data.equals(recenzja.data) : recenzja.data != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idRecenzji;
        result = 31 * result + (tresc != null ? tresc.hashCode() : 0);
        result = 31 * result + (data != null ? data.hashCode() : 0);
        result = 31 * result + idUzytkownika;
        result = 31 * result + idFilmu;
        return result;
    }
}
