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
    <%
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        List<Zamowienie> zamowienie = (List<Zamowienie>) request.getAttribute("zamowienie");
        FilmDAO filmDAO = new FilmDAO();
        SklepDAO sklepDAO = new SklepDAO();
    %>
</head>
<body>
<div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
    <div style="margin-top:10px">
        <b>
            <center><font size="5" face="serif">Zamówienia:</font></center>
        </b>
    </div>
    <div style="height:420px;overflow-y:auto;overflow-x:auto;margin-right:6px;margin-left:6px;white-space:nowrap;">
        <div style="margin-top:10px;margin-bottom:10px">
            <div style="display:inline-block;width:195px;">
                Nazwa Filmu
            </div>
            <div style="display:inline-block;width:105px;">
                Nazwa Sklepu
            </div>
            <div style="display:inline-block;width:113px;">
                Nazwa Ulicy
            </div>
            <%if (zalogowany.getRola().equals("pracownik")) {%>
            <div style="display:inline-block;width:20px;">
                Id
            </div>
            <% } %>
            <div style="display:inline-block;width:155px;">
                Data zamówienia
            </div>
            <div style="display:inline-block;margin-right:10px;">
                Anulowanie zamówienia
            </div>
        </div>
        <%
            for (Zamowienie z: zamowienie) {
        %>
        <div style="display:inline-block;width:210px;">
            <%=(filmDAO.getWybranyFilm(z.getIdFilmu()).getTytul())%>
        </div>
        <div style="display:inline-block;width:90px">
            <%=(sklepDAO.getSklep(z.getIdSklepu()).getNazwaSklepu())%>
        </div>
        <div style="display:inline-block;width:115px">
            <%=(sklepDAO.getSklep(z.getIdSklepu()).getUlica())%>
        </div>
        <%if (zalogowany.getRola().equals("pracownik")) {%>
        <div style="display:inline-block;width:20px">
            <%=z.getIdUzytkownika()%>
        </div>
        <%}%>
        <div style="display:inline-block;width:155px">
            <%=z.getDataZamowienia()%>
        </div>
        <div style="display:inline-block;margin-right:10px;margin-left:15px">
            <form method="post" action="zamowienia">
                <input type="hidden" name="idZamowienia" value="<%=z.getIdZamowienia()%>"/>
                <input type="submit" name="nowyStatus" value="Anuluj zamówienie">
            </form>
        </div>
        </br>
        <%
            }
        %>
        <div style="margin-top:10px">

        </div>
    </div>
</div>
</body>
</html>
