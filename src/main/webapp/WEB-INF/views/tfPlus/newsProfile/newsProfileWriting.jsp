<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- 상단 부분 -->

<!-- 내소식 쓰기+리스트 시작 -->
<div id="main">	

	<div class="wrapper clearfix">
		
       	
		<!-- 내소식 컨텐츠 내용 시작 -->
       	<div id="page-content" class="clearfix">

			<!-- 소식 쓰기 폼 시작 -->
			<script type="text/javascript" src="js/form-validation.js"></script>
			<form name="f" id="contactForm" action="tfPlusNewsProfileWritingPro?id=${sessionScope.memberDTO.id}" method="post" enctype="multipart/form-data">
				<h2 class="page-heading"><span>내 소식 만들기</span></h2>	
				<p></p>
				<fieldset>
					<div>
						<input name="profileName"  id="name" type="text" class="form-poshytip" title="이름을 입력하세요" />
						<label>이름</label>
					</div>
					<div>
						<select class="selectOption" name="checkOption">
							<option>분류를 지정하세요.</option>
							<option>게임</option>
							<option>운동</option>
							<option>학업</option>
							<option>미용</option>
						</select>
					</div><br>
					<div>
						<input name="photo"  id="web" type="file" class="form-poshytip" title="프로필 사진을 등록하세요" />
						<label>프로필 사진</label>
					</div><br>
					<div>
						<textarea  name="profileContents"  id="comments" rows="2" cols="2" class="form-poshytip" title="한줄평을 남기세요"></textarea>
					</div>
					
					<!-- 히든으로 넘어갈 정보들 -->
					<input type="hidden" value="${sessionScope.memberDTO.id}" name="profileId" id="to" />
					<!-- 히든으로 넘어갈 정보들 -->
					
					<p><input type="submit" value="만들기"/></p>
				</fieldset>
			</form>
			<!-- 소식 쓰기 폼 끝 -->
			
			<!-- 사용자 정보 사이드 메뉴 시작 -->
        	<aside id="contact-sidebar">
        		<div class="block">
	        		<h4>사용자 정보</h4>
	        		<c:if test="${myProfileDTO != null}">
	        			<img id="img_size" src="${myProfileUpPath}/${myProfileDTO.photo}" style="width:100px; height:50px;"/>
	        			<p>취미 : ${myProfileDTO.hobby}</p>
	        		</c:if>
	        		<c:if test="${myProfileDTO == null}">
	        			<img src="resources/tfPlus/images/default/basicImg.JPG" style="width:100px; height:50px;"/>
	        			<p>취미 : 아직 등록안함</p>
	        		</c:if>
	        		<p>이름 : ${sessionScope.memberDTO.name}</p>
	        		<p>내 소식 : ${newsMyList.size()}</p>
	        		<ul class="address-block">
	        			<li class="address">ID : ${sessionScope.memberDTO.id}</li>
	        			<li class="email"><a href="mailto:email@server.com">${sessionScope.memberDTO.email}</a></li>
	        		</ul>
        		</div>	        	
        	</aside>
        	<div class="clearfix"></div>
			<!-- 사용자 정보 사이드 메뉴 끝 -->
			
			<h2 class="page-heading"><span>내 소식 모음</span></h2>	
			
			<div class="map-content">
			
				<!-- 내소식 이미지 박스 시작 -->
				<div class="home-block">
					<div class="one-fourth-thumbs clearfix">
						<c:forEach var="dto" items="${newsMyList}">
							<c:choose>
								<c:when test="${newsMyList.size() != 0}">
									<figure>
					        			<figcaption>
					    					<strong>${dto.profileName}</strong>
					    					<span>팔로우 : ${dto.good}</span>
					    					<span>${dto.profileContents}</span>
					    					<em>${dto.profileDate}</em>
					    					<a href="#" class="opener"></a>
						        		</figcaption>	
						        		
										<c:if test="${dto.profileId == sessionScope.memberDTO.id}">
						        			<a href="tfPlusNewsProfileBoardList?profileName=${dto.profileName}&id=${dto.profileId}&num=${dto.profileNum}&my=true" class="thumb">
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
				</div>
				<!-- 내소식 이미지 박스 끝 -->
				
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
   							<li class="active"><a href="tfPlusNewsProfileWriting?pageNum=${startPage-pageBlock}&id=${sessionScope.memberDTO.id}">◀</a></li>
   						</c:if>
   						<c:forEach var="i" begin="${startPage}" end="${endPage}">
   							<c:choose>
   								<c:when test="${i == currentPage}">
   									<li class="active"><a href="tfPlusNewsProfileWriting?pageNum=${i}&id=${sessionScope.memberDTO.id}">${i}</a></li>
   								</c:when>
   								<c:otherwise>
   									<li><a href="tfPlusNewsProfileWriting?pageNum=${i}&id=${sessionScope.memberDTO.id}">${i}</a></li>
   								</c:otherwise>
   							</c:choose>
   						</c:forEach>
   						<c:if test="${endPage < pageCount}">
   							<li class="active"><a href="tfPlusNewsProfileWriting?pageNum=${startPage+pageBlick}&id=${sessionScope.memberDTO.id}">▶</a></li>
   						</c:if>
						<li class="paged">Page ${startPage} of ${endPage}</li>
					</c:if>
				</ul>
				<div class="clearfix"></div>
	        	<!-- 페이지 끝 -->
				
			</div>
			
		</div>	        	
       	<!--  내소식 컨텐츠 내용 끝 -->
       	
	</div>
	
</div>
<!-- 내소식 쓰기+리스트 종료 -->

<!-- 하단 부분 -->
<%@include file="../footer.jsp"%>