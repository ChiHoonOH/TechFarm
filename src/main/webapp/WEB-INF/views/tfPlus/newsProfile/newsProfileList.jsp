<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- 상단 부분 -->

		<!-- 소식 메인부분 -->
		<div id="main">	
			<div class="wrapper clearfix">
				<h2 class="page-heading"><span>소식</span></h2>	
				
				<!-- 소식 이미지 텍스트 상자 시작 -->
				<div class="portfolio-thumbs clearfix" >
				
				<c:forEach var="dto" items="${newsGoodList}">
					<c:choose>
						<c:when test="${newsGoodList.size() != 0}">
							<figure>
			        			<figcaption>
			    					<strong>${dto.profileName}</strong>
			    					<span>팔로우 : ${dto.good}</span>
			    					<span>${dto.profileContents}</span>
			    					<em>${dto.profileDate}</em>
				        		</figcaption>	
				        		
				        		<c:if test="${dto.profileId == sessionScope.memberDTO.id}">
				        			<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=true&myId=${sessionScope.memberDTO.id}" class="thumb">
				        		</c:if>
				        		<c:if test="${dto.profileId != sessionScope.memberDTO.id}">
				        			<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=false&myId=${sessionScope.memberDTO.id}" class="thumb">
				        		</c:if>
		        					<!-- 컨텍스트 메뉴 처리 시작 -->
									<%@include file="newsContextMenu.jsp"%>
		        					<!-- 컨텍스트 메뉴 처리 끝 -->
		        				</a>
		        				
	        				</figure>
						</c:when>
					</c:choose>
				</c:forEach>
	        		
		        </div>
				<!-- 소식 이미지 텍스트 상자 끝-->
				
				<!-- 페이지 시작 -->
				<c:set var="currentPage" value="${currentPage}"/>
				<c:set var="countRow" value="${countRow}"/>
				<c:set var="pageCount" value="${pageCount}"/>
				<c:set var="pageBlock" value="${pageBlock}"/>
				<c:set var="startPage" value="${startPage}"/>
				<c:set var="endPage" value="${endPage}"/>
        		<ul class="pager">
        			<c:if test="${countRow > 0}">
        				<c:if test="${endPage > pageCount}">
        					<c:set var="endPage" value="${pageCount}"/>
        				</c:if>
   						<c:if test="${startPage > pageBlock}">
   							<li class="active"><a href="tfPlusNewsProfileList?pageNum=${startPage-pageBlock}&id=${sessionScope.memberDTO.id}">◀</a></li>
   						</c:if>
   						<c:forEach var="i" begin="${startPage}" end="${endPage}">
   							<c:choose>
   								<c:when test="${i == currentPage}">
   									<li class="active"><a href="tfPlusNewsProfileList?pageNum=${i}&id=${sessionScope.memberDTO.id}">${i}</a></li>
   								</c:when>
   								<c:otherwise>
   									<li><a href="tfPlusNewsProfileList?pageNum=${i}&id=${sessionScope.memberDTO.id}">${i}</a></li>
   								</c:otherwise>
   							</c:choose>
   						</c:forEach>
   						<c:if test="${endPage < pageCount}">
   							<li class="active"><a href="tfPlusNewsProfileList?pageNum=${startPage+pageBlick}&id=${sessionScope.memberDTO.id}">▶</a></li>
   						</c:if>
						<li class="paged">Page ${startPage} of ${endPage}</li>
					</c:if>
				</ul>
				<div class="clearfix"></div>
	        	<!-- 페이지 끝 -->
	        	
			</div>
		</div>
		<!-- 소식 메인 끝 -->

<!-- 하단 부분 -->
<%@include file="../footer.jsp"%>