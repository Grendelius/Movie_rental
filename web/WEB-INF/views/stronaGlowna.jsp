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
        String czyFilm = (String) request.getAttribute("czyFilm");
        String czyEdytujProfil = (String) request.getAttribute("czyEdytujProfil");
        String czyEdytujHaslo = (String) request.getAttribute("czyEdytujHaslo");
        String czyEdytujFilm = (String) request.getAttribute("czyEdytujFilm");
        String czyDodajFilm = (String) request.getAttribute("czyDodajFilm");
        String czyWypozyczenie = (String) request.getAttribute("czyWypozyczenie");
        String czyUsunFilm = (String) request.getAttribute("czyUsunFilm");
        String czyWyborSklepu = (String) request.getAttribute("czyWyborSklepu");
    %>
</head>
<body bgcolor="black">
<div id="container" style="background-color:dimgrey;width:900px; margin:auto">

    <jsp:include page="top-menu.jsp"></jsp:include>
    <div style="margin-top:5px">
        <jsp:include page="left-menu.jsp"></jsp:include>
        <%
            if (czyLogin == "true") {
        %>
        <jsp:include page="login.jsp"></jsp:include>
        <%
        } else if (czyRejestruj == "true") {
        %>
        <jsp:include page="rejestracja.jsp"></jsp:include>
        <%
        } else if (czyEdytujProfil == "true") {
        %>
        <jsp:include page="edycjaProfilu.jsp"></jsp:include>
        <%
        } else if (czyEdytujHaslo == "true") {
        %>
        <jsp:include page="edycjaHasla.jsp"></jsp:include>
        <%
        } else if (czyFilm == "true") {
        %>
        <jsp:include page="film.jsp"></jsp:include>
        <%
        } else if (czyDodajFilm == "true") {
        %>
        <jsp:include page="dodajFilm.jsp"></jsp:include>
        <%
        } else if (czyEdytujFilm == "true") {
        %>
        <jsp:include page="edytujFilm.jsp"></jsp:include>
        <%
        } else if (czyUsunFilm == "true") {
        %>
        <jsp:include page="czyUsunFilm.jsp"></jsp:include>
        <%
        } else if (czyWypozyczenie == "true") {
        %>
        <jsp:include page="wypozyczenie.jsp"></jsp:include>
        <%
        } else if (czyWyborSklepu == "true") {
        %>
        <jsp:include page="wyborSklepu.jsp"></jsp:include>
        <%
        } else {
        %>
        <jsp:include page="center.jsp"></jsp:include>
        <%
            }
        %>
        <jsp:include page="right-menu.jsp"></jsp:include>
    </div>

</div>
</body>
<footer>
    <div style="width:600px;height: 200px">
    <jsp:include page="stopka.jsp"></jsp:include>
    </div>
</footer>
</html>
