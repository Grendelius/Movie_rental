<%@ page import="models.Film" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="margin-bottom:10px;margin-top:5px">
        <b>
            <center><font size="4" face="serif">Nowości:</font></center>
        </b>
    </div>
    <%
        List<Film> film = (List<Film>) request.getAttribute("nowe");
        for (Film f : film) {
    %>
    <div style="background-color:darkred;margin-top:5px">
        <a href="" style="text-decoration:none;color:black">
            <b style="margin-left:10px;">
                <%
                    out.println(f.getTytul());
                %>
            </b></a>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        <a href=""><img style="width:130px;height:170px;" src="<% out.println(f.getOkladka()); %>"></a>

        <div style="margin-left:10px;position:absolute;display:inline">
            <%
                out.println("Reżyser: ");
            %>
            </br>
            <%
                out.println("Czas trwania: ");
            %>
            </br>
            <%
                out.println("Rok produkcji: " + f.getRokProdukcji());
            %>
            </br>
            <%
                out.println("Średnia Ocena: " + f.getSredniaOcena());
            %>
            </br>
            <%
                out.println("Obejrzyj zwiastuny ");
            %>
            </br>
            </br>
            <form method="post" action="wypozycz" style="display:inline">
                <input type="hidden" name="idFilmu" value="<%=f.getIdFilmu()%>"/>
                <input type="submit" value="Wypożycz!"
                       style="width:90px;height:30px;background-color:lightgrey;border-color:lightgrey;"></input>
            </form>
        </div>
    </div>
    <div style="margin:5px;margin-left:10px">
        <%
            out.println(f.getOpis());
        %>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
