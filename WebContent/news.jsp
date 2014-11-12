<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="js/cycle.js"></script>
<script>

$(document).ready(function()
{
	$('#slides').cycle({
		fx:'fade'
		});
});
</script>
<script>

$(document).ready(function()
{
	$('#slides_js').cycle({
		fx:'fade'
		});
});
</script>
<script>

$(document).ready(function()
{
	$('#slides_jsp').cycle({
		fx:'fade'
		});
});
</script>
</head>
<body>

<header>
	
		<nav id="nav">
			<ul>
				<li><a href="/ViWare-Test/Controller?action=home">Home</a></li>
				<li><a href="news.jsp" class="selected">News</a></li>
				<li><a href="about.html">About</a></li>
				<li id="sign_up"><a href="about.html"></a>
				
				 
				
				
			<!--  	<li>Welcome<a href="#"></a></li>-->
				
				<li><a href="/ViWare-Test/Controller?action=logout">[Logout]</a></li>
			</ul>
	
		</nav>
</header>


<div id="wrapper">

<h1 id="nov">Новини</h1>


	<h2>Първият курс на ViWare!Програмиране с Java.</h2>
		<div id="slides">	
			<img src="images/java_logo2.png" width="300" height="280" />
			<img src="images/java_logo3.jpg" width="300" height="280" />
			<img src="images/java_logo.png" width="300" height="280" />
			<img src="images/dincho.jpg" width="300" height="280" />
			<img src="images/dincho2.png" width="300" height="280" />
			
			
		</div>
	 
	<div id="desc">
		<div id="text_news">Този курс се препоръчва за всеки, който не се е занимавал с Java. Ще се запознаете
		с някои базови неща за езика и ще направите своите първи стъпки в програмирането!
		</div>
	</div>
	
	<div id="treiner">
	<p>Лекциите по Java ще ги води:<a href="/ViWare-Test/Controller?action=about">Динчо Костадинов.</a>Той ще води и курсовере по <span>HTML & CSS</span>.Може да научите повече за него в страницата "За Нас".</p>
	
	</div>		
<div>	
	<h2>Вторият  курс на ViWare! УЕБ Програмиране с JavaScript.</h2>
	
	<div id="slides_js">	
			<img src="images/js.jpg" width="300" height="280" />
			<img src="images/js2.png" width="300" height="280" />
			<img src="images/js3.png" width="300" height="280" />
			
		</div>
	
</div>

<div id="desc_js">
		<div id="text_news">Този курс се препоръчва за всеки, който иска да се занимава с уеб програмиране. Ще се запознаете
		с JavaScript, много важен елемент от всяко уеб приложение или сайт е JavaScript.
		</div>
	</div>
	
	<div id="treiner">
	<p>Лекциите по JavaScript ще ги води:<a href="/ViWare-Test/Controller?action=about">Дaниел Димитров.</a>Той ще води и курсовере по <span>jQuery & Android</span>.Може да научите повече за него в страницата "За Нас".</p>
</div>	

<div>	
	<h2>Третия  курс на ViWare! УЕБ Програмиране с Servlets & JSP.</h2>
	
	<div id="slides_jsp">	
			<img src="images/servlet.jpg" width="300" height="280" />
			<img src="images/apache.png" width="300" height="280" />
			<img src="images/jsp.png" width="300" height="280" />
			
		</div>
	
</div>

<div id="desc_jsp">
		<div id="text_news">Този курс се препоръчва за по-напреднали, които искат да разширят знанията по уеб програмиране. Ще се запознаете
		с Sevlets & JSP. Ще можете да правите динамични уеб сайтове.
		</div>
	</div>
	
	<div id="treiner">
	<p>Лекциите по Java Servlets & JSP ще ги води:<a href="/ViWare-Test/Controller?action=about">Петър Белегански.</a>Той ще води и курсовере по <span>DataBase & Ajax</span>.Може да научите повече за него в страницата "За Нас".</p>
</div>	



</div>		
<footer>
			
		<a href="http://twitter.com"><img src="img/twitter-icon.png" alt="Twitter Logo" class="social-icon"></a>
		
        <a href="http://facebook.com"><img src="img/facebook.png" alt="Facebook Logo" class="social-icon"></a>
         <a href="http://facebook.com"><img src="img/youtube.png" alt="Facebook Logo" class="social-icon"></a>
       
        	<ul>
        		<li><a href="contact.html">Контакти</a></li>
        		<li><a href="about.html">За нас</a></li>
        		<li><a href="help.html">Помощ</a></li>
        		<li><a href="help.html">Форум</a></li>
        	</ul>
        <p>&copy; 2014 ViWare.</p>
		</footer>

</body>
</html>