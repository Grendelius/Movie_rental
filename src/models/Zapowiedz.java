package models;

import javax.persistence.*;
import java.sql.Time;

@Entity
@Table(name = "zapowiedz")
public class Zapowiedz {
    private int idFilmu;
    private String linkZapowiedzi;
    private Time czasTrwania;

    @Id
    @Column(name = "idFilmu")
    public int getIdFilmu() {
        return idFilmu;
    }

    public void setIdFilmu(int idFilmu) {
        this.idFilmu = idFilmu;
    }

    @Basic
    @Column(name = "linkZapowiedzi")
    public String getLinkZapowiedzi() {
        return linkZapowiedzi;
    }

    public void setLinkZapowiedzi(String linkZapowiedzi) {
        this.linkZapowiedzi = linkZapowiedzi;
    }

    @Basic
    @Column(name = "czasTrwania")
    public Time getCzasTrwania() {
        return czasTrwania;
    }

    public void setCzasTrwania(Time czasTrwania) {
        this.czasTrwania = czasTrwania;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Zapowiedz zapowiedz = (Zapowiedz) o;

        if (idFilmu != zapowiedz.idFilmu) return false;
        if (linkZapowiedzi != null ? !linkZapowiedzi.equals(zapowiedz.linkZapowiedzi) : zapowiedz.linkZapowiedzi != null)
            return false;
        return czasTrwania != null ? czasTrwania.equals(zapowiedz.czasTrwania) : zapowiedz.czasTrwania == null;
    }

    @Override
    public int hashCode() {
        int result = idFilmu;
        result = 31 * result + (linkZapowiedzi != null ? linkZapowiedzi.hashCode() : 0);
        result = 31 * result + (czasTrwania != null ? czasTrwania.hashCode() : 0);
        return result;
    }
}
