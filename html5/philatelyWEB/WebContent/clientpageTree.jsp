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
	<h3>Korisnik: <%=user%> </h3> 
	</header>
	<div id="headerLine">
	</div>


		<article>
			<p>Prve ideje o uvođenju poštanskih marki u promet pripisuju se  Lovrencu Koširu, koji je 1835. godine predložio austrijskom ministarstvu trgovine, kao zamenu sistema naplate poštarine od primaoca pošiljke, naplatu već od pošiljaoca. Time bi se omogućilo širenje pošte, kao i mogućnost slanja pošiljki i drugim ne tako bogatim staležima. Pošiljke bi se frankirale po uzoru na postojeće taksene marke. Predlog je od strane austrijskih službenika odbijen.</p>
			<p></>U isto vrijeme sa istom idejom se bavio i James Chalmers, koji je tri godine kasnije napravio prvi nacrt za poštansku marku. Ovaj predlog je prihvatio Sir Rowland Hill, zadužen za reformu engleske pošte. 1. maja 1840. godine izlazi prva poštanska marka, nazvana one Penny black, koja se pušta u opticaj 6. maja 1840. godine, mada postoji primerak sa datumom 2. maja 1840. godine. Motiv je izabran od 1100 prijedloga, te se na marki nalazi portret kraljice Viktorije na crnoj pozadini i u vrednosti od jednog pennija. Grafičku izradu obradio je Henry Corbald.</p>
			<p>U Evropi uskoro izlaze marke i u drugim državama. U Srbiji je prva poštanska marka izašla 1. jula 1866. godine, na sebi je imala lik kneza Mihajla III Obrenovića i imala je vrednost 10 para.</p>
		</article>

		<nav>
		
		<li><a href="/philatelyWEB/show/showAllMyStamps.jsp">Moje marke</a></li>	
		<li><a href="/philatelyWEB/show/myProfile.jsp">Moj profil</a></li>
		<li><a href="unos.html">Unos</a></li>
		<li><a href="pregled.html">Pregled</a></li>
		<li><a href="azuriranje.html">Azuriranje</a></li>
		
		</nav>
		
		<div id="footerLine">
		</div>
		<footer>	
		Footer
		</footer>	
</body>
</html>