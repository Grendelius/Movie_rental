<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
</head>
<body>
    <div id="left-menu" style="background-color:red;width:200px;float:left;">
        <form method="post" action="/gatunek">
            <div>
                <center><font size="4" face="serif">Kategorie filmów:</font></center>
            </div>
            <c:forEach var="gatunekdistinct" items="${gatunekdistinct}">
                <div style="margin-left:10px">
                    <a href="${gatunekdistinct}" style="text-decoration:none;color:black">${gatunekdistinct}</a></br>
                </div>
            </c:forEach>
        </form>
    </div>
</body>
</html>
