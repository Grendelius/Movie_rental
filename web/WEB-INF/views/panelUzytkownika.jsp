<%@ page import="models.Uzytkownik" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UzytkownicyDAO" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
    <%
        String czyEdytujProfil = (String) request.getAttribute("czyEdytujProfil");
        String czyHistoriaWypozyczen = (String) request.getAttribute("czyHistoriaWypozyczen");
        String czyAktualneWypozyczenia = (String) request.getAttribute("czyAktualneWypozyczenia");
        String czyZamowienia = (String) request.getAttribute("czyZamowienia");
        String czyEdytujHaslo = (String) request.getAttribute("czyEdytujHaslo");
        String czyDodajFilm = (String) request.getAttribute("czyDodajFilm");
        String czyEdytujSklep = (String) request.getAttribute("czyEdytujSklep");
        String czyListaUzytkownikow = (String) request.getAttribute("czyListaUzytkownikow");
        String czyWyborSklepu = (String) request.getAttribute("czyWyborSklepu");
        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");

    %>
</head>
<body bgcolor="black">
<div style="width:900px;height:470px; margin-top:5%; margin-left:auto;margin-right:auto;">
    <div style="background-color:red;width:170px;height:465px;float:left;">
        <%
            if(zalogowany.getRola().equals("klient")) {
        %>
        <div style="margin-left:10px">
            <div style="display:flex;justify-content: center;flex-direction: column;padding-top: 20px;">
                <input type="button" value="Profil" onclick="window.location.href='panelUzytkownika'" style="width:150px;height:50px;margin-bottom:15px">
                <form method="post" action="historiaWypozyczen">
                    <input type="submit" value="Historia wypożyczeń" style="width:150px;height:50px;">
                </form>
                <form method="post" action="aktualneWypozyczenia" style="display:inline">
                    <input type="submit" value="Aktualne wypożyczenia" style="width:150px;height:50px;">
                </form>
                <form method="post" action="zamowienia" style="display:inline">
                    <input type="submit" value="Zamówienia" style="width:150px;height:50px;">
                </form>
                <input type="button" value="Strona główna" onclick="window.location.href='stronaGlowna'" style="width:150px;height:50px;margin-top:115px">
            </div>
        </div>

        <%
            } else if (zalogowany.getRola().equals("pracownik")) {
        %>
        <div style="margin-left:10px">
            <div style="display:flex;justify-content: center;flex-direction: column;padding-top: 10px;">
                <input type="button" value="Profil" onclick="window.location.href='panelUzytkownika'" style="width:150px;height:50px;margin-bottom:15px">
                <form method="post" action="dodajFilm">
                    <input type="submit" value="Dodaj Film" style="width:150px;height:50px;">
                </form>
                <form method="post" action="wybierzSklep">
                    <input type="submit" value="Edytuj Sklep" style="width:150px;height:50px;">
                </form>
                <form method="post" action="historiaWypozyczen">
                    <input type="submit" value="Historia wypożyczeń" style="width:150px;height:50px;">
                </form>
                <form method="post" action="aktualneWypozyczenia" style="display:inline">
                    <input type="submit" value="Aktualne wypożyczenia" style="width:150px;height:50px;">
                </form>
                <form method="post" action="zamowienia" style="display:inline">
                    <input type="submit" value="Zamówienia" style="width:150px;height:50px;">
                </form>

                <input type="button" value="Strona główna" onclick="window.location.href='stronaGlowna'" style="width:150px;height:50px;">
            </div>
        </div>
        <%
            } else if (zalogowany.getRola().equals("administrator")) {
        %>
        <div style="margin-left:10px">
            <div style="display:flex;justify-content: center;flex-direction: column;padding-top: 20px;">
                <input type="button" value="Profil" onclick="window.location.href='panelUzytkownika'" style="width:150px;height:50px;margin-bottom:15px">
                <form method="post" action="listaUzytkownikow" style="display:inline">
                    <input type="submit" value="Lista Użytkowników" style="width:150px;height:50px;">
                </form>
                <input type="button" value="Strona główna" onclick="window.location.href='stronaGlowna'" style="width:150px;height:50px;margin-top:250px">
            </div>
        </div>
        <%
            }
        %>
    </div>
    <%
        if(czyEdytujProfil == "true"){
    %>
        <jsp:include page="edycjaProfilu.jsp"></jsp:include>
    <%
        }else if(czyHistoriaWypozyczen == "true"){
    %>
        <jsp:include page="historiaWypozyczen.jsp"></jsp:include>
    <%
        }else if(czyAktualneWypozyczenia == "true"){
    %>
        <jsp:include page="aktualneWypozyczenia.jsp"></jsp:include>
    <%
        }else if(czyZamowienia == "true"){
    %>
        <jsp:include page="zamowienia.jsp"></jsp:include>
    <%
        }else if(czyEdytujHaslo == "true"){
    %>
        <jsp:include page="edycjaHasla.jsp"></jsp:include>
    <%
        }else if(czyDodajFilm == "true"){
    %>
        <jsp:include page="dodajFilm.jsp"></jsp:include>
    <%
        }else if(czyWyborSklepu == "true"){
    %>
        <jsp:include page="wyborSklepu.jsp"></jsp:include>
    <%
        }else if(czyEdytujSklep == "true"){
    %>
         <jsp:include page="edycjaSklepu.jsp"></jsp:include>
    <%
        }else if(czyListaUzytkownikow == "true"){
    %>
        <jsp:include page="listaUzytkownikow.jsp"></jsp:include>
    <%
        }else{
    %>
        <jsp:include page="profil.jsp"></jsp:include>
    <%
        }
    %>
</div>
</body>
</html>
