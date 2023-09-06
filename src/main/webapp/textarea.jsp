<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>textarea</title>
</head>
<body>
<h1>TestArea</h1>
<form action="textarea.jsp" method="post">
	<fieldset>
		<input type="text" name ="title"> 
	</fieldset>
	<fieldset>
		<legend>article</legend>
		<textarea rows="10" cols="30" name="article"></textarea>
		<select name="lang">
			<option  value="java">JAVA</option>
			<option value="C++">C++</option>
			<option value="PYTHON">PYTHON</option>
		</select>
	</fieldset>
	
		<select id="s2" name="lang2" multiple="multiple">
			<option  value="java">JAVA</option>
			<option value="C++">C++</option>
			<option value="PYTHON">PYTHON</option>
		</select>
	
	<input type="submit" value="제출!!"> 
</form>

<hr>
<h3>title = ${param.title}</h3>
<div>article = ${param.article}</div>
<hr>
<pre>article = ${param.article}</pre>
<hr>
<div>lang = ${param.lang}</div>
<hr>
<pre>
<%-- lang2[0] = ${paramValues.lang2[0]} --%>
<c:forEach var="i" begin="0" end="3">
${paramValues.lang2[i]}
</c:forEach>

</pre>
</body>
</html>

<!--  
<textarea></textarea>  - 여러 줄 작성. 
엔터로 여러 줄 작성해도 출력부분에서는 한 줄로 나오는데,
<pre></pre>를 쓰면 여러 줄로 출력됨.
-->


<!-- 
<form>(안에 올 수 있는 것)</form>
   <input> 
   <textarea></textarea>
   <select></select> 
-->