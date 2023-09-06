<%@page import="util.Color"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alpha6.jsp</title>
<style type="text/css">
#surface{
 font-family: monospace;
 font-size: 3em;
 border-collapse: collapse;
}
</style>
</head>
<body>
<h1>alpha Generator</h1>
<hr>
<form action="alpha6.jsp">
  <fieldset>
  	<legend>PSITION</legend>
  		<label for="line">LINE</label>	
		<input type="number" id="line" name="line" value="${param.line}" min="1" max="20">
		<label for="column">COLUMN</label>
		<input type="number" id="column" name="column" value="${param.column}" min="1" max="40">
  </fieldset>	

  <fieldset>	
	<legend>CHARACTER</legend>
		<c:forEach var="i" begin="0" end="25">
		<c:set var="ch" value="<%=\"\"+(char)('A'+(Integer)(pageContext.getAttribute(\"i\")))%>"/>	
		<label for="${ch}">${ch}</label>
		<c:choose>
		<c:when test="${param.ch eq ch}">
			<input type="radio" id="ch" name="ch" value="${ch}" checked="checked">
        </c:when>
        <c:otherwise>
			<input type="radio" id="ch" name="ch" value="${ch}">
        </c:otherwise>
        </c:choose>
        </c:forEach> 
  </fieldset>
  
  <fieldset>
    <legend>COLOR</legend>
    	<label for="fg">FG</label>	
		<select id="fg" name="fg">
			<c:forEach var="fg" items="${Color.values()}">
			<option value="${fg}">${fg}</option>
			</c:forEach>
		</select>
		<label for="bg">BG</label>
		<select id="bg" name="bg">
			<c:forEach var="bg" items="<%=Color.values()%>">
			<option value="${bg}">${bg}</option>
			</c:forEach>
		</select>
  </fieldset>
  <input type="submit" value="SEND">		
</form>
<hr>
<table id="surface">
<tbody>
<c:forEach var="i" begin="1" end="20">
	<tr>
		<c:forEach var="j" begin="1" end="40">
			<jsp:useBean id="a" class="util.Alpha"/>
			  <c:choose>
			  	<c:when test=" ${param.line eq i and param.column eq j}">
				  <td style="color:${param.fg}; background:${param.bg};">${param.ch}</td>
			  	</c:when>
			  	<c:otherwise>
				  <td style="color: black; background: black;">${a.ch}</td>
			  	</c:otherwise>
			  </c:choose>
			<c:remove var="a"/>
		</c:forEach>
	</tr>
</c:forEach>
</tbody>
</table>

</body>
</html>