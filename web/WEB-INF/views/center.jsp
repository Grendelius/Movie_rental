<%@ page import="models.Film" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Gatunek" %>
<%@ page import="dao.GatunekFilmDAO" %>
<%@ page import="models.GatunekFilm" %>
<%@ page import="dao.GatunekDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    String wybranyGatunek = request.getParameter("wybranyGatunek");
    List<Film> film = (List<Film>) request.getAttribute("film");
    GatunekFilmDAO gatunekFilmDAO = new GatunekFilmDAO();
    if (wybranyGatunek != null) {
        List<GatunekFilm> gatunekFilm = gatunekFilmDAO.getGatunekFilmPoGatunkuList(Integer.parseInt(wybranyGatunek));
        GatunekDAO gatunekDAO = new GatunekDAO();
        Gatunek gatunek = gatunekDAO.getWybranyGatunekPoId(Integer.parseInt(wybranyGatunek));
%>
<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Nowości/<%=gatunek.getNazwa()%>:</font></center>
        </b>
    </div>
    <%
        for (GatunekFilm gf : gatunekFilm) {
            for (Film f : film) {
                if (f.getIdFilmu() == gf.getIdFilmu()) {
    %>
    <form method="post" action="/filmInfo">
        <div style="background-color:darkred;margin-top:5px">
            <button name="idFilmu" type="submit" value="<%=f.getIdFilmu() %>"
                    style="background-color: transparent; border-color: transparent; font-size : 20px"><%=f.getTytul() %>
            </button>
        </div>
    </form>
    <div style="margin-top:5px;margin-left:10px;">
        <a href=""><img style="width:130px;height:170px;" src="<%=f.getOkladka()%>"></a>
        <div style="margin-left:10px;position:absolute;display:inline">
            <td>Reżyser:</td>
            </br>
            <td>Czas trwania:</td>
            </br>
            <td>Rok produkcji: <%=f.getRokProdukcji()%>
            </td>
            </br>
            <td>Średnia Ocena: <%=f.getSredniaOcena()%>
            </td>
            </br>
            <td>Obejrzyj zwiastuny</td>
            </br></br>

            <form method="post" action="wypozycz" style="display:inline">
                <input type="hidden" name="idFilmu" value="<%=f.getIdFilmu()%>"/>
                <input type="submit" value="Wypożycz!"
                       style="width:90px;height:30px;background-color:lightgrey;border-color:lightgrey;"></input>
            </form>
        </div>
    </div>
    <div style="margin:5px;margin-left:10px">
        <td><%=f.getOpis()%>
        </td>
    </div>
    <%
                }
            }
        }
    %>
</div>
<%
} else { %>
<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Nowości:</font></center>
        </b>
    </div>
    <%
        for (Film f : film) {
    %>
    <form method="post" action="/filmInfo">
        <div style="background-color:darkred;margin-top:5px">
            <button name="idFilmu" type="submit" value="<%=f.getIdFilmu() %>"
                    style="background-color: transparent; border-color: transparent; font-size : 20px"><%=f.getTytul() %>
            </button>
        </div>
    </form>
    <div style="margin-top:5px;margin-left:10px;">
        <a href=""><img style="width:130px;height:170px;" src="<%=f.getOkladka()%>"></a>

        <div style="margin-left:10px;position:absolute;display:inline">
            <td>Reżyser:</td>
            </br>
            <td>Czas trwania:</td>
            </br>
            <td>Rok produkcji: <%=f.getRokProdukcji()%>
            </td>
            </br>
            <td>Średnia Ocena: <%=f.getSredniaOcena()%>
            </td>
            </br>
            <td>Obejrzyj zwiastuny</td>
            </br></br>

            <form method="post" action="wypozycz" style="display:inline">
                <input type="hidden" name="idFilmu" value="<%=f.getIdFilmu()%>"/>
                <input type="submit" value="Wypożycz!"
                       style="width:90px;height:30px;background-color:lightgrey;border-color:lightgrey;"></input>
            </form>
        </div>
    </div>
    <div style="margin:5px;margin-left:10px">
        <td><%=f.getOpis()%>
        </td>
    </div>
    <%
            }
        }
    %>
</div>
</body>
</html>
