<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<link type="text/css" href="resources/login/style_login.css" rel="stylesheet"/>
<title>Login here</title>
</head>
<body>
	<div class="logmain">
		<table>
			<tr>
				<td><img src="resources/home/imgs/name.png" width="200"></td>
			</tr>
			<tr>
				<td><font color="#004080" size=5>로그인</font></td>
			</tr>
			<c:if test="${cid!=1}">
			<tr>
				<td>아이디</td>
			</tr>
			<tr>
				<form action="login" method="post">
				<td><input class="idpass" type="text" name="id" autofocus></td>
				<tr>
				<td><font color="#004080"><a href="searchId">아이디가 기억 안나시나요?</a></font></td>
			</tr>
			</tr>
			</c:if>
			<c:if test="${cid==2}">
				<tr>
					<td><span style="color:red">해당 아이디 또는 이메일이 존재하지 않습니다.</span></td>
				</tr>
			</c:if>
			<c:if test="${cid==1}">
			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<form action="login2" method="post">
				<td><input class="idpass" type="password" name="passwd" autofocus></td>
			</tr>
			<c:if test="${cid==1&&cidd==3}">
			<tr>
				<td><span style="color:red">비밀번호가 일치하지 않습니다.</span></td>
			</tr>
			</c:if>
			<tr>
				<td><font color="#004080"><a href="searchPw">비밀번호가 기억 안나시나요?</a></font></td>
			</tr>
			</c:if>
			<tr>
				<td align="right"><a href="createAccount"><font>TechFarm 회원가입</font></a></td>
			</tr>
			</form>
		</table>
	</div>
</body>
</html>