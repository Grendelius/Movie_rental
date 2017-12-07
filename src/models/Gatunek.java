package models;

import javax.persistence.*;

@Entity
@IdClass(GatunekPK.class)
@Table(name = "gatunek")
public class Gatunek {
    private String nazwa;
    private int idFilmu;

    @Id
    @Column(name = "nazwa")
    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
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

        Gatunek gatunek = (Gatunek) o;

        if (idFilmu != gatunek.idFilmu) return false;
        if (nazwa != null ? !nazwa.equals(gatunek.nazwa) : gatunek.nazwa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nazwa != null ? nazwa.hashCode() : 0;
        result = 31 * result + idFilmu;
        return result;
    }
}
