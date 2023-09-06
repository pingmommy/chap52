<%@page import="com.example.alpha.AlphaParam"%>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alpha4.jsp</title>
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
<jsp:useBean id="mapping" class="com.example.alpha.AlphaParam"/>
<%
	mapping.setLine(request.getParameter("line"));
	mapping.setColumn(request.getParameter("column"));
%>
<jsp:setProperty property="*" name="mapping"/>

<c:if test="${param.line==null}">
<jsp:setProperty property="line" name="mapping" value="${null}"/>
</c:if>

<c:if test="${param.column==null}">
<jsp:setProperty property="column" name="mapping" value="${null}"/>
</c:if>

<table id="table">
<tbody>
<c:forEach var="i" begin="1" end="${mapping.line}">
	<tr>
		<c:forEach var="j" begin="1" end="${mapping.column}">
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
${e.message}<br>
<%-- ${e}<br> --%>

</c:if>

<hr>

<a href="alpha5.jsp">뒤로가기</a>

</body>
</html>