<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia - logowanie</title>
</head>
<body bgcolor="black">
<div id="container" style="background-color:dimgrey;width:900px; margin:auto">
    <jsp:include page="top-menu.jsp"></jsp:include>
    <div style="margin-top:5px">
        <jsp:include page="left-menu.jsp"></jsp:include>

        <jsp:include page="right-menu.jsp"></jsp:include>
    </div>
</div>
    <!--<h1>Zaloguj się</h1>
    ${blad}
    <form method="post">
        <p>Login:</p>
        <input type="text" name="login" maxlength="30"/>
        <p>Hasło:</p>
        <input type="password" name="haslo" maxlength="20"/><br />
        <input type="submit" value="Zaloguj"  />
    </form>-->
</body>
</html>

