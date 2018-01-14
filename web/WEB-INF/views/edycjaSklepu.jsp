<%@ page import="dao.SklepFilmDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="models.SklepFilm" %>
<%@ page import="dao.FilmDAO" %>
<%@ page import="models.Film" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypozyczalnia</title>
    <%
        String idSklepu = request.getParameter("idSklepu");
        SklepFilmDAO sklepFilmDAO = new SklepFilmDAO();
        FilmDAO filmDAO = new FilmDAO();
        List<Film> filmList = filmDAO.getNajnowszeFilmyList();
        List<SklepFilm> sklepFilmList = sklepFilmDAO.getWybranySklepFilmList(Integer.parseInt(idSklepu));
    %>
</head>
<body>
<div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
    <div style="margin-top:10px">
        <b>
            <center><font size="5" face="serif">Lista filmów w sklepie:</font></center>
        </b>
    </div>
    <table border="1">
        <tr>
            <th>Nazwa Filmu</th>
            <th>Id Filmu</th>
            <th>Ilość Sztuk</th>
            <th>Ilość Dostępnych Sztuk</th>
            <th>Dodaj/Odejmij Ilość Sztuk</th>
        </tr>
        <%
            for (SklepFilm sf : sklepFilmList) {
        %>
        <tr>
            <td><%=filmDAO.getWybranyFilm(sf.getIdFilmu()).getTytul()%>
            </td>
            <td><%=sf.getIdFilmu()%>
            </td>
            <td><%=sf.getIloscFilmow()%>
            </td>
            <td><%=sf.getIloscDostepnychFilmow()%>
            </td>
            <td>
                <form method="post" action="edytujSklep" style="display:inline">
                    <input type="hidden" name="czyEdytujSklep" value="true"/>
                    <input type="hidden" name="idSklepu" value="<%=sf.getIdSklepu()%>"/>
                    <input type="hidden" name="idFilmu" value="<%=sf.getIdFilmu()%>"/>
                    <input type="submit" name="value" value="+"></input>
                    <input type="submit" name="value" value="-"></input>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    &lt;%&ndash;<br><br>
    <form method="post" action="/edytujSklep">
        Dodaj film:
        <br><br><input type="hidden" name="idSklepu" value="<%=idSklepu%>"/>
        <input type="hidden" name="czyEdytujSklep" value="true"/>
        <select name="idFilmu" size="1">
            <%
                boolean flag = false;
                for (Film f : filmList) {
                    for (SklepFilm sf : sklepFilmList) {
                        if (f.getIdFilmu() == sf.getIdFilmu()) {
                            flag = true;
                            break;
                        }
                    }

                    if (!flag) {
            %>
            <option value="<%=f.getIdFilmu()%>"><%=f.getTytul()%>
            </option>
            <%
                    }
                    flag = false;
                }
            %>
        </select>
        <p>Ilość Filmów:</p>
        <input type="text" name="iloscFilmow" maxlength="30"/>
        <br><br><input type="submit" value="Dodaj">&ndash;%&gt;
    </form>
</div>


<%--<table border="1">
    <tr>
        <th>Nazwa Filmu</th>
        <th>Id Filmu</th>
        <th>Ilość Sztuk</th>
        <th>Ilość Dostępnych Sztuk</th>
        <th>Dodaj/Odejmij Ilość Sztuk</th>
    </tr>
    <%
        for (SklepFilm sf : sklepFilmList) {
    %>
    <tr>
        <td><%=filmDAO.getWybranyFilm(sf.getIdFilmu()).getTytul()%>
        </td>
        <td><%=sf.getIdFilmu()%>
        </td>
        <td><%=sf.getIloscFilmow()%>
        </td>
        <td><%=sf.getIloscDostepnychFilmow()%>
        </td>
        <td>
            <form method="post" action="edytujSklep" style="display:inline">
                <input type="hidden" name="idSklepu" value="<%=sf.getIdSklepu()%>"/>
                <input type="hidden" name="idFilmu" value="<%=sf.getIdFilmu()%>"/>
                <input type="submit" name="value" value="+"></input>
                <input type="submit" name="value" value="-"></input>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>
&lt;%&ndash;<br><br>
<form method="post" action="/edytujSklep">
    Dodaj film:
    <br><br><input type="hidden" name="idSklepu" value="<%=idSklepu%>"/>
    <select name="idFilmu" size="1">
        <%
            boolean flag = false;
            for (Film f : filmList) {
                for (SklepFilm sf : sklepFilmList) {
                    if (f.getIdFilmu() == sf.getIdFilmu()) {
                        flag = true;
                        break;
                    }
                }

                if (!flag) {
        %>
        <option value="<%=f.getIdFilmu()%>"><%=f.getTytul()%>
        </option>
        <%
                }
                flag = false;
            }
        %>
    </select>
    <p>Ilość Filmów:</p>
    <input type="text" name="iloscFilmow" maxlength="30"/>
    <br><br><input type="submit" value="Dodaj">&ndash;%&gt;
</form>--%>
</body>
</html>
