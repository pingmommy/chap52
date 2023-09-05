<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>audio.jsp</title>
<script type="text/javascript">
window.onload = function(){
	video.play();
}
</script>

</head>
<body>
<h1>video 실습</h1>
<hr>
</body>
<video id="video" src="/media/Wildlife.webm" width="500" controls="controls" preload="auto" autoplay="autoplay"></video>
<video id="video" src="/media/Wildlife.webm" width="500" controls="controls" preload="auto" autoplay="autoplay"
       poster="http://via.placeholder.com/300x400" 
>

</video>
</html>