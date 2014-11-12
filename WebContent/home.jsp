<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:import url="header.jsp">
<c:param name="title" value="ViWare Home Page"></c:param>
</c:import>

<sql:setDataSource var="ds" dataSource="jdbc/webshop" />

<sql:query dataSource="${ds}" sql="select * from images order by average_ranking desc limit 10" var="results" />

<div id="wrapper">

<table class="images">
	<tr><td id="cours"><h1>Our Courses</h1></td></tr>
<c:set var="tablewidth" value="2" />

<c:forEach var="image" items="${results.rows}" varStatus="row">

	<c:if test="${row.index % tablewidth == 0}">
	<tr>
	</c:if>

	<c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>

	<td id="image_table">
	
		<a href="<c:url value="/gallery?action=image&image=${image.id}" />">
			<img width="240"  src="${pageContext.request.contextPath}/pics/${imgname}" />
			 <span id="click_toplay">Click to play</span>
		</a>
		
	</td>
	
	<c:if test="${row.index + 1 % tablewidth == 0}">
	</tr>
	</c:if>

</c:forEach>

</table>
</div>
<c:import url="footer.jsp"></c:import>
