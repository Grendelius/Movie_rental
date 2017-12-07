<%@ page import="models.Gatunek" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>
<jsp:include page="naglowek.jsp"></jsp:include> <%--Wklejenie zagłówka na stronę--%>

<h1>Dodaj film:</h1>
${wynik}
${blad}
<form method="post">
    <p>Tytuł:</p>
    <input type="text" name="tytul" maxlength="30" />
    <p>Gatunek 1:</p>
    <input type="text" name="gatunek" maxlength="30" />
    <p>Gatunek 2:</p>
    <input type="text" name="gatunek" maxlength="30" />
    <p>Gatunek 3:</p>
    <input type="text" name="gatunek" maxlength="30" />
    <p>Rok produkcji:</p>
    <input type="text" name="rokProdukcji" maxlength="30" />
    <br><br><input type="submit" value="Zatwierź" />
</form>

</body>
</html>
