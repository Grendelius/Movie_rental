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
<h1>Wybór Sklepu:</h1>
<%
    SklepDAO sklepDAO = new SklepDAO();
    List<Sklep> sklepList = sklepDAO.getSklepList();
    for (Sklep s: sklepList) {
%>
<form method="post" action="edytujSklep" style="display:inline">
    <input type="hidden" name="idSklepu" value="<%=s.getIdSklepu()%>"/>
    <input type="submit" value="<%=s.getNazwaSklepu()%> <%=s.getUlica()%>"
           style="width:160px;height:40px;background-color:red;border-color:red;"></input>
</form>

<%
    }
%>
</body>
</html>
