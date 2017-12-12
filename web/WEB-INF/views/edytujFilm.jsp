<%@ page import="dao.FilmDAO" %>
<%@ page import="models.Film" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Gatunek" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>

<%
    String idFilmu = request.getParameter("idFilmu");
    String[] gatunek = request.getParameterValues("gatunek");
    FilmDAO filmDAO = new FilmDAO();
    Film film = filmDAO.getWybranyFilm(Integer.parseInt(idFilmu));
%>

<h1>Edytuj film:</h1>
${wynik}
${blad}
<form method="post" action="edytujFilm">
    <p>Tytuł:</p>
    <input type="text" name="tytul"  maxlength="30" value="<%=film.getTytul()%>"/>
    <%

    %>
    <p>Gatunek 1:</p>
    <input type="text" name="gatunek" maxlength="30"/>
    <p>Gatunek 2:</p>
    <input type="text" name="gatunek" maxlength="30"/>
    <p>Gatunek 3:</p>
    <input type="text" name="gatunek" maxlength="30"/>
    <p>Opis:</p>
    <textarea name="opis" cols="40" rows="8"><%=film.getOpis()%></textarea>
    <p>Rok produkcji:</p>
    <input type="text" name="rokProdukcji" maxlength="30" value="<%=film.getRokProdukcji()%>"/>
    <br><br><input type="submit" value="Zatwierź"/>
</form>
</body>

</html>
