<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>
</head>
<body>
<div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
    <div style="margin-top:10px">
        <b>
            <center><font size="5" face="serif">Edycja hasła:</font></center>
        </b>
    </div>

    <div style="margin-top:5px;margin-left:120px;">
        <%
            String blad = (String) request.getAttribute("blad");
            if (blad != null) {
                out.println(blad);
            }
        %>
        </br>
        <div style="margin-left:160px">
            <form method="post" action="edycjaHasla">
                <p>Aktualne hasło:</p>
                <input type="password" name="stareHaslo" maxlength="30"/>
                <p>Nowe hasło:</p>
                <input type="password" name="haslo1" maxlength="30"/>
                <p>Powtórz hasło:</p>
                <input type="password" name="haslo2" maxlength="30"/><br><br>
                <input type="submit" value="Zapisz zmiany"/>
            </form>
        </div>
    </div>
</div>
<%--<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Zmiana Hasła:</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        <%
            String blad = (String) request.getAttribute("blad");
            if (blad != null) {
                out.println(blad);
            }
        %>
        </br>
        <form method="post" action="edycjaHasla">
            <p>Aktualne hasło:</p>
            <input type="password" name="stareHaslo" maxlength="30"/>
            <p>Nowe hasło:</p>
            <input type="password" name="haslo1" maxlength="30"/>
            <p>Powtórz hasło:</p>
            <input type="password" name="haslo2" maxlength="30"/><br><br>
            <input type="submit" value="Zapisz zmiany"/>
        </form>

    </div>
</div>--%>
</body>
</html>
