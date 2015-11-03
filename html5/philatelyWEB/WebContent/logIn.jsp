<%@page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.naming.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.ejb.*"%>
<%@page import="java.util.*"%>

<%@page import="beans.User"%>
<%@page import="philatelyejb.PhilatelySessionLocal"%>
<html>
<head>
<title>Log in</title>
</head>
<body>

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
	String userName = request.getParameter("userName");
	String userPassword = request.getParameter("userPassword");
	
	String adminpage = "/philatelyWEB/adminpage.jsp";
	String clientpage  = "/philatelyWEB/clientpageTree.jsp";
	String badpage  = "/philatelyWEB/error.html";

	
//	User u=sessionPhilately.getUserbyUname(userName);
	
	User u = sessionPhilately.loginIn(userName,userPassword);
	
	if (u!=null) {
		

		
		session.setAttribute( "userName", userName );
		session.setAttribute( "userPassword", userPassword );
		session.setAttribute( "role", u.getRole());	
		
		session.setMaxInactiveInterval(3600);
		
		
		if (u.getRole().equalsIgnoreCase("Administrator")){
		   response.sendRedirect(adminpage);
		}else if (u.getRole().equalsIgnoreCase("Korisnik")){
			   response.sendRedirect(clientpage);
		}else{
			response.sendRedirect(badpage);
		}
	}
	
%>

</body>
</html>

