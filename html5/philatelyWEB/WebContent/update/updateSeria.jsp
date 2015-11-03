<!DOCTYPE html>
<%@page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.naming.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.ejb.*"%>
<%@page import="java.util.*"%>
<%@page import="beans.Series"%>
<%@page import="philatelyejb.PhilatelySessionLocal"%>

<%!
	private PhilatelySessionLocal sessionPhilately= null;

	public void jspInit() {
	try {
		InitialContext ict = new InitialContext();
		sessionPhilately= (PhilatelySessionLocal) ict.lookup("philatelyEAR/PhilatelySession/local");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}%>
	
	<% 
	String user = (String)session.getAttribute("userName");
	String pass = (String)session.getAttribute("userPassword");
	String role = (String)session.getAttribute("role");
	if ((user == null) || (pass == null)|| !role.equalsIgnoreCase("Korisnik")){
		response.sendRedirect("error.html");
	}
%>

<html>
<head>
<meta charset=utf-8>
<link href="../css5/model5.css" rel="stylesheet" type="text/css" media="screen" />

<title>Update Seria</title>
</head>
<body>
	<header>
	<h3>Korisnik: <%=user%> </h3> 

	</header>
	<div id="headerLine">
	</div>


		<article>
		<% 
			//String opisSerije=request.getParameterValues("serije")[0];
		    //String idSeries= (String)session.getAttribute( "idSeries"); 
		    String idSeries=request.getParameterValues("serije")[0];
			boolean exist=false;
			Series serija=null;
			if(idSeries!=null){
				serija=sessionPhilately.getSeries(idSeries); 
				if(serija !=null){
					exist=true;
				}
			}	
		%>
		<form  method="post" action="/philatelyWEB/save/saveSeries.jsp">
		<table>
			<tr>
				<td>ID serije</td>
				<td><input name="idSeries" type="text" value="<%=serija.getIdSeries() %>" ></td>
			</tr>
			<tr>
				<td>Opis serije</td>
				<td><input name="seriesDescription" type="text" value="<%=serija.getSeriesDescription() %>" ></td>
			</tr>
			<tr>
				<td>Stamparija</td>
				<td><input name="printOffice" type="text" value="<%=serija.getPrintOffice() %>" ></td>
			</tr>
			<tr>
				<td><input type="submit" name="save" value="Sačuvaj"></td>
				<td><input type="submit" name="delete" value="Obriši"></td>
			</tr>
		</table>
		</form>
		</article>
				<nav>
		<li><a href="/philatelyWEB/show/showAllMyStamps.jsp">Moje marke</a></li>	
		<li><a href="/philatelyWEB/show/myProfile.jsp">Moj profil</a></li>
		<li><a href="../unos.html">Unos</a></li>
		<li><a href="../pregled.html">Pregled</a></li>
		<li><a href="../azuriranje.html">Azuriranje</a></li>
		</nav>
		<div id="footerLine">
		</div>
		<footer>	
		Footer
		</footer>	
</body>
</html>