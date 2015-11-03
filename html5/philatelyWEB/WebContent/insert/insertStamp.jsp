<!DOCTYPE HTML>

<%@page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.naming.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.ejb.*"%>
<%@page import="java.util.*"%>
<%@page import="beans.Stamp"%>
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

<title>Stamp insert</title>
</head>
<body>
	<header>
	<h3>Korisnik: <%=user%> </h3> 
	</header>
	<div id="headerLine">
	</div>
	
	<article>
	<form  method="post" action="/philatelyWEB/save/saveStamp.jsp" enctype="multipart/form-data">
	<table>
		<tr>
			<td align="right">ID marke</td>
			<td><input type="text" name="idStamp"></td>
		</tr>
		<tr>
			<td>Sve serije:</td>
			<td><select name="serije">
				<%
				List<Series> seriesList=sessionPhilately.getAllSeries();
				for(int i=0;i<seriesList.size();i++){
					String opisSerije=seriesList.get(i).getSeriesDescription();
					String brojSerije=seriesList.get(i).getIdSeries();
				 %>
				<option value="<%=brojSerije%>"><%=opisSerije %></option>
					<%} %>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right">kataloski broj marke</td>
			<td><input type="text" name="idCatalog"></td>
		</tr>
		<tr>
			<td align="right">Opis marke</td>
			<td><input type="text" name="stampDesription"></td>
		</tr>
		<tr>
			<td align="right">Nominalna vrednost</td>
			<td><input type="text" name="nominalValue"></td>
		</tr>
		<tr>
			<td align="right">Vrednost marke</td>
			<td><input type="text" name="value"></td>
		</tr>
		<tr>
			<td align="right">Zemlja</td>
			<td><input type="text" name="country"></td>
		</tr>
		<tr>
			<td align="right">Autor marke</td>
			<td><input type="text" name="author"></td>
		</tr>
		<tr>
			<td align="right">Boja</td>
			<td><input type="text" name="color"></td>
		</tr>
		<tr>
			<td align="right">Zubcanje</td>
			<td><input type="text" name=perforation></td>
		</tr>
		<tr>
			<td align="right">Godina</td>
			<td><input type="text" name="year"></td>
		</tr>
		<tr>
			<td align="right">Tiraz</td>
			<td><input type="text" name="circulation"></td>
		</tr>
		<tr>
			<td align="right">Slika</td>
			<td><input type="file" name="photo"></td>
		</tr>
		<tr>
			<td align="right">Status</td>
			<td><input type="text" name="status"></td>
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