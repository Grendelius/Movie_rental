<%@ page import="models.Uzytkownik" %>
<%@ page import="models.Zamowienie" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.FilmDAO" %>
<%@ page import="dao.SklepDAO" %>
<%@ page import="dao.UzytkownicyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
    <%
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        List<Zamowienie> zamowienie = (List<Zamowienie>) request.getAttribute("zamowienie");
        UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();
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
            <div style="display:inline-block;width:210px;">
                Nazwa Filmu
            </div>
            <%if (zalogowany.getRola().equals("klient")) {%>
            <div style="display:inline-block;width:105px;">
                Nazwa Sklepu
            </div>
            <div style="display:inline-block;width:123px;">
                Nazwa Ulicy
            </div>
            <%
                }
            %>
            <%if (zalogowany.getRola().equals("pracownik")) {%>
            <%--<div style="display:inline-block;width:20px;">
                Id
            </div>--%>
            <div style="display:inline-block;width:80px;">
                Imię
            </div>
            <div style="display:inline-block;width:110px;">
                Nazwisko
            </div>
            <% } %>
            <div style="display:inline-block;width:180px;">
                Anulowanie zamówienia
            </div>
            <div style="display:inline-block;margin-right:10px;">
                Data zamówienia
            </div>
        </div>
        <%
            for (Zamowienie z : zamowienie) {
                if ((zalogowany.getRola().equals("klient")) || (zalogowany.getRola().equals("pracownik") && zalogowany.getIdSklepu() == z.getIdSklepu())) {
        %>
        <div style="display:inline-block;width:210px;">
            <%=(filmDAO.getWybranyFilm(z.getIdFilmu()).getTytul())%>
        </div>
        <%if (zalogowany.getRola().equals("klient")) {%>
        <div style="display:inline-block;width:105px">
            <%=(sklepDAO.getSklep(z.getIdSklepu()).getNazwaSklepu())%>
        </div>
        <div style="display:inline-block;width:125px">
            <%=(sklepDAO.getSklep(z.getIdSklepu()).getUlica())%>
        </div>
        <%
            }
            if (zalogowany.getRola().equals("pracownik")) {
        %>
        <%--<div style="display:inline-block;width:20px">
            <%=z.getIdUzytkownika()%>
        </div>--%>
        <div style="display:inline-block;width:80px">
            <%=uzytkownicyDAO.getUzytkownikPoId(z.getIdUzytkownika()).getImie()%>
        </div>
        <div style="display:inline-block;width:110px">
            <%=uzytkownicyDAO.getUzytkownikPoId(z.getIdUzytkownika()).getNazwisko()%>
        </div>
        <%}%>

        <div style="display:inline-block;width:180px;margin-left:10px">
            <form method="post" action="zamowienia">
                <input type="hidden" name="idZamowienia" value="<%=z.getIdZamowienia()%>"/>
                <input type="submit" name="nowyStatus" value="Anuluj zamówienie">
            </form>
        </div>
        <div style="display:inline-block;margin-right:10px;">
            <%=z.getDataZamowienia().toString().split(" ")[0]%>
        </div>
        </br>
        <%
                }
            }
        %>
        <div style="margin-top:10px">

        </div>
    </div>
</div>
</body>
</html>
