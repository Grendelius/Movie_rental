<%@ page import="models.Wypozyczenie" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.FilmDAO" %>
<%@ page import="dao.SklepDAO" %>
<%@ page import="models.Uzytkownik" %>
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
            <center><font size="5" face="serif">Lista Wypożyczeń:</font></center>
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
            <div style="display:inline-block;width:100px;">
                Imię
            </div>
            <div style="display:inline-block;width:130px;">
                Nazwisko
            </div>
            <% } %>
            <div style="display:inline-block;width:172px;">
                Status Wypożyczenia
            </div>
            <%
                if(zalogowany.getRola().equals("pracownik")){
            %>
            <div style="display:inline-block;width:260px;">
                Zmień Status
            </div>
            <%
                } else if(zalogowany.getRola().equals("klient")){
            %>
            <div style="display:inline-block;width:170px;">
                Zmień Status
            </div>
            <%
                }
            %>
            <div style="display:inline-block;width:120px;">
                Data wypożyczenia
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
        <div style="display:inline-block;width:115px">
            <%=(sklepDAO.getSklep(w.getIdSklepu()).getUlica())%>
        </div>
        <%
            }
            if (zalogowany.getRola().equals("pracownik")) {
        %>
        <%--<div style="display:inline-block;width:20px">
            <%=w.getIdUzytkownika()%>
        </div>--%>
        <div style="display:inline-block;width:100px">
            <%=uzytkownicyDAO.getUzytkownikPoId(w.getIdUzytkownika()).getImie()%>
        </div>
        <div style="display:inline-block;width:130px">
            <%=uzytkownicyDAO.getUzytkownikPoId(w.getIdUzytkownika()).getNazwisko()%>
        </div>
        <% } %>
        <div style="display:inline-block;width:170px;">
            <%=w.getStatus()%>
        </div>
        <%
            if (zalogowany.getRola().equals("pracownik")) {
        %>
        <div style="display:inline-block;width:260px;">
            <form method="post" action="aktualneWypozyczenia">
                <div style="display:inline-block">
                    <input type="hidden" name="idWypozyczenia" value="<%=w.getIdWypozyczenia()%>"/>
                    <select name="nowyStatus">
                        <option>Do odbioru w sklepie</option>
                        <option>Wypożyczony</option>
                        <option>Zakończony</option>
                        <option>Anuluj wypożyczenie</option>
                    </select>
                </div>
                <div style="display:inline-block">
                    <input type="submit" value="Zatwierdź">
                </div>
            </form>
        </div>
        <%
        } else if (zalogowany.getRola().equals("klient") && w.getStatus().equals("W trakcie realizacji")) {
        %>
        <div style="display:inline-block;width:175px">
            <form method="post" action="aktualneWypozyczenia">
                <input type="hidden" name="idWypozyczenia" value="<%=w.getIdWypozyczenia()%>"/>
                <input type="submit" name="nowyStatus" value="Anuluj wypożyczenie">
            </form>
        </div>
        <%
            } else {
        %>
        <div style="display:inline-block;width:175px">

        </div>
        <%
            }
        %>
        <div style="display:inline-block;width:120px;margin-right:10px">
            <%=w.getDataWypozyczenia().toString().split(" ")[0]%>
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
