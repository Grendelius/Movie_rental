package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class GatunekPK implements Serializable {
    private String nazwa;
    private int idFilmu;

    @Column(name = "nazwa")
    @Id
    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    @Column(name = "idFilmu")
    @Id
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

        GatunekPK gatunekPK = (GatunekPK) o;

        if (idFilmu != gatunekPK.idFilmu) return false;
        if (nazwa != null ? !nazwa.equals(gatunekPK.nazwa) : gatunekPK.nazwa != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nazwa != null ? nazwa.hashCode() : 0;
        result = 31 * result + idFilmu;
        return result;
    }
}
