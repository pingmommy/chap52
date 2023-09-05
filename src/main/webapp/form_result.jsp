<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form_result.jsp</title>
</head>
<body>
<h1>form태그 전송 결과</h1>
<hr>
<%

	String name = request.getParameter("name");
	String search = request.getParameter("search");
%>
method = <%=request.getMethod() %><br>
name =<%=name %><br>
search =<%=search %><br>
<hr>
method = ${pageContext.request.method}<br>
name = ${param.name}<br>
search = ${param.search}<br>

<hr>
<%
	String name2 = request.getParameter("name");
	String[] names = request.getParameterValues("name");
%>

name2 = <%=name2%><br>
names = <%=Arrays.toString(names)%>
<hr>
<%
 var map = request.getParameterMap();
 for(var entry : map.entrySet()){
	 out.println(entry.getKey() + "=" + Arrays.toString(entry.getValue())+ "<br>");
 }

%>

<hr>
<ol>
<c:forEach var="entry" items="${pageContext.request.parameterMap}">
 <li>${entry.key} = ${Arrays.toString(entry.value)}</li>
</c:forEach>
</ol>
</body>
</html>