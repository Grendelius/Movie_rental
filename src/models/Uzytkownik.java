package models;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "uzytkownik")
public class Uzytkownik {
    private int idUzytkownika;
    private String login;
    private String haslo;
    private String imie;
    private String nazwisko;
    private int numerTelefonu;
    private String miejsceZamieszkania;
    private String email;
    private String rola;
    private boolean zablokowany;
    private int idSklepu;

    @Id
    @GenericGenerator(name="kaugen" , strategy="increment")
    @GeneratedValue(generator="kaugen")
    @Column(name = "idUzytkownika")
    public int getIdUzytkownika() {
        return idUzytkownika;
    }

    public void setIdUzytkownika(int idUzytkownika) {
        this.idUzytkownika = idUzytkownika;
    }

    @Basic
    @Column(name = "login")
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    @Basic
    @Column(name = "haslo")
    public String getHaslo() {
        return haslo;
    }

    public void setHaslo(String haslo) {
        this.haslo = haslo;
    }

    @Basic
    @Column(name = "imie")
    public String getImie() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    @Basic
    @Column(name = "nazwisko")
    public String getNazwisko() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    @Basic
    @Column(name = "numerTelefonu")
    public int getNumerTelefonu() {
        return numerTelefonu;
    }

    public void setNumerTelefonu(int numerTelefonu) {
        this.numerTelefonu = numerTelefonu;
    }

    @Basic
    @Column(name = "miejsceZamieszkania")
    public String getMiejsceZamieszkania() {
        return miejsceZamieszkania;
    }

    public void setMiejsceZamieszkania(String miejsceZamieszkania) {
        this.miejsceZamieszkania = miejsceZamieszkania;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "rola")
    public String getRola() {
        return rola;
    }

    public void setRola(String rola) {
        this.rola = rola;
    }

    @Basic
    @Column(name = "zablokowany")
    public boolean isZablokowany() {
        return zablokowany;
    }

    public void setZablokowany(boolean zablokowany) {
        this.zablokowany = zablokowany;
    }

    @Basic
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

        Uzytkownik that = (Uzytkownik) o;

        if (idUzytkownika != that.idUzytkownika) return false;
        if (numerTelefonu != that.numerTelefonu) return false;
        if (zablokowany != that.zablokowany) return false;
        if (idSklepu != that.idSklepu) return false;
        if (login != null ? !login.equals(that.login) : that.login != null) return false;
        if (haslo != null ? !haslo.equals(that.haslo) : that.haslo != null) return false;
        if (imie != null ? !imie.equals(that.imie) : that.imie != null) return false;
        if (nazwisko != null ? !nazwisko.equals(that.nazwisko) : that.nazwisko != null) return false;
        if (miejsceZamieszkania != null ? !miejsceZamieszkania.equals(that.miejsceZamieszkania) : that.miejsceZamieszkania != null)
            return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        return rola != null ? rola.equals(that.rola) : that.rola == null;
    }

    @Override
    public int hashCode() {
        int result = idUzytkownika;
        result = 31 * result + (login != null ? login.hashCode() : 0);
        result = 31 * result + (haslo != null ? haslo.hashCode() : 0);
        result = 31 * result + (imie != null ? imie.hashCode() : 0);
        result = 31 * result + (nazwisko != null ? nazwisko.hashCode() : 0);
        result = 31 * result + numerTelefonu;
        result = 31 * result + (miejsceZamieszkania != null ? miejsceZamieszkania.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (rola != null ? rola.hashCode() : 0);
        result = 31 * result + (zablokowany ? 1 : 0);
        result = 31 * result + idSklepu;
        return result;
    }

}

