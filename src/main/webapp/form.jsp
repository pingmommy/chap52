<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form.jsp</title>
</head>
<body>
<h1>formtag 실습</h1>
<hr>
<a href="form_result.jsp?name=xxx">form_result.jsp</a>
<hr>
<form action="form_result.jsp" method="get">
	<input type="text" name="search">
	<input type="submit">
</form>
<hr>
<form action="form_result.jsp" method="post">
	<input type="text" name="search">
	<input type="submit">
</form>
</body>
</html>


<!-- get  -->
<!-- url에 실어서 보낸다.(쿼리스트링) -->
<!-- <a>랑 비슷 .. -->
<!-- 소량의 데이터를 보낼 때 편하다. -->
<!-- 데이터가 url이 보여서 보안에 취약  -->

<!-- 차이점:  -->
<!-- get은 데이터네임을 변경할 수 있다.  -->



<!-- post  -->
<!-- 데이터를 바디에 실어서 보낸다.  -->
<!-- 보안에 더 철저함.  -->
<!-- 데이터가 클 때 쓴다.  -->

<!-- request 전문 형식  -->

<!-- 요청 url       ->get 방식 -->
<!-- ----------- -->
<!-- header -->
<!-- ----------- -->
<!-- body          ->post방식 -->