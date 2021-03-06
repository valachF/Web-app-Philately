<!DOCTYPE HTML>
<%@page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.naming.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.ejb.*"%>
<%@page import="java.util.*"%>
<%@page import="beans.Stamp"%>
<%@page import="beans.Series"%>
<%@page import="beans.User"%>
<%@page import="philatelyejb.PhilatelySessionLocal"%>

<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.io.output.*"%>   
<%@page import="java.io.*"%>
<%@page import="java.sql.Blob;"%>


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
<script src="../aplikacijaDodatak/JS/philately.js"></script>
<title>Snimanje marke</title>
</head>
<body>
	<header>
	<h3>Korisnik: <%=user%> </h3> 
	</header>
	<div id="headerLine">
	</div>
	
	<article>
	

<%
	User korisnik=sessionPhilately.loginIn(user,pass);
	boolean ok=false;

	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List items = upload.parseRequest(request);
	Iterator iter = items.iterator();
	byte[] data=null;
	Stamp m=new Stamp();
	
	int id=0;
	String idSerija=null;
	
	while (iter.hasNext()) {
	    FileItem item = (FileItem) iter.next();
	    if (item.isFormField()) {
	    	if (item.getFieldName().equalsIgnoreCase("idCatalog")){
	    		id=(Integer.parseInt(new String(item.get())));
	    		m.setIdCatalog(Integer.valueOf(new String(item.get())));
	    	}else if (item.getFieldName().equalsIgnoreCase("stampDesription")){	    		
	    		m.setStampDesription(new String(item.get())); 
	   	    }else if (item.getFieldName().equalsIgnoreCase("serije")){
	   	    	idSerija=new String(item.get());
	   	    	System.out.println("ID serije GORE je:= "+ idSerija);
	    	//	m.setSeries(new Series(item.get()));
	    	}else if (item.getFieldName().equalsIgnoreCase("nominalValue")){
	    		m.setNominalValue(Double.parseDouble(new String(item.get())));
	    	}else if (item.getFieldName().equalsIgnoreCase("author")){
	    		m.setAuthor(new String(item.get()));
	    	}else if (item.getFieldName().equalsIgnoreCase("value")){
	    		m.setValue(Double.parseDouble(new String(item.get())));
	    	}else if (item.getFieldName().equalsIgnoreCase("color")){
	    		m.setColor(new String(item.get()));
	    	}else if (item.getFieldName().equalsIgnoreCase("perforation")){
	    		m.setPerforation(new String (item.get()));
	    	}else if (item.getFieldName().equalsIgnoreCase("country")){
	    		m.setCountry(new String(item.get()));
	    	}else if (item.getFieldName().equalsIgnoreCase("circulation")){
	        	m.setCirculation(Integer.valueOf(new String(item.get())));
	    	}else if (item.getFieldName().equalsIgnoreCase("status")){
	            m.setStatus(new String(item.get()));
	    	}else if (item.getFieldName().equalsIgnoreCase("year")){
	    		m.setYear(Integer.parseInt(new String(item.get())));
	    	}else{
	    		continue;
	    	}
	    } else {
	    	Blob blob = new javax.sql.rowset.serial.SerialBlob(item.get());
	    	m.setPhoto(blob);
	    }
	}
	
 	System.out.println("ID serije je:= "+ idSerija);
	int brojMarke = sessionPhilately.addStamp2(m.getIdCatalog(), m.getStampDesription(),m.getNominalValue(),m.getValue(),m.getCountry(),
			m.getAuthor(),m.getColor(),m.getPerforation(),m.getYear(),m.getCirculation(),m.getPhoto(),m.getStatus(),idSerija);
	 if(brojMarke>0){
		ok=sessionPhilately.addUserStamp(brojMarke,korisnik.getIdUser());
	 } else{%>
	   <h3>Doslo je do greske prilikom snimanja marke u bazu! <h3> 
		<%}
	

	
	 if (ok) { %>
	 <br> <h2>Marka je uspesno sacuvana! <h2>
	<%} else {%>
	   <h2>Doslo je do greske prilikom snimanja marke u bazu! <h2> 
	<%}

		


%>

		<script>

			var db;

			var imeB="philately";
			var verzija=1.0;
			var opisBaze="Filatelija_baza";
			var velicina=3 * 1024 * 1024;

			function napraviBazu(){	
	
				if(window.openDatabase){
						db = openDatabase(imeB, verzija, opisBaze, velicina);
				
						
						napraviTabele(db);
						var idCatalog="<%=m.getIdCatalog()%>";
						var stampDcs="<%=m.getStampDesription()%>";
						var nomV="<%=m.getNominalValue()%>";
						var val="<%=m.getValue()%>";
						var country="<%=m.getCountry()%>";
						var author="<%=m.getAuthor()%>";
						var color="<%=m.getColor()%>";
						var perforation="<%=m.getPerforation()%>";
						var year="<%=m.getYear()%>";
						var circulation="<%=m.getCirculation()%>";
						var photo="<%=m.getPhoto()%>";
						var status="<%=m.getStatus()%>";
						
						
						unosPodataka(db, idCatalog, stampDcs, nomV, val, country,
								author ,color, perforation, year, circulation , photo, status);
		
				}
				else{
						alert("Vas pregledavac ne podrzava WebSQL!!!");
				}
			}  
			
			window.onload = function (){
	            napraviBazu();
	        };


		</script>

		
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