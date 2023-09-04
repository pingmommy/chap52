<%@page import= "util.Color"  %>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AlphacursorMove</title>
<style type="text/css">
#table{
 font-family: monospace;
 font-size: 3em;
 border-collapse: collapse;
}

:focus{
	outline: red;
	outline-style: dotted;
	outline-width: 5px;
}


</style>

<script type="text/javascript" src="/js/table4.js">

</script>
</head>
<body>
<h1></h1>
<hr>
<table id="table">
<tbody>
<c:forEach var="i" begin="1" end="20">
	<tr>
		<c:forEach var="j" begin="1" end="40">
			<jsp:useBean id="a" class="util.Alpha"/>
			<jsp:setProperty name="a" property="fg"  value="<%=Color.Black %>"/>
<%-- 			<jsp:setProperty name="a" property="bg"  value="${Color.Black}"/> --%>
			<jsp:setProperty name="a" property="bg"  value="<%=Color.Black%>"/>
			<td style="background :black;">${a.ch}</td>
			<c:remove var="a"/>
		</c:forEach>
	</tr>
</c:forEach>
</tbody>
</table>
<hr>
<button>start</button>
</body>
</html>