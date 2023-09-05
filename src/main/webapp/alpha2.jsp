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
<%
 	String line =  request.getParameter("line");
	if(line == null){
		throw new RuntimeException("line값이 null입니다.");
	}
	if(line.trim() ==""){
		throw new RuntimeException("line값이 \"\"입니다.");
	}
	try{
		Integer.parseInt(line);
	}catch(Exception e){
		throw new RuntimeException("line값이 숫자가 아닙니다. line =" + line);
	}
	
	if(Integer.parseInt(line) < 0 || Integer.parseInt(line)>100){
		throw new RuntimeException("line값이 0 ~100까지 입니다.line=" + line);
	}

%>

	
<table id="table">
<tbody>
<c:forEach var="i" begin="1" end="${param.line}">
	<tr>
		<c:forEach var="j" begin="1" end="${param.column}">
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
<button>start</button>
</body>
</html>