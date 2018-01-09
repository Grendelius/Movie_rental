<%@ page import="java.util.List" %>
<%@ page import="dao.UzytkownicyDAO" %>
<%@ page import="dao.OcenaDAO" %>
<%@ page import="models.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wypożyczalnia</title>
</head>
<body>

    <%
        String zmienOcene = (String) request.getAttribute("zmienOcene");
        String edytuj = (String) request.getAttribute("edytuj");
        String idRec = (String) request.getAttribute("idRec");
        int counter = 0;
        int counter2 = 0;
        Film film = (Film) request.getAttribute("getFilm");
        List<Gatunek> gatunek = (List<Gatunek>) request.getAttribute("gatunek");
        List<GatunekFilm> gatunekFilm = (List<GatunekFilm>) request.getAttribute("gatunekFilm");
        List<Recenzja> recenzja = (List<Recenzja>) request.getAttribute("recenzja");
        UzytkownicyDAO uzytkownicyDAO = new UzytkownicyDAO();

        Uzytkownik zalogowany = (Uzytkownik) request.getSession().getAttribute("uzytkownik");
        OcenaDAO ocenaDAO = new OcenaDAO();

    %>

<div id="center" style="background-color:red;width:490px;float:left; margin-left:5px;margin-right:5px">
    <div style="background-color:darkred;margin-top:37px;height:30px">
        <div style="margin-left:10px;font-size:22px;">
            <%=film.getTytul()%>
            <% if (zalogowany != null && zalogowany.getRola().equals("pracownik")) {
            %>
            <form method="post" action="usunFilm"
                  style="display:inline;position:relative;margin-top:2px;float:right;margin-right:5px">
                <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
                <input type="submit" value="Usuń Film"
                       style="width:80px;height:25px;background-color:lightgrey;border-color:lightgrey;"></input>
            </form>
            <form method="post" action="edytujFilm"
                  style="display:inline;position:relative;margin-top:2px;float:right;margin-right:5px">
                <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
                <input type="submit" value="Edytuj Film"
                       style="width:80px;height:25px;background-color:lightgrey;border-color:lightgrey;"></input>
            </form>
            <%
                }
            %>
        </div>
    </div>
    <div style="margin-top:16px;margin-left:10px;">
        <img style="width:130px;height:170px;" src="<%=film.getOkladka()%>">

        <div style="margin-left:10px;margin-right:430px;position:absolute;display:inline;">
            <td>Reżyser: <%=film.getRezyser()%></td>
            </br>
            <td>Czas trwania: <%=film.getCzasTrwania()%></td>
            </br>
            <td>Rok produkcji: <%=film.getRokProdukcji()%>
            </td>
            </br>
            <td>Średnia Ocena: <%=film.getSredniaOcena()%>
            </td>
            </br>
            <td>Gatunek:
                <% for (Gatunek g : gatunek) {
                    for (GatunekFilm gf : gatunekFilm) {
                        if (g.getIdGatunku() == gf.getIdGatunku())

                            if (counter == gatunekFilm.size() - 1) {
                                out.println(g.getNazwa());
                            } else {
                                out.println(g.getNazwa() + ", ");
                                counter++;
                            }
                    }
                }%>
            </td>
            </br>
            <td><%
                if (zalogowany != null) {
                    if (zmienOcene != null)
                        ocenaDAO.deleteOcene(ocenaDAO.getOcene(zalogowany.getIdUzytkownika(), film.getIdFilmu()));
                    if (!ocenaDAO.getPoUzytkowniku(zalogowany.getIdUzytkownika(), film.getIdFilmu())) {
            %>
                <form method="post" action="/ocena">
                    Oceń film:
                    <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
                    <select name="ocena" size="1">
                        <%
                            for (int i = 0; i <= 10; i++) {
                        %>
                        <option value="<%=i%>"><%=i%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                    <input type="submit" value="Prześlij">
                    </br>
                </form>
                <%
                } else {
                    out.print("Twoja ocena: " + ocenaDAO.getOcene(zalogowany.getIdUzytkownika(), film.getIdFilmu()).getOcena());
                %>
                <form method="post" action="filmInfo" style="display:inline">
                    <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
                    <input type="submit" name="zmienOcene" value="Zmień ocene">
                </form>
                <%
                        }
                    }
                %>
            </td>
            <td>
                <form method="post" action="wypozycz">
                    <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
                    <input type="submit" value="Wypożycz!"
                           style="width:90px;height:30px;background-color:lightgrey;border-color:lightgrey;"></input>
                </form>
            </td>
            </br>
        </div>
    </div>
    <div style="margin:5px;margin-left:10px">
        <td><%=film.getOpis()%>
        </td>
    </div>
    <div style="background-color:darkred;margin-top:5px;height:10px">
    </div>
    <div style="margin-left:10px">
        trolorlololo
    </div>
    <div style="background-color:darkred;margin-top:5px;height:22px">
        <div style="margin-left:10px">
            <b>Recenzje użytkowników:</b>
        </div>
    </div>
    <div style="margin-top:12px;">

        <%
            if (zalogowany != null) {
                counter2++;
        %>
        <div style="margin-left:10px">
            <form method="post" action="/recenzja">
                <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
                <div style="margin-bottom:5px">
                    Dodaj recenzje:
                </div>
                <textarea name="tresc" cols="56" rows="2" style="margin-bottom:5px"></textarea><br/>
                <%
                    String blad = (String) request.getAttribute("blad");
                    if (blad != null) {
                        out.println(blad + "<br>");
                    }
                %>
                <input type="submit" value="OK"/>
            </form>
        </div>
        <%
            }

            for (Recenzja rec : recenzja) {
                Uzytkownik u = uzytkownicyDAO.getUzytkownikPoId(rec.getIdUzytkownika());
                if (edytuj != null && rec.getIdRecenzji() == Integer.parseInt(idRec)) {
        %>
        <div style="margin-left:10px">
            <form method="post" action="/recenzja">
                <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
                <input type="hidden" name="idRecenzji" value="<%=rec.getIdRecenzji()%>"/>
                <div style="margin-bottom:5px">
                    Edytuj recenzje:
                </div>
                <textarea name="trescEdycji" cols="56" rows="2" style="margin-bottom:5px"><%=rec.getTresc()%></textarea><br/>
                <input type="submit" value="OK"/>
            </form>
        </div>
        <%
        } else {
        %>
        <div style="padding-bottom:7px;padding-top:3px;<% if(counter2%2!=0){%>background-color:brown;<%}%>">
            <div style="margin-left:10px;margin-right:10px;float:left;position:relative;display:inline;">
                <%=rec.getTresc()%>
            </div>
            <div style="margin-left:10px;">
                </br><%=u.getLogin()%> | <%=rec.getData()%>
                <%
                    if (zalogowany != null && (zalogowany.getIdUzytkownika() == rec.getIdUzytkownika() || zalogowany.getRola().equals("pracownik"))) {
                %>
                <div style="float:right;margin-right:5px">
                    <form method="post" action="recenzja">
                        <input type="hidden" name="idFilmu" value="<%=film.getIdFilmu()%>"/>
                        <input type="hidden" name="idRecenzji" value="<%=rec.getIdRecenzji()%>"/>
                        <input type="submit" name="edytuj" value="Edytuj"/>
                        <input type="submit" name="usun" value="Usuń"/>
                    </form>
                </div>

                <%
                    }
                %>
            </div>
        </div>
        <%
                    counter2++;
                }
            }
            if (counter2 == 0) {
        %>
        <div style="margin-bottom:10px">
            <center>Na razie nie ma żadnych recenzji, bądź pierwszy który ją doda !</center>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
