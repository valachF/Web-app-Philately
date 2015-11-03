<!DOCTYPE html>
<html>
<%@page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.naming.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.ejb.*"%>
<%@page import="java.util.*"%>

<%@page import="beans.User"%>
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


<head>
<meta charset=utf-8>
<link href="css5/model5.css" rel="stylesheet" type="text/css" media="screen" />
<title>Klijentska stranica</title>

 <% 
	String user = (String)session.getAttribute("userName");
	String pass = (String)session.getAttribute("userPassword");
	String role = (String)session.getAttribute("role");
	if ((user == null) || (pass == null)|| !role.equalsIgnoreCase("Korisnik")){
		response.sendRedirect("error.html");
	}
%>

</head>
<body>
	<header>
	Header
	</header>
	<div id="headerLine">
	</div>


		<article>
			Dobar dan <%=user%>!!!
		</article>

		<nav>
		<li><a href="/philatelyWEB/insert/InsertUserA.jsp">Unos Admina</a></li>
		<li><a href="/philatelyWEB/insert/insertUserC.jsp">Registracija</a></li>
		<li><a href="/philatelyWEB/insert/insertSeries.jsp">Unos Serije</a></li>
		<li><a href="/philatelyWEB/show/showAllSeries.jsp">Sve serije</a></li>
		<li><a href="/philatelyWEB/show/showALLUsers.jsp">Svi korisnici</a></li>
		<li><a href="/philatelyWEB/insert/insertStamp.jsp">Unos Marke</a></li>
		<li><a href="/philatelyWEB/show/showAllStamps.jsp">Sve marke</a></li>
		<li><a href="/philatelyWEB/update/updateSeriesAll.jsp">Azuriranje serija</a></li>
		<li><a href="/philatelyWEB/show/showAllMyStamps.jsp">Moje marke</a></li>	
		<li><a href="/philatelyWEB/search/searchByStatusInsert.jsp">Pretrazivanje po statusu</a></li>
		<li><a href="/philatelyWEB/show/myProfile.jsp">Moj profil</a></li>
		<li><a href="/philatelyWEB/update/updateUsersAll.jsp">Azuriranje korisnika</a></li>
		<li><a href="/philatelyWEB/show/showAllUsersTable.jsp">Svi korisnici Tabela</a></li>
		<li><a href="/philatelyWEB/show/showAllOwneraIn.jsp">Korisnici koji imaju marku</a></li>
		<li><a href="/philatelyWEB/search/searchStampsByUserSUList.jsp">Svi korisnici i njihove marke</a></li>
		<li><a href="/philatelyWEB/update/updateAllMyStamps.jsp">Azuriranje marke</a></li>	
		</nav>
		<div id="footerLine">
		</div>
		<footer>	
		Footer
		</footer>	
</body>
</html>