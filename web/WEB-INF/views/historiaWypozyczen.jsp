<%@ page import="models.Uzytkownik" %>
<%@ page import="models.Wypozyczenie" %>
<%@ page import="dao.FilmDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.SklepDAO" %>
<%@ page import="dao.UzytkownicyDAO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>
    <%
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();
        List<Wypozyczenie> wypozyczenie = (List<Wypozyczenie>) request.getAttribute("wypozyczenie");
        FilmDAO filmDAO = new FilmDAO();
        SklepDAO sklepDAO = new SklepDAO();
    %>
</head>
<body>

<div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
    <div style="margin-top:10px">
        <b>
            <center><font size="5" face="serif">Historia wypożyczeń:</font></center>
        </b>
    </div>
    <div style="height:420px;overflow-y:auto;overflow-x:auto;margin-right:6px;margin-left:6px;white-space:nowrap;">
        <div style="margin-top:10px;margin-bottom:10px">
            <div style="display:inline-block;width:205px;">
                Nazwa Filmu
            </div>
            <%if (zalogowany.getRola().equals("klient")) {%>
            <div style="display:inline-block;width:105px;">
                Nazwa Sklepu
            </div>
            <div style="display:inline-block;width:113px;">
                Nazwa Ulicy
            </div>
            <%
                }
            %>
            <%if (zalogowany.getRola().equals("pracownik")) {%>
            <%--<div style="display:inline-block;width:23px;">
                Id
            </div>--%>
            <div style="display:inline-block;width:90px;">
                Imię
            </div>
            <div style="display:inline-block;width:100px;">
                Nazwisko
            </div>
            <% } %>
            <div style="display:inline-block;width:155px;">
                Data wypożyczenia
            </div>
            <div style="display:inline-block;margin-right:20px;">
                Data zwrotu
            </div>
        </div>
        <%
            for (Wypozyczenie w : wypozyczenie) {
                if ((zalogowany.getRola().equals("klient")) || (zalogowany.getRola().equals("pracownik") && zalogowany.getIdSklepu() == w.getIdSklepu())) {
        %>
        <div style="display:inline-block;width:210px;">
            <%=(filmDAO.getWybranyFilm(w.getIdFilmu()).getTytul())%>
        </div>
        <%if (zalogowany.getRola().equals("klient")) {%>
        <div style="display:inline-block;width:100px">
            <%=(sklepDAO.getSklep(w.getIdSklepu()).getNazwaSklepu())%>
        </div>
        <div style="display:inline-block;width:125px">
            <%=(sklepDAO.getSklep(w.getIdSklepu()).getUlica())%>
        </div>
        <%
            }
            if (zalogowany.getRola().equals("pracownik")) {
        %>
        <%--<div style="display:inline-block;width:20px">
            <%=w.getIdUzytkownika()%>
        </div>--%>
        <div style="display:inline-block;width:90px;">
            <%=uzytkownicyDAO.getUzytkownikPoId(w.getIdUzytkownika()).getImie()%>
        </div>
        <div style="display:inline-block;width:110px;">
            <%=uzytkownicyDAO.getUzytkownikPoId(w.getIdUzytkownika()).getNazwisko()%>
        </div>
        <%}%>
        <div style="display:inline-block;width:145px">
            <%=w.getDataWypozyczenia().toString().split(" ")[0]%>
        </div>
        <div style="display:inline-block;margin-right:20px;">
            <%=w.getDataZwrotu().toString().split(" ")[0]%>
        </div>
        </br>
        <div>

        </div></br>
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
