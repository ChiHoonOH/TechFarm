<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js">
	<head>
		<meta charset="utf-8"/>
		<title>tfPlus</title>
		<link rel="stylesheet" media="all" href="resources/tfPlus/css/style.css"/>
		<link rel="stylesheet" href="resources/tfPlus/css/add.css"/>
		<link rel="stylesheet" href="resources/tfPlus/css/cssTop2.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		
		<!-- jstl -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		
		<!-- 이미지 경로 부분 -->
		<c:set var="newsProfileUpPath" value="resources/tfPlus/images/contents/profile"/>
		<c:set var="newsProfileBoardUpPath" value="resources/tfPlus/images/contents/profileBoard"/>
		<c:set var="memberProfileUpPath" value="resources/tfPlus/images/contents/memberProfile"/>
		<c:set var="memberProfileBoardUpPath" value="resources/tfPlus/images/contents/memberBoard"/>
		<c:set var="myProfileUpPath" value="resources/tfPlus/images/contents/myProfile"/>
		
		<!-- JS -->
		<script src="resources/tfPlus/js/jquery-1.9.0.js" type="text/javascript"></script>
		<script src="resources/tfPlus/js/jquery-1.6.4.min.js"></script>
		<script src="resources/tfPlus/js/css3-mediaqueries.js"></script>
		<script src="resources/tfPlus/js/custom.js"></script>
		<script src="resources/tfPlus/js/tabs.js"></script>
		
		<!-- Tweet -->
		<link rel="stylesheet" href="resources/tfPlus/css/jquery.tweet.css" media="all"  /> 
		<script src="resources/tfPlus/js/tweet/jquery.tweet.js" ></script> 
		<!-- ENDS Tweet -->
		
		<!-- superfish -->
		<link rel="stylesheet" media="screen" href="resources/tfPlus/css/superfish.css" /> 
		<script  src="resources/tfPlus/js/superfish-1.4.8/js/hoverIntent.js"></script>
		<script  src="resources/tfPlus/js/superfish-1.4.8/js/superfish.js"></script>
		<script  src="resources/tfPlus/js/superfish-1.4.8/js/supersubs.js"></script>
		<!-- ENDS superfish -->
		
		<!-- prettyPhoto -->
		<script  src="resources/tfPlus/js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
		<link rel="stylesheet" href="resources/tfPlus/js/prettyPhoto/css/prettyPhoto.css"  media="screen" />
		<!-- ENDS prettyPhoto -->
		
		<!-- poshytip -->
		<link rel="stylesheet" href="resources/tfPlus/js/poshytip-1.1/src/tip-twitter/tip-twitter.css"  />
		<link rel="stylesheet" href="resources/tfPlus/js/poshytip-1.1/src/tip-yellowsimple/tip-yellowsimple.css"  />
		<script  src="resources/tfPlus/js/poshytip-1.1/src/jquery.poshytip.min.js"></script>
		<!-- ENDS poshytip -->
		
		<!-- GOOGLE FONTS -->
		<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,300' rel='stylesheet' type='text/css'>
		
		<!-- Flex Slider -->
		<link rel="stylesheet" href="resources/tfPlus/css/flexslider.css" >
		<script src="resources/tfPlus/js/jquery.flexslider-min.js"></script>
		<!-- ENDS Flex Slider -->
		
		<!-- Less framework -->
		<link rel="stylesheet" media="all" href="resources/tfPlus/css/lessframework.css"/>
		
		<!-- modernizr -->
		<script src="resources/tfPlus/js/modernizr.js"></script>
		
		<!-- SKIN -->
		<link rel="stylesheet" media="all" href="resources/tfPlus/css/skin.css"/>
		
		<script type="text/javascript">
			$(document).ready(function(){
				var subMenuCount = 0;
				$('div.subMenuDiv').mouseup(function(e){
					if(subMenuCount==0){
						if(e.which=='3'){
							$(this).find('ul.subMenu').stop().slideDown(200);
						}
						subMenuCount = 1;
					} else {
						if(e.which=='3'){
							$(this).find('ul.subMenu').stop().slideUp(200);
						}
						subMenuCount = 0;
					}
				});
				
				var subMenuCount1 = 0;
				$('div.div_add').mouseup(function(e){
					if(subMenuCount1==0){
						if(e.which=='3'){
							$(this).find('table.jjm494_add').stop().slideDown(200);
						}
						subMenuCount1 = 1;
					} else {
						if(e.which=='3'){
							$(this).find('table.jjm494_add').stop().slideUp(200);
						}
						subMenuCount1 = 0;
					}
				});
				
				var subMenuCount2 = 0;
				$('div.subMenuDiv_add').mouseup(function(e){
					if(subMenuCount2==0){
						if(e.which=='1'){
							$(this).find('table.jjm494_subAdd').stop().slideDown(200);
						}
						subMenuCount2 = 1;
					} else {
						if(e.which=='1'){
							$(this).find('table.jjm494_subAdd').stop().slideUp(200);
						}
						subMenuCount2 = 0;
					}
				});
				
				$("#menu1").click(function() { 
					$("#header1").find(".header_menu").slideDown('normal').show();
				});
				$("#close").click(function() {
					$("#header1").find(".header_menu").slideUp('fast').show();  
				});
				$("#myinfo").click(function() { 
					$("#header1").find(".header_info").slideDown('normal').show();
				});
				$("#close2").click(function() {
					$("#header1").find(".header_info").slideUp('fast').show();  
				});
				
			});
			function check(href){
				if(${sessionScope.memberDTO == null}){
					alert("먼저 로그인해주세요");
				} else {
					location.href=href;
				}
			};
		</script>
		
		<c:if test="${sessionScope.memberDTO == null}">
		</c:if>
		
	</head>
	<body lang="en" onContextmenu="return false">
