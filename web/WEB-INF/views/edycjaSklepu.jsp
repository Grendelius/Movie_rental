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

        boolean temp = false;
        boolean temp2 = false;

        for (Film f : filmList) {
            temp=false;
            for (SklepFilm sf : sklepFilmList) {
                if (f.getIdFilmu() == sf.getIdFilmu()) {
                    temp = true;
                }

            }

            if(temp!=true){
                temp2 = true;
            }
        }

    %>
</head>
<body>
<div style="background-color:red;width:700px;height:465px;float:left; margin-left:5px;">
    <div style="margin-top:10px">
        <b>
            <center><font size="5" face="serif">Lista filmów w sklepie:</font></center>
        </b>
    </div>
    <div style="margin-left:10px">
    <%
        String blad = (String) request.getAttribute("blad");
        if (blad != null) {
            out.println(blad);
        }
    %>
    </div>
    <form method="post" action="/edytujSklep" style="margin-top:15px">
        <% if(temp2==true){ %>
        <div style="display:inline-block;margin-left:10px;margin-right:10px">
            Dodaj film:
        </div>
        <div style="display:inline-block;width:150px;margin-right:20px">
            <input type="hidden" name="idSklepu" value="<%=idSklepu%>"/>
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
        </div>
        <div style="display:inline-block;margin-right:10px">
             Ilość Filmów:
        </div>
        <div style="display:inline-block">
            <input type="text" name="iloscFilmow" maxlength="30"/>
        </div>
        <div style="display:inline-block">
            <input type="submit" value="Dodaj">
        </div>
        <%
            } else {
                //out.println("Wszystkie filmy dodane do sklepu.");
            }
        %>
    </form>
    <div style="height:365px;overflow-y:auto;margin-right:6px;margin-left:6px;white-space:nowrap;">
        <div style="margin-top:10px;margin-bottom:10px">
            <div style="display:inline-block;width:200px;">
                Nazwa Filmu
            </div>
            <div style="display:inline-block;width:60px;">
                Id Filmu
            </div>
            <div style="display:inline-block;width:80px;">
                Ilość Sztuk
            </div>
            <div style="display:inline-block;width:160px;">
                Ilość Dostępnych Sztuk
            </div>
            <div style="display:inline-block;">
                Dodaj/Odejmij Ilość Sztuk
            </div>
        </div>
        <%
            for (SklepFilm sf : sklepFilmList) {
        %>
        <div style="display:inline-block;width:222px;">
            <%=filmDAO.getWybranyFilm(sf.getIdFilmu()).getTytul()%>
        </div>
        <div style="display:inline-block;width:70px">
            <%=sf.getIdFilmu()%>
        </div>
        <div style="display:inline-block;width:115px">
            <%=sf.getIloscFilmow()%>
        </div>
        <div style="display:inline-block;width:150px">
            <%=sf.getIloscDostepnychFilmow()%>
        </div>
        <div style="display:inline-block;">
            <form method="post" action="edytujSklep" style="display:inline">
                <input type="hidden" name="idSklepu" value="<%=sf.getIdSklepu()%>"/>
                <input type="hidden" name="idFilmu" value="<%=sf.getIdFilmu()%>"/>
                <input type="submit" name="value" value="+"></input>
                <input type="submit" name="value" value="-"></input>
            </form>
        </div>
        </br>
        <%
            }
        %>
        <div style="margin-top:10px">
        </div>
    </div>
</div>
</body>
</html>
