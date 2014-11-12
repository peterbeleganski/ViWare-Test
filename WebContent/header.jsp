<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${param.title}</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="js/cycle.js"></script>
<script>

$(document).ready(function()
{
	$('#slideshow').cycle({
		fx:'fade'
		});
});
</script>
</head>


<body>

<header>
	
		<nav id="nav">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="/DataSource/Controller?action=news">News</a></li>
				<li><a href="about.html">About</a></li>
				<% if(session.getAttribute("isLogged").equals("false")){ %>		
				<li><a href="createAcc.jsp">Sign Up</a></li>		
				<%}else if(session.getAttribute("isLogged").equals("true")){ %>
					<li id="user_profil">Welcome<a href="#"><%=" "+request.getAttribute("email")  %></a></li>
					<li><a href="#">Logout</a></li>
				<% }%>
			</ul>
		</nav>
</header>