<div id="homebutton"><a href="home"><img src="resources/home/imgs/name2.png" width="125px" height="40px"></a></div>
<div id="viewtitle">SNS</div>
<div id="header1" align="right">
			<div class="topnav">
	  			<a rel="tooltip" title="메뉴"><img id="menu1" src="resources/home/imgs/menu_white.png" width="25" height="25"></a>&nbsp&nbsp&nbsp&nbsp
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
			<hr><br>
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
				<br>
				<input type="button" id="close2" value="Close"/>
			</div>
		</div>

	
		<!-- 헤더 시작 -->
		<header class="clearfix" onContextmenu="return false">
		
			<!-- 상단 열리는 메뉴 시작 -->
			<!-- <div id="top-widget-holder">
				<div class="wrapper">
					<div id="top-widget">
						<div class="padding">
							<ul  class="widget-cols clearfix">
								<li class="first-col">
									<div class="widget-block">
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/account.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">내계정</a><span>내계정 정보</span>
											</div>
										</div>
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/search.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">검색</a><span>검색 사이트</span>
											</div>
										</div>
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/mail.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">메일</a><span>메일 보내기</span>
											</div>
										</div>
									</div>
								</li>
								<li class="first-col">
									<div class="widget-block">
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/social.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">SNS</a><span>소식 커뮤니티</span>
											</div>
										</div>
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/utube.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">영상</a><span>유튜브</span>
											</div>
										</div>
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/drive.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">클라우드</a><span>자료 저장</span>
											</div>
										</div>
									</div>
								</li>
								<li class="first-col">
									<div class="widget-block">
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/memo.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">메모</a><span>메모기능</span>
											</div>
										</div>
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/chatting.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">채팅</a><span>채팅 구현</span>
											</div>
										</div>
										<div class="recent-post">
											<a href="#" class="thumb"><img src="resources/tfPlus/images/default/document.png" style="width:50px; height:50px;"></a>
											<div class="post-head">
												<a href="#">문서</a><span>문서 작성</span>
											</div>
										</div>
									</div>
								</li>
								
								<li class="fourth-col">
									<div class="widget-block">
										<h4>tfPlus</h4>
										<p>관심있는 분야에 대해 정보를 받을 수 있는 사이트.<a href="#">↑↑↑</a></p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<a href="#" id="top-open">Menu</a>
			</div> -->
			<!-- 상단 열리는 메뉴 끝 -->
			
			<!-- 네비 메뉴 시작 -->
			<div class="wrapper clearfix">
				<a href="#" id="logo">
					<h2><span style="color:white">tfPlus${sessionScope.memberDTO.name}</span></h2><hr>
				</a>
				<nav>
					<ul id="nav" class="sf-menu">
						<li class="current-menu-item"><a href="tfPlusIndex?id=${sessionScope.memberDTO.id}">HOME</a></li>
						<li><a href="#">소식모음</a>
							<ul>
								<li><a href="tfPlusNewsProfileList">추천 소식 모음</a></li>
								<li><a href="tfPlusNewsFollowList?id=${sessionScope.memberDTO.id}">팔로우 중</a></li>      
								<li><a href="tfPlusNewsProfileWriting?id=${sessionScope.memberDTO.id}">내가 만든 소식 모음</a></li>
							</ul>
						</li>
						<li><a href="#">커뮤니티</a>
							<ul>
								<li><a href="tfPlusMemberProfileList">추천 커뮤니티</a></li>
								<li><a href="tfPlusMemberJoinList?id=${sessionScope.memberDTO.id}">멤버</a></li>
								<li><a href="tfPlusMemberProfileWriting?id=${sessionScope.memberDTO.id}">내가 소유한 커뮤니티</a></li>
							</ul>
						</li>
						<li><a href="tfPlusMyProfile?myId=${sessionScope.memberDTO.id}">프로필</a></li>
						<li>
							<a href="tfPlusMyNotice?myId=${sessionScope.memberDTO.id}">알림</a>
						</li>
					</ul>
					<div id="combo-holder"></div>
				</nav>
			</div>
			<!-- 네비 메뉴 끝 -->
			
		</header>
		<!-- 헤더 끝 -->