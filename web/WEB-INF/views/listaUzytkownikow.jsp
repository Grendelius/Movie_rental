<%@ page import="dao.UzytkownicyDAO" %>
<%@ page import="models.Uzytkownik" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wypożyczalnia</title>
    <%
        UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();
        List<Uzytkownik> uzytkownik = uzytkownicyDAO.getUzytkownicyList();
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    %>
</head>
<body>

<div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
    <div style="margin-top:10px">
        <b>
            <center><font size="5" face="serif">Lista użytkowników:</font></center>
        </b>
    </div>
    <div style="height:420px;overflow-y:auto;overflow-x:auto;margin-right:6px;margin-left:6px;white-space:nowrap;">
        <div style="margin-top:10px;margin-bottom:10px">
            <div style="display:inline-block;width:195px;">
                Id
            </div>
            <div style="display:inline-block;width:105px;">
                Login
            </div>
            <div style="display:inline-block;width:113px;">
                Imię
            </div>
            <div style="display:inline-block;width:113px;">
                Nazwisko
            </div>
            <div style="display:inline-block;width:20px;">
                Numer Telefonu
            </div>
            <div style="display:inline-block;width:155px;">
                Miejsce Zamieszkania
            </div>
            <div style="display:inline-block">
                E-mail
            </div>
            <div style="display:inline-block;width:155px;">
                Rola
            </div>
            <div style="display:inline-block;width:155px;">
                Zablokowany
            </div>
            <div style="display:inline-block;width:155px;">
                Akcja
            </div>
            <div style="display:inline-block;width:155px;">
                Zmień Role
            </div>
        </div>
        <%
            for (Uzytkownik u : uzytkownik) {
        %>
        <div style="display:inline-block;width:210px;">
            <%=u.getIdUzytkownika()%>
        </div>
        <div style="display:inline-block;width:90px">
            <%=u.getLogin()%>
        </div>
        <div style="display:inline-block;width:115px">
            <%=u.getImie()%>
        </div>
        <div style="display:inline-block;width:20px">
            <%=u.getNazwisko()%>
        </div>
        <div style="display:inline-block;width:155px">
            <%=u.getNumerTelefonu()%>
        </div>
        <div style="display:inline-block;margin-right:10px">
            <%=u.getMiejsceZamieszkania()%>
        </div>
        <div style="display:inline-block;width:155px">
            <%=u.getEmail()%>
        </div>
        <div style="display:inline-block;width:155px">
            <%=u.getRola()%>
        </div>
        <div style="display:inline-block;width:155px">
            <%=u.isZablokowany()%>
        </div>
        <%
            if (u.getIdUzytkownika() != zalogowany.getIdUzytkownika()) {
        %>
        <div style="display:inline-block;width:155px">
            <%
                if (u.isZablokowany()) {
            %>
            <form method="post" action="panelUzytkownika">
                <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                <input type="submit" name="akcja" value="Odblokuj konto">
            </form>
            <%
            } else {
            %>
            <form method="post" action="panelUzytkownika">
                <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                <input type="submit" name="akcja" value="Zablokuj konto">
            </form>
            <%
                }
            %>
            <form method="post" action="panelUzytkownika">
                <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                <input type="submit" name="akcja" value="Usuń konto">
            </form>
        </div>
        <div style="display:inline-block;width:155px">
            <form method="post" action="panelUzytkownika">
                <select name="akcja" size="1">
                    <option value="klient">Klient</option>
                    <option value="pracownik">Pracownik</option>
                    <option value="administrator">Administrator</option>
                </select>
                <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                <input type="submit" value="Zatwierź">
            </form>
        </div>
        <%
            }
        %>
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
