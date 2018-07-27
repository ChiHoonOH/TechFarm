<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${optionDTO.blogname}</title>
<script src="resources/js/jquery-1.9.0.js" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/writeForm.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/smarteditor/js/HuskyEZCreator.js"/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="resources/css/myBlog.css">
<link rel="stylesheet" type="text/css" href="resources/css/cssTop.css">


<script type="text/javascript" charset="utf-8">
sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
function checkDelBoard(no){
	 var isDel = window.confirm("삭제한 게시글은 복구할 수 없습니다. 정말로 삭제하시겠습니까?")
	 if(isDel){
		 location.href="deleteBoard?no="+no
	 }
}
function checkDelReply(replyno,no){
	 var isDel = window.confirm("삭제한 댓글은 복구할 수 없습니다. 정말로 삭제하시겠습니까?")
	 if(isDel){
		 location.href="deleteReply?replyno="+replyno+"&no="+no
	 }
}
function login(){
	 var login = window.confirm("로그인 후 가능한 서비스입니다. 로그인 페이지로 이동하시겠습니까?")
	 if(login){
		 location.href="login"
	 }
 }
function check(href){
	if(${sessionScope.memberDTO == null}){
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

$(document).ready(function(){
	$("#menu1").click(function() { 
		$("#headertop").find(".header_menu").slideDown('normal').show();
	});
	$("#close").click(function() {
		$("#headertop").find(".header_menu").slideUp('fast').show();  
	});
	$("#myinfo").click(function() { 
		$("#headertop").find(".header_info").slideDown('normal').show();
	});
	$("#close2").click(function() {
		$("#headertop").find(".header_info").slideUp('fast').show();  
	});
});

</script>
</head>
<body>
<div id="homebutton"><a href="home"><img src="resources/home/imgs/name.png" width="125px" height="40px"></a></div>
<div id="viewtitle">Blog</div>
<div id="headertop" align="right">
			<div class="topnav">
	  			<a rel="tooltip" title="메뉴"><img id="menu1" src="resources/home/imgs/menu.png" width="25" height="25"></a>&nbsp&nbsp&nbsp&nbsp
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
	<table width="1900px" height="1900px">
		<tr>