<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
	html {
	background: url(resources/images/main.jpg) no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	}
	 #main{
	 position:absolute;
	 background-color: white;
	 width:50%;
	 height:50%;
	 top: 25%;
	 left: 25%;
	 -moz-border-radius: 12px;
  	-webkit-border-radius: 12px;
   	 border-radius: 12px;
	 }

</style>
<meta charset="UTF-8">
<title>Welcome to FarmBlog</title>
<script src="resources/js/jquery-1.9.0.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	$("#main").hide();
	$("html").click(function(){
		$("#main").slideDown(1000);
	});
}); 
</script>
</head>
<body>
<div id="main" align="center" valign="center">
<h1>내 관심사를 내 스타일대로</h1>
<h2>독특하고 멋진 블로그를 만들어 보세요. 무료로 손쉽게 만들 수 있습니다.</h2>
<img src="resources/images/Enter.png" onclick="location.href='blogStart'" style="cursor:pointer;" width="200" height="100"/>
</div>
</body>
</html>