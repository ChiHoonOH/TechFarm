<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- 상단 부분 -->

<link rel="stylesheet" href="resources/tfPlus/css/myProfile.css"/>
<div id="main">	
	<div class="wrapper clearfix">
		<div id="page-content" class="clearfix">
			<script type="text/javascript" src="js/form-validation.js"></script>
			<form id="contactForm">
				<h2 class="page-heading"><span>알림 정보</span></h2>
				<p></p>	
				<fieldset>
					<table class="jjm494_myProfile">
						<c:if test="${myNoticeList.size() == 0}">
							<tr>
								<td>남아 있는 알림이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${myNoticeList}">
							<tr>
								<th scope="row">글 제목</th>
								<td>
									<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.myNum}&my=true&noticeCheck=true&myNoticePK=${dto.myNoticePK}">${dto.myTitle}</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</fieldset>
			</form>
			<!-- 사용자 정보 사이드 메뉴 시작 -->
        	<aside id="contact-sidebar">
        		<div class="block">
	        		<h4>사용자 정보</h4>
	        		<c:set var="check" value="0"/>
	        		<c:forEach var="dto" items="${myProfileList}">
	        			<c:if test="${dto.myId == sessionScope.memberDTO.id}">
	        				<img id="img_size" src="${myProfileUpPath}/${dto.photo}" style="width:100px; height:50px;"/>
	        				<c:set var="check" value="1"/>
	        				<c:set var="hobby" value="${dto.hobby}"/>
	        			</c:if>
	        		</c:forEach>
	        		<c:if test="${check==0}">
	        			<img src="resources/tfPlus/images/default/basicImg.JPG" style="width:100px; height:50px;">
	        		</c:if>
	        		<p>이름 : ${sessionScope.memberDTO.name}</p>
	        		<c:if test="${check==0}">
	        			<p>취미 : 아직 등록안함</p>
	        		</c:if>
	        		<c:if test="${check!=0}">
	        			<p>취미 : ${hobby}</p>
	        		</c:if>
	        		<ul class="address-block">
	        			<li class="address">ID : ${sessionScope.memberDTO.id}</li>
	        			<li class="email"><a href="mailto:email@server.com">${sessionScope.memberDTO.email}</a></li>
	        		</ul>
        		</div>	        	
        	</aside>
        	<div class="clearfix"></div>
			<!-- 사용자 정보 사이드 메뉴 끝 -->
		</div>
	</div>
</div>

<!-- 하단 부분 -->
<%@include file="../footer.jsp"%>