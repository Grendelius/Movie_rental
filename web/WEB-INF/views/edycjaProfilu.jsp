<%@ page import="models.Uzytkownik" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>
</head>
<body>
<%
    Uzytkownik u = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
%>
<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Edycja profilu:</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        <%
            String blad = (String) request.getAttribute("blad");
            String info = (String) request.getAttribute("info");
            if (blad != null) {
                out.println(blad);
            }
            if (info != null) {
                out.println(info);
            }
        %>
        </br>
        <form method="post" action="edytujProfil">
            <p>Login:</p>
            <input type="text" name="login" maxlength="30" value="<%=u.getLogin()%>"/>
            <p>Hasło:</p>
            <a href="edycjaHasla">zmień hasło</a>
            <p>Imię:</p>
            <input type="text" name="imie" maxlength="30" value="<%=u.getImie()%>"/>
            <p>Nazwisko:</p>
            <input type="text" name="nazwisko" maxlength="30" value="<%=u.getNazwisko()%>"/>
            <p>Numer telefonu:</p>
            <input type="tel" name="numerTelefonu" maxlength="20" value="<%=u.getNumerTelefonu()%>"/>
            <p>Miejsce Zamieszkania:</p>
            <input type="text" name="miejsceZamieszkania" maxlength="30" value="<%=u.getMiejsceZamieszkania()%>"/>
            <p>E-mail:</p>
            <input type="email" name="email" maxlength="30" value="<%=u.getEmail()%>"/><br><br>
            <input type="submit" value="Zapisz zmiany"/>
        </form>

    </div>
</div>
</body>
</html>
