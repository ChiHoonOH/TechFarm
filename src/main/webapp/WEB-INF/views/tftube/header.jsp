<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<link rel="stylesheet" type="text/css" href="resources/tftube/cssU123.css" > 
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#menu").click(function() { 
			$("#header").find(".header_menu").slideDown('normal').show();
		});
		$("#close").click(function() {
			$("#header").find(".header_menu").slideUp('fast').show();  
		});
		$("#myinfo").click(function() { 
			$("#header").find(".header_info").slideDown('normal').show();
		});
		$("#close2").click(function() {
			$("#header").find(".header_info").slideUp('fast').show();  
		});
	});
	function check(href){
		if (${sessionScope.memberDTO == null}){
			alert("먼저 로그인해주세요");
		} else {
			location.href=href;
		}
	};
	function insert(){
		document.frm.submit();
	};
	function update(){
		document.f.submit();
	};
	</script>
</head>
<body>
<div id="homebutton"><a href="home"><img src="resources/home/imgs/name.png" width="125px" height="40px"></a></div>
<div id="viewtitle">Tube</div>
<div id="header" align="right">
			<div class="topnav">
	  			<a rel="tooltip" title="메뉴"><img id="menu" src="resources/home/imgs/menu.png" width="25" height="25"></a>&nbsp&nbsp&nbsp&nbsp
	  			<c:if test="${sessionScope.memberDTO eq null}">
	  			<a rel="tooltip" title="로그인" href="login">
	  				<img src="resources/home/imgs/login.png" width="25" height="25">
	  			</a>
	  			</c:if>
	  			<c:if test="${sessionScope.memberDTO ne null}">
	  				<abbr title="정보보기">
	  				<img id="myinfo" src="resources/home/imgs/profile.png" width="30" height="30">
	  				</abbr>
	  			</c:if>
	  			&nbsp&nbsp&nbsp&nbsp&nbsp 
			</div>
			<div class="header_menu" align="center">
			<table>
				<tr height="70px">
					<td align="center" width="80px"><a href="#" onclick="check('myAccount');"><img id="img_handle" src="resources/home/imgs/account.png" width="50px" height="50px"></a><br>내계정</td>
					<td align="center" width="80px"><a href="home"><img id="img_handle" src="resources/home/imgs/search.png" width="50px" height="50px"></a><br>검색</td>
					<td align="center" width="80px"><a href="#" onclick="check('listJames');"><img id="img_handle" src="resources/home/imgs/mail.png" width="50px" height="50px"></a><br>메일</td>
				</tr>
				<tr height="70px">
					<td align="center" width="80px"><a href="#" onclick="check('tfPlusIndex');"><img id="img_handle" src="resources/home/imgs/social.png" width="50px" height="50px"></a><br>SNS</td>
					<td align="center" width="80px"><a href="tftube_main"><img id="img_handle" src="resources/home/imgs/utube.png" width="50px" height="50px"></a><br>영상</td>
					<td align="center" width="80px"><a href="blogmain"><img id="img_handle" src="resources/home/imgs/document.png" width="50px" height="50px"></a><br>블로그</td>
				</tr>
				<tr height="70px">
					<td align="center" width="80px"><a href="#" onclick="check('tfNoteIndex?id=${sessionScope.memberDTO.id}');"><img id="img_handle" src="resources/home/imgs/memo.png" width="50px" height="50px"></a><br>메모</td>
					<td align="center" width="80px"><a href="#" onclick="check('tfchat_main');"><img id="img_handle" src="resources/home/imgs/chatting.png" width="50px" height="50px"></a><br>채팅</td>
					<td align="center" width="80px"><a href="#" onclick="check('listContacts');"><img id="img_handle" src="resources/home/imgs/calendar.png" width="50px" height="50px"></a><br>연락처</td>
				</tr>
			</table>
			<hr>
			<input type="button" id="close" value="Close"/>		
			</div>
			<div class="header_info" align="center">
				<div>
					<img src="resources/home/imgs/account.png" width="50px" height="50px">
				</div>
				<div>
				${sessionScope.memberDTO.name}님 환영합니다.<br>
				${sessionScope.memberDTO.id}<br>
				${sessionScope.memberDTO.email}<br>
				<a href="logout">로그아웃</a><br>
				</div>
				<hr>
				<input type="button" id="close2" value="Close"/>
			</div>
		</div>
		
		