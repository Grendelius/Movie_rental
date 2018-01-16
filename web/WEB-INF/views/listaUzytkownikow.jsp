<%@ page import="dao.UzytkownicyDAO" %>
<%@ page import="models.Uzytkownik" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Sklep" %>
<%@ page import="dao.SklepDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wypożyczalnia</title>
    <%
        UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();
        List<Uzytkownik> uzytkownik = uzytkownicyDAO.getUzytkownicyList();
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        SklepDAO sklepDAO = new SklepDAO();
        List<Sklep> sklepList = sklepDAO.getSklepList();
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
            <div style="display:inline-block;width:20px;">
                Id
            </div>
            <div style="display:inline-block;width:90px;">
                Login
            </div>
            <div style="display:inline-block;width:113px;">
                Imię
            </div>
            <div style="display:inline-block;width:130px;">
                Nazwisko
            </div>
            <div style="display:inline-block;width:110px;">
                Numer Telefonu
            </div>
            <div style="display:inline-block;width:180px;">
                Miejsce Zamieszkania
            </div>
            <div style="display:inline-block;width:180px;">
                E-mail
            </div>
            <div style="display:inline-block;width:100px;">
                Rola
            </div>
            <div style="display:inline-block;width:150px;">
                Nazwa Sklepu
            </div>
            <div style="display:inline-block;width:130px;">
                Zablokowany
            </div>
            <div style="display:inline-block;width:205px;">
                Akcja
            </div>
            <div style="display:inline-block;">
                Zmień Role
            </div>
            <div style="display:inline-block;">
                Zmień Sklep
            </div>
        </div>
        <%
            for (Uzytkownik u : uzytkownik) {
        %>
        <div style="display:inline-block;width:20px;">
            <%=u.getIdUzytkownika()%>
        </div>
        <div style="display:inline-block;width:90px">
            <%=u.getLogin()%>
        </div>
        <div style="display:inline-block;width:115px">
            <%=u.getImie()%>
        </div>
        <div style="display:inline-block;width:130px">
            <%=u.getNazwisko()%>
        </div>
        <div style="display:inline-block;width:110px">
            <%=u.getNumerTelefonu()%>
        </div>
        <div style="display:inline-block;width:180px">
            <%=u.getMiejsceZamieszkania()%>
        </div>
        <div style="display:inline-block;width:180px">
            <%=u.getEmail()%>
        </div>
        <div style="display:inline-block;width:125px">
            <%=u.getRola()%>
        </div>
        <div style="display:inline-block;width:125px">
            <%
                if (u.getIdSklepu() != 0) {
            %>
            <%=sklepDAO.getSklep(u.getIdSklepu()).getNazwaSklepu()%>
            <%
                }
            %>
        </div>
        <div style="display:inline-block;width:100px">
            <% if (u.isZablokowany() == false) { %>
            Nie
            <% } else { %>
            Tak
            <% } %>
        </div>
        <%
            if (u.getIdUzytkownika() != zalogowany.getIdUzytkownika()) {
        %>
        <div style="display:inline-block;width:210px">
            <%
                if (u.isZablokowany()) {
            %>
            <div style="display:inline-block">
                <form method="post" action="listaUzytkownikow">
                    <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                    <input type="submit" name="akcja" value="Odblokuj konto">
                </form>
            </div>
            <%
            } else {
            %>
            <div style="display:inline-block">
                <form method="post" action="listaUzytkownikow">
                    <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                    <input type="submit" name="akcja" value="Zablokuj konto">
                </form>
            </div>
            <%
                }
            %>
            <div style="display:inline-block">
                <form method="post" action="listaUzytkownikow">
                    <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                    <input type="submit" name="akcja" value="Usuń konto">
                </form>
            </div>
        </div>
        <div style="display:inline-block;margin-right:10px">
            <form method="post" action="listaUzytkownikow">
                <select name="akcja" size="1">
                    <option value="klient">Klient</option>
                    <option value="pracownik">Pracownik</option>
                    <option value="administrator">Administrator</option>
                </select>
                <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                <input type="submit" value="Zatwierdź">
            </form>
        </div>
        <div style="display:inline-block;width:150px">
            <%
                if (u.getRola().equals("pracownik")) {
            %>
            <form method="post" action="listaUzytkownikow">
                <select name="akcja" size="1">
                    <%
                        for (Sklep s : sklepList) {
                    %>
                    <option value=<%=s.getIdSklepu()%>><%=s.getNazwaSklepu()%>
                    </option>
                    <%
                        }
                    %>
                </select>
                <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                <input type="submit" value="Zatwierdź">
            </form>
            <%
                }
            %>
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
