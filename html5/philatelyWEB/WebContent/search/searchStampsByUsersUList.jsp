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

<title>Show users</title>
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
		List<User> usersList=sessionPhilately.getAllUsers(); 
		if(usersList!=null){
			exist=true;
		}
		
		if(exist){
	%>
	<form  method="post" action="/philatelyWEB/search/searchStampsByUserSList.jsp">
		<table>
			<tr>
				<td>Svi korisnici:</td>
				<td><select name="korisnici">
					<%for(int i=0;i<usersList.size();i++){
						String korIme=usersList.get(i).getUserName();
					 %>
					<option><%=korIme %></option>
					<%} %>
				</select></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" value=Prikazi></input>
				</td>
			</tr>
		</table>	
	</form>
	<%} else{%>U bazi nema ni jedan korisnik!!!<%}%>
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