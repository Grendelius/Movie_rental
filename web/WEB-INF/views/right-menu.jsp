<%@ page import="models.Uzytkownik" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div id="right-menu" style="background-color:red;width:200px;float:left;">
    <div>
        <center><font size="4" face="serif">Szybkie wyszukiwanie:</font></center>
        <br>
        <%
            String inforight = (String) request.getAttribute("inforight");
            if (inforight != null)
                out.println(inforight + "<br><br>");
        %>
        <div style="margin-left:10px">
        <form method="post" action="szukajFilm">
            <input type="text" name="szukanyFilm" maxlength="30"/>
            <br><br><input type="submit" value="Szukaj"/>
        </form>
        </div>
    </div>
</div>
</body>
</html>
