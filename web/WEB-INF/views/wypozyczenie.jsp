<%@ page import="models.SklepFilm" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Sklep" %>
<%@ page import="dao.SklepDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wypozyczalnia</title>
</head>
<body>
<%
    List<SklepFilm> sklepFilmList = (List<SklepFilm>) request.getAttribute("sklepFilmList");
    SklepDAO sklepDAO = new SklepDAO();
    Sklep sklep;
    out.println("Wybierz sklep: ");
    for (SklepFilm s : sklepFilmList) {
        sklep = sklepDAO.getSklep(s.getIdSklepu());
        out.println("<br>" + sklep.getNazwaSklepu());
        out.println(sklep.getUlica());
        if (s.getIloscDostepnychFilmow() > 0) {
            out.println("<br>Ilość dostępnych sztuk: " + s.getIloscDostepnychFilmow());
%>
<form method="post" action="wypozycz" style="display:inline">
    <input type="hidden" name="idSklepu" value="<%=s.getIdSklepu()%>"/>
    <input type="hidden" name="idFilmu" value="<%=s.getIdFilmu()%>"/>
    <input type="submit" value="Wypożycz!"
           style="width:90px;height:30px;background-color:lightgrey;border-color:lightgrey;"></input>
</form>
<%
        } else {
            out.println("<br>Wszystkie sztuki wypożyczone");
        %>
<form method="post" action="zamow" style="display:inline">
    <input type="hidden" name="idSklepu" value="<%=s.getIdSklepu()%>"/>
    <input type="hidden" name="idFilmu" value="<%=s.getIdFilmu()%>"/>
    <input type="submit" value="Zamów!"
           style="width:90px;height:30px;background-color:lightgrey;border-color:lightgrey;"></input>
</form>
<%
        }
    }
%>
</body>
</html>
