package models;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "gatunek")
public class Gatunek {
    private int idGatunku;
    private String nazwa;

    @Id
    @GenericGenerator(name="kaugen" , strategy="increment")
    @GeneratedValue(generator="kaugen")
    @Column(name = "idGatunku")
    public int getIdGatunku() {
        return idGatunku;
    }

    public void setIdGatunku(int idGatunku) {
        this.idGatunku = idGatunku;
    }

    @Basic
    @Column(name = "nazwa")
    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Gatunek gatunek = (Gatunek) o;

        if (idGatunku != gatunek.idGatunku) return false;
        if (nazwa != null ? !nazwa.equals(gatunek.nazwa) : gatunek.nazwa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idGatunku;
        result = 31 * result + (nazwa != null ? nazwa.hashCode() : 0);
        return result;
    }
}
