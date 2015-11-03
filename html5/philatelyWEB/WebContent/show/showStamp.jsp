<!DOCTYPE html>

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

<title>Show Stamp</title>
</head>
<body>
	<header>
	<h3>Korisnik: <%=user%> </h3> 

	</header>
	<div id="headerLine">
	</div>
	
	<article>

        <% 
        String idstampS=request.getParameterValues("marka")[0];
        System.out.println("vrednost idstampS-a u updateShowStamp: "+idstampS);
    	int idstamp=Integer.parseInt(idstampS);
            //System.out.println("vrednost idstamp-a u showStamp: "+idstamp);
			boolean exist=false;
			Stamp marka=null;
	      //if(opisMarke!=null){
			if(idstamp!=0){
				//marka=sessionPhilately.getStampbyDecs(opisMarke); 
				marka=sessionPhilately.getStamp(idstamp);
				if(marka !=null){
					exist=true;
				}
			}	
		%>
		<table>
		<tr>
			<td align="right">ID marke</td>
			<td><input type="text" name="idStamp"  value="<%=marka.getIdStamp() %>"></td>
		</tr>
		<tr>
			<td>Sve serije:</td>
			<td>
			<select name="serije">
		     <%
     		 String serija=marka.getSeries().getIdSeries();
     		 List <Series> ls=sessionPhilately.getAllSeries();
     		 for (int i=0;i<ls.size();i++){ 
     		 String  seriesId=ls.get(i).getIdSeries() ;  
       
      		 if (serija.equals(seriesId)){
       		 %>         
        	 <option value="<%=seriesId %>"selected="selected" > <%=ls.get(i).getSeriesDescription()%></option>
       		 <%}%>       
        	 <%
        	if (!serija.equals(seriesId)){
         	%>        
         	<option value="<%=seriesId %>"> <%=ls.get(i).getSeriesDescription()%></option>
       	    <%}%>             
            <%}%>

			</select>
			</td>
		</tr>
		<tr>
			<td align="right">kataloski broj marke</td>
			<td><input type="text" name="idCatalog" value="<%=marka.getIdCatalog() %>"></td> 
		</tr>
		<tr>
			<td align="right">Opis marke</td>
			<td><input type="text" name="stampDesription" value="<%=marka.getStampDesription()%>"></td>
		</tr>
		<tr>
			<td align="right">Nominalna vrednost</td>
			<td><input type="text" name="nominalValue" value="<%=marka.getNominalValue()%>"></td>
		</tr>
		<tr>
			<td align="right">Vrednost marke</td>
			<td><input type="text" name="value" value="<%=marka.getValue() %>"></td>
		</tr>
		<tr>
			<td align="right">Zemlja</td>
			<td><input type="text" name="country" value="<%=marka.getCountry() %>"></td>
		</tr>
		<tr>
			<td align="right">Autor marke</td>
			<td><input type="text" name="author" value="<%=marka.getAuthor() %>"></td>
		</tr>
		<tr>
			<td align="right">Boja</td>
			<td><input type="text" name="color" value="<%=marka.getColor() %>"></td>
		</tr>
		<tr>
			<td align="right">Zubcanje</td>
			<td><input type="text" name="perforation" value="<%=marka.getPerforation() %>"></td>
		</tr>
		<tr>
			<td align="right">Godina</td>
			<td><input type="text" name="year" value="<%=marka.getYear() %>"></td>
		</tr>
		<tr>
			<td align="right">Tiraz</td>
			<td><input type="text" name="circulation" value="<%=marka.getCirculation() %>"></td>
		</tr>
		<tr>
			<td align="right">Slika</td> 
			
			<td style="border-style: solid; border-width: 5px; border-color: #93b6cc">
         <% if (marka.getPhoto().length()>0 || marka.getPhoto()!=null){ %>
	     <img width="150" src=<%=request.getContextPath()+"/ImageServlet?idStamp="+marka.getIdStamp()%>></img>
         <% }else{%>
	     <img width="150" src="/philatelyWEB/images/no_image.gif"></img>
         <%} %>
        </td>
	
		</tr>
		<tr>
			<td align="right">Status</td>
			<td><input type="text" name="status" value="<%=marka.getStatus() %>"></td>
		</tr>
	</table>
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