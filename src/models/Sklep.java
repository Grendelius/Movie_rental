package models;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
public class Sklep {
    private int idSklepu;
    private String nazwaSklepu;
    private String ulica;

    @Id
    @GenericGenerator(name="kaugen" , strategy="increment")
    @GeneratedValue(generator="kaugen")
    @Column(name = "idSklepu")
    public int getIdSklepu() {
        return idSklepu;
    }

    public void setIdSklepu(int idSklepu) {
        this.idSklepu = idSklepu;
    }

    @Basic
    @Column(name = "nazwaSklepu")
    public String getNazwaSklepu() {
        return nazwaSklepu;
    }

    public void setNazwaSklepu(String nazwaSklepu) {
        this.nazwaSklepu = nazwaSklepu;
    }

    @Basic
    @Column(name = "ulica")
    public String getUlica() {
        return ulica;
    }

    public void setUlica(String ulica) {
        this.ulica = ulica;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Sklep sklep = (Sklep) o;

        if (idSklepu != sklep.idSklepu) return false;
        if (nazwaSklepu != null ? !nazwaSklepu.equals(sklep.nazwaSklepu) : sklep.nazwaSklepu != null) return false;
        if (ulica != null ? !ulica.equals(sklep.ulica) : sklep.ulica != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idSklepu;
        result = 31 * result + (nazwaSklepu != null ? nazwaSklepu.hashCode() : 0);
        result = 31 * result + (ulica != null ? ulica.hashCode() : 0);
        return result;
    }
}
