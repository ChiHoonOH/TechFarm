<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="resources/login/style_login.css" rel="stylesheet"/>
<title>Search For TF PW</title>
	<script type="text/javascript">
		function checkForm(){
			if(member.id.value==""){
				alert("아이디를 입력하세요")
				member.id.focus()
				return false;
			}else if(member.name.value==""){
				alert("이름를 입력하세요")
				member.name.focus()
				return false;
			}else if(member.email1.value==""){
				alert("이메일을 입력하세요")
				member.email1.focus()
				return false;
			return true;
		}
	</script>
</head>
<body>
	<div class="createmain">
		<table>
			<form name="member" action="searchPw" method="post" onsubmit="return checkForm()">
			<tr>
				<td><img src="resources/home/imgs/name.png" width="200"></td>
			</tr>
			<tr>
				<td><font size=5>PW 찾기</font></td>
			</tr>
			<tr>
				<td>아이디<br><input id="id" type="text" name="id"></td>
			</tr>
			<tr>
				<td>이름<br><input type="text" name="name">
				<br>
			</tr>
			<tr>
				<td>E-mail<br><input type="text" name="email1">@<input type="text" name="email2">
				<br>
			</tr>
				<td><span>회원 가입시 입력했던 email 주소를 입력해주세요.</span></td>
			<tr>
				<td align="center"><input type="submit" value="PW 찾기"><input type="reset" value="다시작성"></td>
			</tr>
			</form>
		</table>
	</div>
</body>
</html>