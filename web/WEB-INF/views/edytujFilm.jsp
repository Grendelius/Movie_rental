<%@ page import="models.Film" %>
<%@ page import="models.GatunekFilm" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Gatunek" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>
<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Edycja filmu:</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        ${wynik}
        ${blad}
        <%
            Film film = (Film) request.getAttribute("filmm");
            List<GatunekFilm> gatunekFilm = (List<GatunekFilm>) request.getAttribute("gatunekFilm");
            List<Gatunek> gatunek = (List<Gatunek>) request.getAttribute("gatunek");
        %>
        <form method="post" action="edytujFilm">
            <p>Tytuł:</p>
            <input type="text" name="tytul" maxlength="30" value="<%=film.getTytul()%>"/>
            <%
                int counter = 1;
                for (GatunekFilm gf : gatunekFilm) {
                    for (Gatunek g : gatunek) {
                        if (gf.getIdGatunku() == g.getIdGatunku()) {
            %>
            <p>Gatunek <%=counter++%>:</p>
            <input type="text" name="gatunek" maxlength="30" value="<%=g.getNazwa()%>"/>
            <%
                        }
                    }
                }
            %>
            <p>Gatunek <%=counter%>:</p>
            <input type="text" name="gatunek" maxlength="30"/>
            <p>Opis:</p>
            <textarea name="opis" cols="40" rows="8"><%=film.getOpis()%></textarea>
            <p>Rok produkcji:</p>
            <input type="text" name="rokProdukcji" maxlength="30" value="<%=film.getRokProdukcji()%>"/>
            <p>Okładka:</p>
            <textarea name="okladka" cols="40" rows="8"><%=film.getOkladka()%></textarea>
            <p>Reżyser:</p>
            <input type="text" name="rezyser" maxlength="30" value="<%=film.getRezyser()%>"/>
            <p>Czas trwania:</p>
            <input type="text" name="czasTrwania" maxlength="30" value="<%=film.getCzasTrwania()%>">
            <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
            <br><br><input type="submit" value="Zatwierdź"/>
        </form>
    </div>
</div>
</body>
</html>
