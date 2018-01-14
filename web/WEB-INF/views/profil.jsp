<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Uzytkownik" %>
<html>
<head>
    <title>Wypożyczalnia</title>
    <%
        Uzytkownik u = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
    %>
</head>
<body>
    <div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
        <div style="margin-top:10px">
            <b>
                <center><font size="5" face="serif">Dane użytkownika:</font></center>
            </b>
        </div>
        <div style="float:left;margin-left:10px;margin-top:100px">
            <font size="4">Imię: <%=u.getImie()%>
            <br>Login: <%=u.getLogin()%>
            <br>Numer Telefonu: <%=u.getNumerTelefonu()%>
            <div style="margin-left:30px;margin-top: 5px;">
                <br><input type="button" value="Edytuj profil" onclick="window.location.href='edytujProfil'" style="width:120px;height:30px;">
            </div>
        </div>
        <div style="float:left;margin-left:40px;margin-top:100px">
            Nazwisko: <%=u.getNazwisko()%>
            <br>Miejsce Zamieszkania: <%=u.getMiejsceZamieszkania()%>
            <br>E-mail: <%=u.getEmail()%>
        </div>
    </div>
</body>
</html>
