<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>

</head>
<body>
<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Rejestracja:</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        <%
            String blad = (String) request.getAttribute("blad");
            if(blad!=null) {
                out.println(blad);
            }
        %>
        </br>
        <form method="post">
            <p>Login:</p>
            <input type="text" name="login" maxlength="30"/>
            <p>Wprowadź hasło:</p>
            <input type="password" name="haslo" maxlength="20"/>
            <p>Potwierdź hasło:</p>
            <input type="password" name="haslo2" maxlength="20"/>
            <p>Imię:</p>
            <input type="text" name="imie" maxlength="30"/>
            <p>Nazwisko:</p>
            <input type="text" name="nazwisko" maxlength="30"/>
            <p>Numer telefonu:</p>
            <input type="tel" name="numerTelefonu" maxlength="20"/>
            <p>Miejsce Zamieszkania:</p>
            <input type="text" name="miejsceZamieszkania" maxlength="30"/>
            <p>E-mail:</p>
            <input type="email" name="email" maxlength="30"/><br><br>
            <input type="submit" value="Rejestruj"/>
        </form>

    </div>
</div>
</body>
</html>
