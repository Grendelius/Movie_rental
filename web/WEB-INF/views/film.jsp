<%@ page import="java.util.List" %>
<%@ page import="dao.UzytkownicyDAO" %>
<%@ page import="dao.OcenaDAO" %>
<%@ page import="models.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>

<%
    Film film = (Film) request.getAttribute("film");
    List<Gatunek> gatunek = (List<Gatunek>) request.getAttribute("gatunek");
    List<GatunekFilm> gatunekFilm = (List<GatunekFilm>) request.getAttribute("gatunekFilm");
    List<Recenzja> recenzja = (List<Recenzja>) request.getAttribute("recenzja");
    UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();

    out.println(film.getTytul());
    for (Gatunek g : gatunek) {
        for (GatunekFilm gf : gatunekFilm) {
            if (g.getIdGatunku() == gf.getIdGatunku())
                out.println(g.getNazwa());
        }
    }
    out.println(film.getRokProdukcji() + "<br/><br/>");
    out.println("Średnia ocen : " + film.getSredniaOcena() + "<br/><br/>");
    Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    OcenaDAO ocenaDAO = new OcenaDAO();
    if (zalogowany != null) {
        if (!ocenaDAO.getPoUzytkowniku(zalogowany.getIdUzytkownika(), film.getIdFilmu())) {
%>

<form method="post" action="/ocena">
    Oceń film:
    <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
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
<form method="post" action="/recenzja">
    <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
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
        for (Recenzja rec : recenzja) {
            Uzytkownik u = uzytkownicyDAO.getUzytkownikPoId(rec.getIdUzytkownika());
            out.println("<tr>");
            out.println("<td>" + u.getLogin() + "</td>");
            out.println("<td>" + rec.getTresc() + "</td>");
            out.println("<td>" + rec.getData() + "</td>");
            out.println("</tr>");
        }
    %>

</table>


<%
    if (zalogowany != null && zalogowany.getRola().equals("pracownik")) {
%>
<br><br>
<form method="post" action="edytujFilm" style="display:inline">
    <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
    <input type="submit" value="Edytuj Film"
           style="width:90px;height:30px;background-color:lightgrey;border-color:lightgrey;"></input>
</form>
<%
    }
%>


</body>
</html>
