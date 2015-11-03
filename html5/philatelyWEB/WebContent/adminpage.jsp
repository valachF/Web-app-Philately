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
<html>
<head>
<meta charset=utf-8>
<link href="css5/model5.css" rel="stylesheet" type="text/css" media="screen" />

<title>Insert title here</title>
</head>
<body>
	<header>
	Header
	</header>
	<div id="headerLine">
	</div>


		<article>
			sadrzaj
		</article>
		<nav>
		<li><a href="/philatelyWEB/insert/InsertUserA.jsp">Unos Admina</a></li>
		<li><a href="/philatelyWEB/insert/insertUserC.jsp">Registracija</a></li>
		<li><a href="/philatelyWEB/insert/insertSeries.jsp">Unos Serije</a></li>
		<li><a href="/philatelyWEB/show/showAllSeries.jsp">Sve serije</a></li>
		<li><a href="/philatelyWEB/show/showALLUsers.jsp">Svi korisnici</a></li>
		<li><a href="/philatelyWEB/insert/insertStamp.jsp">Unos Marke</a></li>
		<li><a href="/philatelyWEB/show/showAllStamps.jsp">Sve marke</a></li>
		</nav>
	
</body>
</html>