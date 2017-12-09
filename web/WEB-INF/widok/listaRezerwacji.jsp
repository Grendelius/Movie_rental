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
<h1>Lista Rezeracji:</h1>
<table border="1">
    <tr>
        <th>Nazwa filmu</th>
        <th>Nazwa sklepu</th>
        <th>Nazwa Ulicy</th>
        <%if (zalogowany.getRola().equals("pracownik")){%><th>Id Użytkownika</th><%}%>
        <th>Data wypożyczenia</th>
        <th>Data zwrotu</th>
        <th>Status rezerwacji</th>
    </tr>
<%
    List<Wypozyczenie> wypozyczenie = (List<Wypozyczenie>) request.getAttribute("wypozyczenie");
    FilmDAO filmDAO = new FilmDAO();
    SklepDAO sklepDAO = new SklepDAO();
    for (Wypozyczenie w: wypozyczenie) {
        %>

    <tr>
        <td><%=(filmDAO.getWybranyFilm(w.getIdFilmu()).getTytul())%></td>
        <td><%=(sklepDAO.getSklepPoId(w.getIdSklepu()).getNazwaSklepu())%></td>
        <td><%=(sklepDAO.getSklepPoId(w.getIdSklepu()).getUlica())%></td>
        <%if (zalogowany.getRola().equals("pracownik")){%><th><%=w.getIdUzytkownika()%></th><%}%>
        <td><%=w.getDataWypozyczenia()%></td>
        <td><%if (w.getDataZwrotu() != null) w.getDataZwrotu();%></td>
        <td><%=w.getStatus()%></td>
    </tr>
<%
    }
%>
</table>
</body>
</html>
