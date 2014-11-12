<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>
<link rel="stylesheet" href="css/signup.css" type="text/css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="css/main.css" type="text/css" media="screen" title="no title" charset="utf-8">
</head>
<body>

<header>
	
		<nav id="nav">
			<ul>
				<li><a href="/ViWare-Test/Controller?action=home">Начало</a></li>
				<li><a href="news.html">Новини</a></li>
				<li><a href="about.html">За нас</a></li>
				<% 
				String emailAddress = (String)session.getAttribute("email");
				if(emailAddress != null && emailAddress == "true"){%>
				<li>Welcome<a href="#"><%="  "+session.getAttribute("email") %></a></li>
				<%}else {%>
				<li><a href="createAcc.jsp" class="selected">Регистрация</a></li>
				<%} %>
			</ul>
		</nav>
</header>
<div class="header">
		<img src="${pageContext.request.contextPath}/images/logo.png" />
		<span id="title" ></span>
	</div>

<h1>New Account</h1>

<form method="post" action="/ViWare-Test/Controller?action=createaccount">

	<p>
			<label for="username">Име:</label>
			<input id="username_register" name="username" type="text">
		</p>
		<p>
			<label for="email">Имейл:</label>
			<input id="email_register" name="email" type="text">
		</p>
		<p>
			<label for="password">Парола</label>
			<input id="password_register" name="password" type="password">
			<span>Въведете парола по-дълга от 8 символа</span>
		</p>
		<p>
			<label for="confirm_password">Потвърди парола:</label>
			<input id="confirm_password" name="repeatpassword" type="password">
			<span>Моля потвърдете паролата</span>
		</p>
		<p id="error_mes">
		<% if(request.getAttribute("message")==null){ %>
		<% }else {%>
			<%=request.getAttribute("message") %>
		<%} %>
		</p>
		<p>
			<input type="submit" value="Готово" id="submit">
		</p>
		
	</form>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/app.js" type="text/javascript" charset="utf-8"></script>

<footer>
			
		<a href="http://twitter.com"><img src="img/twitter-icon.png" alt="Twitter Logo" class="social-icon"></a>
		
        <a href="https://www.facebook.com/viwareteam"><img src="img/facebook.png" alt="Facebook Logo" class="social-icon"></a>
         <a href="https://www.youtube.com/channel/UCChhBPjcpIDgjqFWO2gXO9A/feed"><img src="img/youtube.png" alt="" class="social-icon"></a>
       
        	<ul>
        		<li><a href="contact.html">За контакти</a></li>
        		<li><a href="about.html">За нас</a></li>
        		<li><a href="help.html">Помощ</a></li>
        		<li><a href="help.html">Форум</a></li>
        	</ul>
        <p>&copy; 2014 ViWare.</p>
		</footer>

</body>
</html>