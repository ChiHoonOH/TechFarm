<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- 상단 부분 -->

		<!-- 커뮤니티 메인부분 -->
		<div id="main">	
			<div class="wrapper clearfix">
				<h2 class="page-heading"><span>커뮤니티 목록</span></h2>	
				
				<!-- 커뮤니티 이미지 텍스트 상자 시작 -->
				<div class="portfolio-thumbs clearfix" >
				
				<c:if test="${memberMyJoinList.size() == 0}">
					<h2  class="post-heading"><a href="#">가입한 목록이 없습니다.</a></h2>
				</c:if>
				<c:forEach var="dto" items="${memberMyJoinList}">
					<c:choose>
						<c:when test="${memberMyJoinList.size() != 0}">
							<figure>
			        			<figcaption>
			    					<strong>${dto.mProfileName}</strong>
			    					<span>팔로우 : ${dto.mGood}</span>
			    					<span>${dto.mProfileContents}</span>
			    					<em>${dto.mProfileDate}</em>
				        		</figcaption>	
				        		
		        				<c:if test="${dto.mProfileId == sessionScope.memberDTO.id}">
				        			<a href="tfPlusMemberProfileBoardList?profileName=${dto.mProfileName}&id=${dto.mProfileId}&num=${dto.mProfileNum}&my=true" class="thumb">
				        		</c:if>
				        		<c:if test="${dto.mProfileId != sessionScope.memberDTO.id}">
				        			<a href="tfPlusMemberProfileBoardList?profileName=${dto.mProfileName}&id=${dto.mProfileId}&num=${dto.mProfileNum}&my=false&myId=${sessionScope.memberDTO.id}" class="thumb">
				        		</c:if>
		        					<!-- 컨텍스트 메뉴 처리 시작 -->
									<%@include file="memberContextMenu.jsp"%>
		        					<!-- 컨텍스트 메뉴 처리 끝 -->
		        				</a>
		        				
	        				</figure>
						</c:when>
					</c:choose>
				</c:forEach>
	        		
		        </div>
				<!-- 소식 이미지 텍스트 상자 끝-->
	        	
			</div>
		</div>
		<!-- 소식 메인 끝 -->

<!-- 하단 부분 -->
<%@include file="../footer.jsp"%>