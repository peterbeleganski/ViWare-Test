<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
<link rel="stylesheet" href="css/signup.css" type="text/css" media="screen" title="no title" charset="utf-8">

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

<form method="post" action="/DataSource/Controller?action=createaccount">

	<p>
			<label for="username">Full Name</label>
			<input id="username" name="username" type="text">
		</p>
		<p>
			<label for="email">Email Adress</label>
			<input id="email" name="email" type="text">
		</p>
		<p>
			<label for="password">Password</label>
			<input id="password" name="password" type="password">
			<span>Enter a password longer than 8 characters</span>
		</p>
		<p>
			<label for="confirm_password">Confirm Password</label>
			<input id="confirm_password" name="repeatpassword" type="password">
			<span>Please confirm your password</span>
		</p>
		<p>
			<input type="submit" value="Sign Up" id="submit">
		</p>
		<% if(request.getAttribute("message") == null) {%>

	<p></p>
<% }else{ %>

<p> <%= request.getAttribute("message") %></p>
<% } %>
	</form>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/app.js" type="text/javascript" charset="utf-8"></script>


</body>
</html>