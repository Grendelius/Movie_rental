<%--
  Created by IntelliJ IDEA.
  User: JoHnY
  Date: 23.12.2017
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>
<%
    int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
%>
<H1>Czy napewno chcesz usunąć film?</H1>
<form method="post" action="usunFilm"
      style="display:inline;position:relative;margin-top:2px;float:right;margin-right:5px">
    <input type="hidden" name="idFilmu" value="<%=idFilmu%>"/>
    <input type="submit" value="TAK"
           style="width:80px;height:25px;background-color:lightgrey;border-color:lightgrey;"></input>
</form>
<form method="post" action="stronaGlowna"
      style="display:inline;position:relative;margin-top:2px;float:right;margin-right:5px">
    <input type="submit" value="NIE"
           style="width:80px;height:25px;background-color:lightgrey;border-color:lightgrey;"></input>
</form>
</body>
</html>
