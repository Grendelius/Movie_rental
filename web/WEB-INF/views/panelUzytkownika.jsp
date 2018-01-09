<%@ page import="models.Uzytkownik" %>
<%@ page import="dao.UzytkownicyDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>
<%
    Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    if (zalogowany.getRola().equals("pracownik")) {
%>
<form method="post" action="dodajFilm" style="display:inline">
    <input type="submit" value="Dodaj Film"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="edytujSklep" style="display:inline">
    <input type="submit" value="Edytuj Sklep"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="edytujProfil" style="display:inline">
    <input type="submit" value="Edycja profilu"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="historiaWypozyczen" style="display:inline">
    <input type="submit" value="Historia Wypożyczeń"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="aktualneWypozyczenia" style="display:inline">
    <input type="submit" value="Aktualne Wypożyczenia"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="zamowienia" style="display:inline">
    <input type="submit" value="Zamówienia"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>

<%
} else if (zalogowany.getRola().equals("klient")) {
%>
<form method="post" action="edytujProfil" style="display:inline">
    <input type="submit" value="Edycja profilu"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="historiaWypozyczen" style="display:inline">
    <input type="submit" value="Historia Wypożyczeń"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="aktualneWypozyczenia" style="display:inline">
    <input type="submit" value="Aktualne Wypożyczenia"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="zamowienia" style="display:inline">
    <input type="submit" value="Zamówienia"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<%
} else if (zalogowany.getRola().equals("administrator")) {
    UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();
    List<Uzytkownik> uzytkownik = uzytkownicyDAO.getUzytkownicyList();
%>
<h1>Lista Użytkowników:</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Login</th>
        <th>Imię</th>
        <th>Nazwisko</th>
        <th>Numer Telefonu</th>
        <th>Miejsce Zamieszkania</th>
        <th>E-mail</th>
        <th>Rola</th>
        <th>Zablokowany</th>
        <th>Akcja</th>
        <th>Zmień Role</th>
    </tr>
    <%
        for (Uzytkownik u : uzytkownik) {
    %>
    <tr>
        <td><%=u.getIdUzytkownika()%>
        </td>
        <td><%=u.getLogin()%>
        </td>
        <td><%=u.getImie()%>
        </td>
        <td><%=u.getNazwisko()%>
        </td>
        <td><%=u.getNumerTelefonu()%>
        </td>
        <td><%=u.getMiejsceZamieszkania()%>
        </td>
        <td><%=u.getEmail()%>
        </td>
        <td><%=u.getRola()%>
        </td>
        <td><%=u.isZablokowany()%>
        </td>
        <%
            if (u.getIdUzytkownika() != zalogowany.getIdUzytkownika()) {
        %>
        <td>
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
        </td>
        <td>
            <form method="post" action="panelUzytkownika">
                <select name="akcja" size="1">
                    <option value="klient">Klient</option>
                    <option value="pracownik">Pracownik</option>
                    <option value="administrator">Administrator</option>
                </select>
                <input type="hidden" name="idUzytkownika" value="<%=u.getIdUzytkownika()%>"/>
                <input type="submit" value="Zatwierź">
            </form>
        </td>
        <%
            }
        %>
    </tr>
    <%
        }
    %>
</table>
<%
    }
%>
</body>
</html>
