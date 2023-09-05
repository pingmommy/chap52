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
</style>
</head>
<body>
<h1>alpha Generator</h1>
<hr>
<c:catch var="e">	
<table id="table">
<tbody>
<c:forEach var="i" begin="1" end="${param.line == null  || param.line ==''? 1 : param.line}">
	<tr>
		<c:forEach var="j" begin="1" end="${param.column == null || param.column ==''? 1 : param.column}">
			<jsp:useBean id="a" class="util.Alpha"/>
			<td style="color:${a.fg};background:${a.bg};">${a.ch}</td>
			<c:remove var="a"/>
		</c:forEach>
	</tr>
</c:forEach>
</tbody>
</table>
</c:catch>

<c:if test="${e!=null}">
<%-- ${e.message}<br> --%>
<%-- ${e}<br> --%>
line.column은 0 이상의 양수를 입력하세요.<br>
line = ${param.line}<br>
column = ${param.column}
</c:if>

<hr>
<button>start</button>
</body>
</html>