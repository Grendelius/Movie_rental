package models;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "film")
public class Film {
    private int idFilmu;
    private String tytul;
    private int rokProdukcji;
    private double sredniaOcena;
    private Date dataDodania;
    private String okladka;
    private String opis;

    @Id
    @GenericGenerator(name="kaugen" , strategy="increment")
    @GeneratedValue(generator="kaugen")
    @Column(name = "idFilmu")
    public int getIdFilmu() {
        return idFilmu;
    }

    public void setIdFilmu(int idFilmu) {
        this.idFilmu = idFilmu;
    }

    @Basic
    @Column(name = "tytul")
    public String getTytul() {
        return tytul;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    @Basic
    @Column(name = "rokProdukcji")
    public int getRokProdukcji() {
        return rokProdukcji;
    }

    public void setRokProdukcji(int rokProdukcji) {
        this.rokProdukcji = rokProdukcji;
    }

    @Basic
    @Column(name = "sredniaOcena")
    public double getSredniaOcena() {
        return sredniaOcena;
    }

    public void setSredniaOcena(double sredniaOcena) {
        this.sredniaOcena = sredniaOcena;
    }

    @Basic
    @Column(name = "dataDodania")
    public Date getDataDodania() {
        return dataDodania;
    }

    public void setDataDodania(Date dataDodania) {
        this.dataDodania = dataDodania;
    }

    @Basic
    @Column(name = "okladka")
    public String getOkladka() {
        return okladka;
    }

    public void setOkladka(String okladka) {
        this.okladka = okladka;
    }

    @Basic
    @Column(name = "opis")
    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Film film = (Film) o;

        if (idFilmu != film.idFilmu) return false;
        if (rokProdukcji != film.rokProdukcji) return false;
        if (Double.compare(film.sredniaOcena, sredniaOcena) != 0) return false;
        if (tytul != null ? !tytul.equals(film.tytul) : film.tytul != null) return false;
        return dataDodania != null ? dataDodania.equals(film.dataDodania) : film.dataDodania == null;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = idFilmu;
        result = 31 * result + (tytul != null ? tytul.hashCode() : 0);
        result = 31 * result + rokProdukcji;
        temp = Double.doubleToLongBits(sredniaOcena);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (dataDodania != null ? dataDodania.hashCode() : 0);
        return result;
    }
}
