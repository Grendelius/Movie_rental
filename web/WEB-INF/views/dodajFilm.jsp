<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>
<div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
    <div style="margin-top:10px">
        <b>
            <center><font size="5" face="serif">Dodawanie filmu:</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        ${blad}
        <form method="post" action="dodajFilm">
            <div style="float:left;margin-left:10px;">
                <p>Opis:</p>
                <textarea name="opis" cols="40" rows="7"></textarea>
                <p>Okładka:</p>
                <textarea name="okladka" cols="40" rows="7"></textarea>
            </div>
            <div style="float:left;margin-left:10px;">
                <p>Tytuł:</p>
                <input type="text" name="tytul" maxlength="30"/>
                <p>Gatunek 1:</p>
                <input type="text" name="gatunek" maxlength="30"/>
                <p>Gatunek 2:</p>
                <input type="text" name="gatunek" maxlength="30"/>
                <p>Gatunek 3:</p>
                <input type="text" name="gatunek" maxlength="30"/>
            </div>
            <div style="float:left;margin-left:10px;">
                <p>Rok produkcji:</p>
                <input type="text" name="rokProdukcji" maxlength="30"/>
                <p>Reżyser:</p>
                <input type="text" name="rezyser" maxlength="30"/>
                <p>Czas trwania:</p>
                <input type="text" name="czasTrwania" maxlength="30">
                <div style="margin-top:13px;margin-left:25px">
                    <br><br><input type="submit" value="Zapisz zmiany"/>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
