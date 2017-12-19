<%@ page import="models.Uzytkownik" %>
<%@ page import="models.Wypozyczenie" %>
<%@ page import="dao.FilmDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.SklepDAO" %><%--
  Created by IntelliJ IDEA.
  User: JoHnY
  Date: 19.12.2017
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>
</head>
<body>
<%
    Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    List<Wypozyczenie> wypozyczenie = (List<Wypozyczenie>) request.getAttribute("wypozyczenie");
    FilmDAO filmDAO = new FilmDAO();
    SklepDAO sklepDAO = new SklepDAO();
%>
<h1>Historia Wypożyczeń:</h1>
<table border="1">
    <tr>
        <th>Nazwa Filmu</th>
        <th>Nazwa Sklepu</th>
        <th>Nazwa Ulicy</th>
        <%if (zalogowany.getRola().equals("pracownik")) {%>
        <th>Id Użytkownika</th>
        <%}%>
        <th>Data Wypożyczenia</th>
        <th>Data Zwrotu</th>
    </tr>
    <%
        for (Wypozyczenie w : wypozyczenie) {
    %>
    <tr>
        <td><%=(filmDAO.getWybranyFilm(w.getIdFilmu()).getTytul())%>
        </td>
        <td><%=(sklepDAO.getSklep(w.getIdSklepu()).getNazwaSklepu())%>
        </td>
        <td><%=(sklepDAO.getSklep(w.getIdSklepu()).getUlica())%>
        </td>
        <%if (zalogowany.getRola().equals("pracownik")) {%>
        <td><%=w.getIdUzytkownika()%>
        </td>
        <%}%>
        <td><%=w.getDataWypozyczenia()%>
        </td>
        <td><%=w.getDataZwrotu()%>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
