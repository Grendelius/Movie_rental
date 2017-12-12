<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>
    <%
        String czyLogin = (String) request.getAttribute("czyLogin");
        String czyRejestruj = (String) request.getAttribute("czyRejestruj");

    %>
</head>
<body bgcolor="black">
<div id="container" style="background-color:dimgrey;width:900px; margin:auto">

    <jsp:include page="top-menu.jsp"></jsp:include>
    <div style="margin-top:5px">
        <jsp:include page="left-menu.jsp"></jsp:include>
        <%
        if(czyLogin=="true"){
        %>
        <jsp:include page="login.jsp"></jsp:include>
        <%
        }
        else if(czyRejestruj=="true"){
        %>
        <jsp:include page="rejestracja.jsp"></jsp:include>
        <%
        }
        else {
        %>
        <jsp:include page="center.jsp"></jsp:include>
        <%
        }
        %>
        <jsp:include page="right-menu.jsp"></jsp:include>
    </div>
</div>
</body>
</html>
