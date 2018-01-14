<%@ page import="models.Uzytkownik" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>
    <%
        Uzytkownik u = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    %>
</head>
<body>
<div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
    <div style="margin-top:10px">
        <b>
            <center><font size="5" face="serif">Edycja profilu:</font></center>
        </b>
    </div>
    <div style="margin-left:160px">
    <div style="margin-left:10px">
        <%
            String blad = (String) request.getAttribute("blad");
            String info = (String) request.getAttribute("info");
            if (blad != null) {
                out.println("<br>" + blad);
            }
            if (info != null) {
                out.println("<br>" + info);
            }
        %>
        </br>
    </div>
    <form method="post" action="edytujProfil">
        <div style="float:left;margin-left:10px;">
            <p>Login:</p>
            <input type="text" name="login" maxlength="30" value="<%=u.getLogin()%>"/>
            <br><p>Imię:</p>
            <input type="text" name="imie" maxlength="30" value="<%=u.getImie()%>"/>
            <br><p>Numer telefonu:</p>
            <input type="tel" name="numerTelefonu" maxlength="20" value="<%=u.getNumerTelefonu()%>"/>
            <br><p>Miejsce Zamieszkania:</p>
            <input type="text" name="miejsceZamieszkania" maxlength="30" value="<%=u.getMiejsceZamieszkania()%>"/>
        </div>
        <div style="float:left;margin-left:40px;">
            <p>Hasło:</p>
            <input type="button" value="Zmień hasło" onclick="window.location.href='edycjaHasla'">
            <br><p>Nazwisko:</p>
            <input type="text" name="nazwisko" maxlength="30" value="<%=u.getNazwisko()%>"/>
            <br><p>E-mail:</p>
            <input type="email" name="email" maxlength="30" value="<%=u.getEmail()%>"/><br><br>
            <div style="margin-top:12px">
            <br><input type="submit" value="Zapisz zmiany"/>
            </div>
        </div>
    </form>
    </div>
</div>
</body>
</html>
