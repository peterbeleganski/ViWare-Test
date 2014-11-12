<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp">
</c:import>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>





<div id="wrapper">	
		<div class="auth">
			<h1><img src="img/ViWare.png" />Authentication</h1> 
				<form class="search">	
					<input type="search" id="searchbox" /><span id="search_label">Search</span>
				</form>		
		</div>				
		<main>




<form action="/DataSource/Controller" method="POST" id="login_form">
<input type="hidden" name="action"  value="dologin"/>

<div class="inputs">
				<h2>Login</h2> <br />

				
					<label for="username">Email: </label><br />
					<input type="text" id="username" name="email" /><br />

					<label for="password">Password:</label>	<br />
					<input type="password" id="password" name="password" /><br />

					<input type="submit" value="Sign in" id="submit_login" />
					<a href="/DataSource/Controller?action=register" id="register_link">Sign UP</a>
					
				</div>


<p id="error">

<% if(request.getAttribute("message") == null) {%>

<p></p>
<% }else{ %>

<p> <%= request.getAttribute("message") %></p>
<% } %>

</form>

	<div id="slideshow">
					<img src="img/videoPic3.jpg"  width="440" height="300"/>
					<img src="img/videoPic4.jpg" width="440" height="300" />
				</div>
			
			<div id="video_plat">
				<h2>Sign Up and you will have full access to thousands of video lessons.Just Sign In!
				</h2>
				<video controls width="720" height="400">
					<source src="movies/movie2.mp4" />
				</video>
				<video controls width="720" height="400">
					<source src="movies/movie3.mp4" />
				</video>
			</div>


		</main>
	</div>	
		<c:import url="footer.jsp"></c:import>