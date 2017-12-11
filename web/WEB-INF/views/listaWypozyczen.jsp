<%@ page import="models.Wypozyczenie" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.FilmDAO" %>
<%@ page import="dao.SklepDAO" %>
<%@ page import="models.Uzytkownik" %>
<%@ page import="models.Zamowienie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wypozyczalnia</title>
</head>
<body>
<%
    Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
%>
<h1>Lista Wypożyczeń:</h1>
<table border="1">
    <tr>
        <th>Nazwa Filmu</th>
        <th>Nazwa Sklepu</th>
        <th>Nazwa Ulicy</th>
        <%if (zalogowany.getRola().equals("pracownik")){%><th>Id Użytkownika</th><%}%>
        <th>Data Wypożyczenia</th>
        <th>Data Zwrotu</th>
        <th>Status Wypożyczenia</th>
        <th>Zmień Status</th>
    </tr>
<%
    List<Wypozyczenie> wypozyczenie = (List<Wypozyczenie>) request.getAttribute("wypozyczenie");
    FilmDAO filmDAO = new FilmDAO();
    SklepDAO sklepDAO = new SklepDAO();
    for (Wypozyczenie w: wypozyczenie) {
        %>

    <tr>
        <td><%=(filmDAO.getWybranyFilm(w.getIdFilmu()).getTytul())%></td>
        <td><%=(sklepDAO.getSklep(w.getIdSklepu()).getNazwaSklepu())%></td>
        <td><%=(sklepDAO.getSklep(w.getIdSklepu()).getUlica())%></td>
        <%if (zalogowany.getRola().equals("pracownik")){%><td><%=w.getIdUzytkownika()%></td><%}%>
        <td><%=w.getDataWypozyczenia()%></td>
        <td><%=w.getDataZwrotu()%></td>
        <td><%=w.getStatus()%></td>
        <%
            if (zalogowany.getRola().equals("pracownik") && !w.getStatus().equals("Zakończony")){
        %>
        <td>
            <form method="post" action="listaWypozyczen">
                <input type="hidden" name="idWypozyczenia" value="<%=w.getIdWypozyczenia()%>"/>
                <select name="nowyStatus">
                    <option>Do odbioru w sklepie</option>
                    <option>Wypożyczony</option>
                    <option>Zakończony</option>
                    <option>Anuluj wypożyczenie</option>
                </select>
                <center>
                    <input type="submit" value="Zatwierź">
                </center>
            </form>
        </td>
        <%
            }
            else if (zalogowany.getRola().equals("klient")&& w.getStatus().equals("W trakcie realizacji")){

                %>
        <td>
            <form method="post" action="listaWypozyczen">
                <input type="hidden" name="idWypozyczenia" value="<%=w.getIdWypozyczenia()%>"/>
                <input type="submit" name="nowyStatus" value="Anuluj wypożyczenie">
            </form>
        </td>
        <%
            }
        %>
    </tr>
<%
    }
%>
</table>


<br><br>
<h1>Lista Zamówień:</h1>
<table border="1">
    <tr>
        <th>Nazwa Filmu</th>
        <th>Nazwa Sklepu</th>
        <th>Nazwa Ulicy</th>
        <%if (zalogowany.getRola().equals("pracownik")){%><th>Id Użytkownika</th><%}%>
        <th>Data Zamówienia</th>
        <th>Anulowanie Zamówienia</th>
    </tr>
    <%
        List<Zamowienie> zamowienie = (List<Zamowienie>) request.getAttribute("zamowienie");
        for (Zamowienie z: zamowienie) {
    %>
    <tr>
        <td><%=(filmDAO.getWybranyFilm(z.getIdFilmu()).getTytul())%></td>
        <td><%=(sklepDAO.getSklep(z.getIdSklepu()).getNazwaSklepu())%></td>
        <td><%=(sklepDAO.getSklep(z.getIdSklepu()).getUlica())%></td>
        <%if (zalogowany.getRola().equals("pracownik")){%><td><%=z.getIdUzytkownika()%></td><%}%>
        <td><%=z.getDataZamowienia()%></td>
        <td>
            <form method="post" action="listaWypozyczen">
                <input type="hidden" name="idZamowienia" value="<%=z.getIdZamowienia()%>"/>
                <input type="submit" name="nowyStatus" value="Anuluj zamówienie">
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
