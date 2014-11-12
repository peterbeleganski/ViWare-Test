<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="ps" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=TF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
<title>${param.title}</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>

<body>



<header>
	
		<nav id="nav">
			<ul>
				<li><a href="/ViWare-Test/Controller?action=back" class="selected">Начало</a></li>
				<li><a href="/ViWare-Test/Controller?action=news">Новини</a></li>
				<li><a href="about.html">За нас</a></li>

				<li><a href="/ViWare-Test/Controller?action=back">Назад</a></li>
				
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

<center>

	<%-- Fetch the image data --%>

	<%-- If we also need to update the image rating, we need to
	get the image data and updating the rating in a single transaction --%>

	<sql:transaction dataSource="jdbc/webshop">

		<sql:query sql="select * from images where id=?" var="results">
			<sql:param>${param.image}</sql:param>
		</sql:query>

		<%-- Get the row for this image and format the file name --%>
		<c:set scope="page" var="image" value="${results.rows[0]}"></c:set>

		<c:set scope="page" var="average_ranking"
			value="${image.average_ranking}" />

		<%-- If the user has clicked to rate the image, do the rating. --%>
		<c:if test='${param.action == "rate"}'>
			<c:set scope="page" var="newRating"
				value="${(image.average_ranking * image.rankings + param.rating)/(image.rankings + 1)}" />

			<c:set scope="page" var="average_ranking" value="${newRating}" />

			<sql:update sql="update images set average_ranking=? where id=?">
				<sql:param>${newRating}</sql:param>
				<sql:param>${param.image}</sql:param>
			</sql:update>

			<sql:update sql="update images set rankings=? where id=?">
				<sql:param>${image.rankings+1}</sql:param>
				<sql:param>${param.image}</sql:param>
			</sql:update>

		</c:if>

	</sql:transaction>

	<%-- Show the title, first letter capitalised --%>
	<H2>
		<c:out
			value="${fn:toUpperCase(fn:substring(image.stem, 0, 1))}${fn:toLowerCase(fn:substring(image.stem, 1, -1))}" />
	</H2>
	<span class="rating">Оценено: <fmt:formatNumber value="${average_ranking}" maxFractionDigits="1"/></span>

	<%-- Output the image and the rating form --%>
	<table style="border: none;">
		<tr>
			<td><br style="margin-bottom: 1px;"> <span
				class="attribution">Видеото е от: <a class="attribution"
					target="_blank" href="${image.attribution_url}">${image.attribution_name}</a></span><br>

	<ps:image width="400"  stem="${image.stem}" extension="${image.image_extension}"/>
				</td>
			<td>
				<form action='<c:url value="/gallery" />' method="post">
					<input type="hidden" name="action" value="rate" /> <input
						type="hidden" name="image" value="${image.id}" />

					<table style="padding: 20px; border: none;">
						<tr>
							<td><h3>
									<i>Гласувай!</i>
								</h3></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="5">4
								- Чудесно</input></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="4">3
								- Добро</input></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="3"
								checked="checked">2 - Средно</input></td>
						</tr>
						<tr>
							<td align="left"><input type="radio" name="rating" value="2">1
								- Лошо</input></td>
						</tr>
						<tr>
							<td align="left"><input type="submit" name="submit"
								value="OK"></input></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</center>


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