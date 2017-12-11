<%@ page import="models.Film" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UzytkownicyDAO" %>
<%@ page import="models.Uzytkownik" %>
<%@ page import="dao.OcenaDAO" %>
<%@ page import="models.Recenzja" %>
<%@ page import="models.Gatunek" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>

<%
    Film film = (Film) request.getAttribute("film");
    out.println(film.getTytul());
    List<Gatunek> gatunek = (List<Gatunek>) request.getAttribute("gatunek");
    for (Gatunek g : gatunek) {
        out.println(g.getNazwa());
    }
    out.println(film.getRokProdukcji() + "<br/><br/>");
    out.println("Średnia ocen : " + film.getSredniaOcena() + "<br/><br/>");
    Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    OcenaDAO ocenaDAO = new OcenaDAO();
    if (zalogowany != null) {
        if (!ocenaDAO.getPoUzytkowniku(zalogowany.getIdUzytkownika(), film.getIdFilmu())) {
%>

<form method="post" action="/ocen">
    Oceń film:
    <input type="hidden" name="id" value="${film.idFilmu}"/>
    <select name="ocena" size="1">
        <%
            for (int i = 0; i <= 10; i++) {
        %>
        <option value="<%=i%>"><%=i%>
        </option>
        <%
            }
        %>
    </select>
    <input type="submit" value="Prześlij">
    <br><br>
</form>
<%
        } else
            out.println("Twoja ocena : " + ocenaDAO.getOcene(zalogowany.getIdUzytkownika(), film.getIdFilmu()).getOcena());
    }
    %>
<br><br>
<form method="post" action="wypozycz" style="display:inline">
    <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
    <input type="submit" value="Wypożycz!"
           style="width:90px;height:30px;background-color:lightgrey;border-color:lightgrey;"></input>
</form>
<%
    if (zalogowany != null) {
%>
<form method="post">
    <input type="hidden" name="id" value="${film.idFilmu}"/>
    <p>Dodaj recenzje:</p>
    <textarea name="tresc" cols="40" rows="8"></textarea><br/>
    <input type="submit" value="OK"/>
</form>
<%
    }
%>

<h1>Recenzje użytkowników:</h1>
<table border="1">
    <tr>
        <th>Użytkownik</th>
        <th width="500">Treść</th>
        <th>Data</th>
    </tr>

    <%
        List<Recenzja> recenzja = (List<Recenzja>) request.getAttribute("recenzja");
        for (Recenzja rec : recenzja) {
            out.println("<tr>");
            UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();
            Uzytkownik u = uzytkownicyDAO.getPoId(rec.getIdUzytkownika());
            out.println("<td>" + u.getLogin() + "</td>");
            out.println("<td>" + rec.getTresc() + "</td>");
            out.println("<td>" + rec.getData() + "</td>");
            out.println("</tr>");
        }
    %>

</table>
</body>
</html>
