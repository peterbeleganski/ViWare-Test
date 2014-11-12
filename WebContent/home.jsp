<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>


<title>Курсове</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>

<body>


<header>
	
		<nav id="nav">
			<ul>
				<li><a href="home.jsp" class="selected">Начало</a></li>
				<li><a href="/ViWare-Test/Controller?action=news">Новини</a></li>
				<li><a href="about.html">За нас</a></li>
				<li id="sign_up"><a href="about.html"></a>
	
				<li>Здравей,<a href="#"><%="  "+request.getAttribute("email")%></a></li>

				<li><a href="/ViWare-Test/Controller?action=logout">[Изход]</a></li>
			</ul>
				
				

			
		</nav>
</header>

<div class="headerWrapper">
	<div class="header">
		<img src="${pageContext.request.contextPath}/images/logo.png" />
		<span id="title" ></span>
	</div>
</div>

<div class="content">


<sql:setDataSource var="ds" dataSource="jdbc/webshop" />

<sql:query dataSource="${ds}" sql="select * from images order by average_ranking desc limit 10" var="results" />

<div id="wrapper">

<!-- -
<div id="wrapper-settings">
	<ul><h2>Information about courses</h2>
		<li><a href="#">Information for courses</a></li>
		<li><a href="#">Share your opinion with other students</a></li>
		<li><a href="#">Need help?</a></li>
		<li><a href="#">Don't know anything about programming languages?</a></li>
		<li><a href="#">Complete quest to find which course is for you</a></li>
	</ul>
</div>
 -->

<table class="images">
	<tr><td  colspan="2" id="cours" style="text-align:center;"><h1>Нашите курсове</h1></td></tr>
<c:set var="tablewidth" value="2" />

<c:forEach var="image" items="${results.rows}" varStatus="row">

	<c:if test="${row.index % tablewidth == 0}">
	<tr>
	</c:if>

	<c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>

	<td id="image_table">
	
		<a href="<c:url value="/gallery?action=image&image=${image.id}" />">
			<img height="240" width="340"  src="${pageContext.request.contextPath}/pics/${imgname}" />
			 <p id="start">Start</p>
			 
		</a>
		
	</td>
	
	<c:if test="${row.index + 1 % tablewidth == 0}">
	</tr>
	</c:if>

</c:forEach>

</table>
</div>

</div>

<footer>
			
		<a href="http://twitter.com"><img src="img/twitter-icon.png" alt="Twitter Logo" class="social-icon"></a>
		
        <a href="https://www.facebook.com/viwareteam"><img src="img/facebook.png" alt="Facebook Logo" class="social-icon"></a>
         <a href="https://www.youtube.com/channel/UCChhBPjcpIDgjqFWO2gXO9A/feed"><img src="img/youtube.png" alt="" class="social-icon"></a>
       
        	<ul>
        		<li><a href="contact.html">Contact us</a></li>
        		<li><a href="about.html">About us</a></li>
        		<li><a href="help.html">Help</a></li>
        		<li><a href="help.html">Forum</a></li>
        	</ul>
        <p>&copy; 2014 ViWare.</p>
		</footer>

</body>
</html>