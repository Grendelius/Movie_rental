<%@ page import="models.Uzytkownik" %>
<%@ page import="models.Zamowienie" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.FilmDAO" %>
<%@ page import="dao.SklepDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>
<%
    Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    List<Zamowienie> zamowienie = (List<Zamowienie>) request.getAttribute("zamowienie");
    FilmDAO filmDAO = new FilmDAO();
    SklepDAO sklepDAO = new SklepDAO();
%>
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
for (Zamowienie z: zamowienie) {
%>
<tr>
<td><%=(filmDAO.getWybranyFilm(z.getIdFilmu()).getTytul())%></td>
<td><%=(sklepDAO.getSklep(z.getIdSklepu()).getNazwaSklepu())%></td>
<td><%=(sklepDAO.getSklep(z.getIdSklepu()).getUlica())%></td>
<%if (zalogowany.getRola().equals("pracownik")){%><td><%=z.getIdUzytkownika()%></td><%}%>
<td><%=z.getDataZamowienia()%></td>
<td>
<form method="post" action="zamowienia">
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
