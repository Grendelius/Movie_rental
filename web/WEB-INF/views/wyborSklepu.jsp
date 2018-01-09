<%@ page import="dao.SklepDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Sklep" %>
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
            <center><font size="4" face="serif">Wybór Sklepu:</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        <%
            SklepDAO sklepDAO = new SklepDAO();
            List<Sklep> sklepList = sklepDAO.getSklepList();
            for (Sklep s : sklepList) {
        %>
        <form method="post" action="edytujSklep">
            <input type="hidden" name="czyWyborSklepu" value="true"/>
            <input type="hidden" name="idSklepu" value="<%=s.getIdSklepu()%>"/>
            <input type="submit" value="<%=s.getNazwaSklepu()%> <%=s.getUlica()%>"
                   style="width:180px;height:40px;background-color:red;border-color:#720805;"></input>
        </form>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
