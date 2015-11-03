<!DOCTYPE html>

<%@page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.naming.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.ejb.*"%>
<%@page import="java.util.*"%>

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

<title>Unos serije</title>
</head>
<body>
	<header>
	<h3>Korisnik: <%=user%> </h3> 
	</header>
	<div id="headerLine">
	</div>
	
	<article>
	<form  method="post" action="/philatelyWEB/save/saveSeries.jsp">
<table>
<tr>
<td align="right">IS Serije</td>
<td><input type="text" name="idSeries"></td>
</tr>
<tr>
<td align="right">Opis serije</td>
<td><input type="text" name="seriesDescription"></td>
</tr>
<tr>
<td align="right">Stamparija</td>
<td><input type="text" name="printOffice"></td>
</tr>
</table>
<input type="submit" name="save" value="Sačuvaj">
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