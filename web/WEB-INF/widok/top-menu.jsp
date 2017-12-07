<%@ page import="models.Uzytkownik" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
</head>
<body>
    <div id="top-menu" style="background-color:red;height:50px;">
        <a href="stronaGlowna"><img style="width:150px;height:50px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/DVD_logo.svg/1200px-DVD_logo.svg.png" alt="logo"></a>
        <div style="position:absolute;display:inline;margin:5px">
            <button type="button" style="width:120px;height:40px;background-color:red;border-color:red;" >cos</button>
            <button type="button" style="width:120px;height:40px;background-color:red;border-color:red;" >cos</button>
            <button type="button" style="width:120px;height:40px;background-color:red;border-color:red;" >cos</button>
            <button type="button" style="width:120px;height:40px;background-color:red;border-color:red;" >cos</button>
            <%
                Uzytkownik uzytkownik = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
                if (uzytkownik != null) {
                    if (uzytkownik.getRola().equals("klient")){
            %>
            <form action="wyloguj" style="display:inline;">
                <input type="submit" value="Wyloguj" style="width:120px;height:40px;background-color:lightgrey;border-color:lightgrey;"></input>
            </form>
            <%out.println("Klient: " + uzytkownik.getLogin());
            }
            else if (uzytkownik.getRola().equals("pracownik"))
                out.println("Pracownik: " + uzytkownik.getLogin());
            } else {
            %>
            <form action="login" style="display:inline">
                <input type="submit" value="Logowanie" style="width:120px;height:40px;background-color:lightgrey;border-color:lightgrey;"></input>
            </form>
            <form action="rejestruj" style="display:inline">
                <input type="submit" value="Zarejestruj się !" style="width:120px;height:40px;background-color:lightgrey;border-color:lightgrey;"></input>
            </form>
            <%
                }
            %>
        </div>
    </div>
    <img src="http://media.comicbook.com/2017/09/avengers-3-infinity-war-banner-story-spoliers-clues-1022009.jpg" width="900px" height="378px">
</body>