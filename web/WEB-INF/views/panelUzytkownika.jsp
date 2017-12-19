<%@ page import="models.Uzytkownik" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>
<%
    Uzytkownik uzytkownik = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    if (uzytkownik.getRola().equals("pracownik")) {
%>
<form method="post" action="dodajFilm" style="display:inline">
    <input type="submit" value="Dodaj Film"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>
<form method="post" action="edycjaProfilu" style="display:inline">
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
    } else if (uzytkownik.getRola().equals("klient")) {
%>
<form method="post" action="edycjaProfilu" style="display:inline">
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
    } else if (uzytkownik.getRola().equals("administrator")) {

    }
%>
</body>
</html>
