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

<title>My Profile</title>
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
	        User korisnik=sessionPhilately.loginIn(user,pass); 
				if(korisnik !=null){
					exist=true;
				}
				
		%>
		<form action="/philatelyWEB/save/saveUserC.jsp" method="post">
		<table>
			<tr>
				<td>ID korisnika</td>
				<td><input name="idUser" hidden="hidden" contenteditable="false" type="text" value="<%=korisnik.getIdUser() %>" ></td>
			</tr>
			<tr>
				<td>Korisnicko ime</td>
				<td><input name="userName" type="text" contenteditable="false" value="<%=korisnik.getUserName() %>" ></td>
			</tr>
			<tr>
				<td>Sifra</td>
				<td><input name="UserPassword" type="text" value="<%=korisnik.getUserPassword() %>" ></td>
			</tr>
			<tr>
				<td>Ime</td>
				<td><input name="name" type="text" value="<%=korisnik.getName() %>" ></td>
			</tr>
			<tr>
				<td>Prezime</td>
				<td><input name="surname" type="text" value="<%=korisnik.getSurname() %>" ></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input name="email" type="text" value="<%=korisnik.getEmail() %>" ></td>
			</tr>
			<tr>
				<td>Role</td>
				<td><input name="role" type="text" contenteditable="false" value="<%=korisnik.getRole() %>" ></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="save" value="Sačuvaj"></td>
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