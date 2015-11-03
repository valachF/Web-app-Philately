<!DOCTYPE html>

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
	

   

<html>
<head>
<meta charset=utf-8>
<link href="../css5/model5.css" rel="stylesheet" type="text/css" media="screen" />

<title>Snimi Administratora</title>
</head>
<body>
	<header>
	
	</header>
	<div id="headerLine">
	</div>
	
	<article>
<%
String uname=request.getParameter("userName");
String pass=request.getParameter("UserPassword");
String name=request.getParameter("name");
String surname=request.getParameter("surname");
String email=request.getParameter("email");
boolean isSave=sessionPhilately.addUserAdmin(uname, pass, name, surname, email);
if(isSave)
{
	%>
	<h3>Uspešno ste sačuvali korisnika.</h3>
	<%
	    }else{
	%>
	<h3>Došlo je do greške pri snimanju u bazu.</h3>
	<%
	}

%>
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