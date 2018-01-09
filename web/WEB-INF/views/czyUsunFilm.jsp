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
            <center><font size="4" face="serif">Czy napewno chcesz usunąć film?</font></center>
        </b>
    </div>
    <div style="margin-top:5px;margin-left:10px;">
        <%
            int idFilmu = Integer.parseInt(request.getParameter("idFilmu"));
        %>
        <form method="post" action="usunFilm"
              style="display:inline;position:relative;margin-top:2px;float:right;margin-right:5px">
            <input type="hidden" name="czyUsunFilm" value="true"/>
            <input type="hidden" name="idFilmu" value="<%=idFilmu%>"/>
            <input type="submit" value="TAK"
                   style="width:80px;height:25px;background-color:lightgrey;border-color:lightgrey;"></input>
        </form>
        <form method="post" action="stronaGlowna"
              style="display:inline;position:relative;margin-top:2px;float:right;margin-right:5px">
            <input type="submit" value="NIE"
                   style="width:80px;height:25px;background-color:lightgrey;border-color:lightgrey;"></input>
        </form>
    </div>
</div>
</body>
</html>
