<%@ page import="models.Wypozyczenie" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.FilmDAO" %>
<%@ page import="dao.SklepDAO" %>
<%@ page import="models.Uzytkownik" %>
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
        <th>Nazwa filmu</th>
        <th>Nazwa sklepu</th>
        <th>Nazwa Ulicy</th>
        <%if (zalogowany.getRola().equals("pracownik")){%><th>Id Użytkownika</th><%}%>
        <th>Data wypożyczenia</th>
        <th>Data zwrotu</th>
        <th>Status Wypożyczenia</th>
        <th>Zmień status</th>
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
</body>
</html>
