<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>
<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Dodawanie filmu:</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        ${blad}
        <form method="post" action="dodajFilm">
            <p>Tytuł:</p>
            <input type="text" name="tytul" maxlength="30"/>
            <p>Gatunek 1:</p>
            <input type="text" name="gatunek" maxlength="30"/>
            <p>Gatunek 2:</p>
            <input type="text" name="gatunek" maxlength="30"/>
            <p>Gatunek 3:</p>
            <input type="text" name="gatunek" maxlength="30"/>
            <p>Opis:</p>
            <textarea name="opis" cols="40" rows="8"></textarea>
            <p>Rok produkcji:</p>
            <input type="text" name="rokProdukcji" maxlength="30"/>
            <p>Okładka:</p>
            <textarea name="okladka" cols="40" rows="8"></textarea>
            <p>Reżyser:</p>
            <input type="text" name="rezyser" maxlength="30"/>
            <p>Czas trwania:</p>
            <input type="text" name="czasTrwania" maxlength="30">
            <br><br><input type="submit" value="Zapisz zmiany"/>
        </form>
    </div>
</div>
</body>
</html>
