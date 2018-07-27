<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
<!-- 상단 부분 -->

		<!-- 메인 시작 -->
		<div id="main">	
		
			<div class="wrapper">
			
				<!-- 메인 이미지 + 텍스트상자 시작 -->
				<div id="slider-holder" class="clearfix">
				
					<!-- 메인 이미지 시작 -->
					<div class="flexslider home-slider">
						<ul class="slides">
						<c:if test="${check == true}">
							<c:forEach var="dto" items="${newsProfileList}"> 
								<li>
									<c:if test="${dto.profileId == sessionScope.memberDTO.id}">
			        					<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=true"  class="thumb">
			        				</c:if>
			        				<c:if test="${dto.profileId != sessionScope.memberDTO.id}">
			        					<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=false&myId=${sessionScope.memberDTO.id}" class="thumb">
			        				</c:if>
										<img src="${newsProfileUpPath}/${dto.photo}" width="700px" height="300px" alt="alt text" />
										<p class="flex-caption">${dto.profileContents}</p>
									</a>
								</li>
							</c:forEach>
						</c:if>
						<c:if test="${check != true}">
							<c:forEach var="dto" items="${newsProfileOptionList}"> 
								<li>
									<c:if test="${dto.profileId == sessionScope.memberDTO.id}">
			        					<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=true"  class="thumb">
			        				</c:if>
			        				<c:if test="${dto.profileId != sessionScope.memberDTO.id}">
			        					<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=false&myId=${sessionScope.memberDTO.id}" class="thumb">
			        				</c:if>
										<img src="${newsProfileUpPath}/${dto.photo}" width="700px" height="300px" alt="alt text" />
										<p class="flex-caption">${dto.profileContents}</p>
									</a>
								</li>
							</c:forEach>
						</c:if>
						</ul>
					</div>
					<!-- 메인 이미지 끝 -->
					
					<div class="home-slider-clearfix "></div>
					
					<!-- 메인 텍스트 상자 시작 -->
					<div id="headline">
						<h1>회원님이 관심있을만한 소식</h1>
		        		<p>회원님께 <a href="#">추천</a> 하는 소식들</p>
		        		<em id="corner"></em>
		        	</div>
		        	<!-- 메인 텍스트 상자 끝 -->
		        	
		        </div>
		        <!-- 메인 이미지 + 텍스트상자 끝 -->
		        
		        <!-- 메인 소식 이미지박스 시작 -->
		        <div class="home-block">
		        	<h2 class="home-block-heading"><span>소식 모음</span></h2>
		        	<div class="one-third-thumbs clearfix" >
		        	
		        		<c:set var="count" value="1"/>
		        		<c:forEach var="dto" items="${newsProfileList}"> 
		        			<c:choose>
		        				<c:when test="${count!=3 and count!=6}">
		        					<figure>
					        			<figcaption>
					        				<strong>${dto.profileName}</strong>
				        					<span>${dto.profileContents}</span>
				        					<em>${dto.profileDate}</em>
				        				</figcaption>
				        				<c:if test="${dto.profileId == sessionScope.memberDTO.id}">
				        					<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=true"  class="thumb">
				        				</c:if>
				        				<c:if test="${dto.profileId != sessionScope.memberDTO.id}">
				        					<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=false&myId=${sessionScope.memberDTO.id}" class="thumb">
				        				</c:if>
				        					<img src="${newsProfileUpPath}/${dto.photo}" id="img_size" alt="Alt text" />
				        				</a>
				        			</figure>
		        				</c:when>
		        				<c:otherwise>
		        					<figure class="last">
					        			<figcaption>
					        				<strong>${dto.profileName}</strong>
				        					<span>${dto.profileContents}</span>
				        					<em>${dto.profileDate}</em>
				        				</figcaption>
				        				<c:if test="${dto.profileId == sessionScope.memberDTO.id}">
				        					<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=true"  class="thumb">
				        				</c:if>
				        				<c:if test="${dto.profileId != sessionScope.memberDTO.id}">
				        					<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=false&myId=${sessionScope.memberDTO.id}" class="thumb">
				        				</c:if>
				        					<img src="${newsProfileUpPath}/${dto.photo}" id="img_size" alt="Alt text" />
				        				</a>
				        			</figure>
		        				</c:otherwise>
		        			</c:choose>
		        			<c:set var="count" value="${count = count + 1}"/>
	        			</c:forEach>
	        			<a href="tfPlusNewsProfileList" class="more-link right">더보기..  &#8594;</a>
		        	</div>
		        </div>
	        	<!-- 메인 소식 이미지박스 끝 -->
	        	
	        	<!-- 메인 커뮤니티 이미지박스 시작 -->
	        	<div class="home-block">
	        		<h2 class="home-block-heading"><span>커뮤니티 모음</span></h2>
	        		<div class="one-fourth-thumbs clearfix">
	        		
	        			<c:set var="count" value="1"/>
	        			<c:forEach var="dto" items="${memberProfileList}"> 
	        				<c:choose>
	        					<c:when test="${count!=4}">
	        						<figure>
					        			<figcaption>
				        					<strong>${dto.mProfileName}</strong>
				        					<span>${dto.mProfileContents}</span>
				        					<em>${dto.mProfileDate}</em>
						        		</figcaption>
						        		<c:if test="${dto.mProfileId == sessionScope.memberDTO.id}">
				        					<a href="tfPlusMemberProfileBoardList?profileName=${dto.mProfileName}&id=${dto.mProfileId}&num=${dto.mProfileNum}&my=true"  class="thumb">
				        				</c:if>
				        				<c:if test="${dto.mProfileId != sessionScope.memberDTO.id}">
				        					<a href="tfPlusMemberProfileBoardList?profileName=${dto.mProfileName}&id=${dto.mProfileId}&num=${dto.mProfileNum}&my=false&myId=${sessionScope.memberDTO.id}" class="thumb">
				        				</c:if>
				        					<img src="${memberProfileUpPath}/${dto.mPhoto}" id="img_size" alt="Alt text" />
				        				</a>
					        		</figure>
	        					</c:when>
	        					<c:otherwise>
		        					<figure class="last">
					        			<figcaption>
				        					<strong>${dto.mProfileName}</strong>
				        					<span>${dto.mProfileContents}</span>
				        					<em>${dto.mProfileDate}</em>
						        		</figcaption>
						        		<c:if test="${dto.mProfileId == sessionScope.memberDTO.id}">
				        					<a href="tfPlusMemberProfileBoardList?profileName=${dto.mProfileName}&id=${dto.mProfileId}&num=${dto.mProfileNum}&my=true"  class="thumb">
				        				</c:if>
				        				<c:if test="${dto.mProfileId != sessionScope.memberDTO.id}">
				        					<a href="tfPlusMemberProfileBoardList?profileName=${dto.mProfileName}&id=${dto.mProfileId}&num=${dto.mProfileNum}&my=false&myId=${sessionScope.memberDTO.id}" class="thumb">
				        				</c:if>
				        					<img src="${memberProfileUpPath}/${dto.mPhoto}" id="img_size" alt="Alt text" />
				        				</a>
					        		</figure>
		        				</c:otherwise>
	        				</c:choose>
	        				<c:set var="count" value="${count = count + 1}"/>
	        			</c:forEach>
	        			<a href="tfPlusMemberProfileList" class="more-link right">더보기..  &#8594;</a>
		        	</div>
		        </div>
	        	<!-- 메인 커뮤니티 이미지 박스 끝 -->
	        	
	        </div>
		</div>
		<!-- 메인 끝 -->

<!-- 하단 부분 -->
<%@include file="footer.jsp"%>


























