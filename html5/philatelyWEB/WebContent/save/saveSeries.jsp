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

<title>Snimanje serije</title>
</head>
<body>
	<header>
	<h3>Korisnik: <%=user%> </h3> 
	</header>
	<div id="headerLine">
	</div>
	
	<article>
	
<%	
	boolean exist=false;
	String idSeries=request.getParameter("idSeries");
	Series seria=sessionPhilately.getSeries(idSeries);
	if(seria!=null){
		exist=true;
	}
	if(request.getParameter("delete")!=null){ 	
	boolean ok=sessionPhilately.deleteSeries(idSeries);
		if(ok){
			 %>
				<h2>Serija je uspesno obrisana!!!</h2>
			<%
		}else{
			%>
				<h2>Došlo je do greške pri brisanju oglasa iz baze.</h2>
			<%
		}
	}else{
		if(exist==false){ //unosimo novu seriju
			String id=request.getParameter("idSeries");
			String seriesDesc=request.getParameter("seriesDescription");
			String printOff=request.getParameter("printOffice");

			boolean isSave=sessionPhilately.addSeries(id,seriesDesc,printOff);
			if(isSave)
			{
			%>
			<h3>Uspešno ste sačuvali seriju.</h3>
			<%
			}else{
			%>
			<h3>Došlo je do greške pri snimanju u bazu.</h3>
			<%
			}
		}else{  //apdejtujemo postojecu seriju
			String id=request.getParameter("idSeries");
			String seriesDesc=request.getParameter("seriesDescription");
			String printOff=request.getParameter("printOffice");

			boolean isSave=sessionPhilately.updateSeries(id,seriesDesc,printOff);
			if(isSave)
			{
			%>
			<h3>Uspešno ste sačuvali seriju.</h3>
			<%
			}else{
			%>
			<h3>Došlo je do greške pri snimanju u bazu.</h3>
			<%
			}
		}
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