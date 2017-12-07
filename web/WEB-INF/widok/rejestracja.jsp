<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>
</head>
<body>
<jsp:include page="naglowek.jsp"></jsp:include>         <%--Wklejenie zagłówka na stronę--%>

    <h1>Rejestracja</h1>
    ${blad}
    <form method="post">
        <p>Login:</p>
        <input type="text" name="login" maxlength="30" />
        <p>Wprowadź hasło:</p>
        <input type="password" name="haslo" maxlength="20" />
        <p>Potwierdź hasło:</p>
        <input type="password" name="haslo2" maxlength="20" />
        <p>Imię:</p>
        <input type="text" name="imie" maxlength="30" />
        <p>Nazwisko:</p>
        <input type="text" name="nazwisko" maxlength="30" />
        <p>Numer telefonu:</p>
        <input type="tel" name="numerTelefonu" maxlength="20" />
        <p>Miejsce Zamieszkania:</p>
        <input type="text" name="miejsceZamieszkania" maxlength="30" />
        <p>E-mail:</p>
        <input type="email" name="email" maxlength="30" /><br><br>
        <input type="submit" value="Rejestruj" />
    </form>
</body>
</html>
