<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia - logowanie</title>

    <%
        String blad = (String) request.getAttribute("blad");
    %>

</head>
<body>
<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Logowanie:</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        <%
            if(blad!=null) {
                out.println(blad);
            }
        %>
        <form method="post">
            <p>Login:</p>
            <input type="text" name="login" maxlength="30"/>
            <p>Hasło:</p>
            <input type="password" name="haslo" maxlength="20"/><br/><br/>
            <input type="submit" value="Zaloguj"/>
        </form>

    </div>
</div>
</body>
</html>

