<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 소식 컨텍스트 메뉴 부분 -->

<!-- 컨텍스트 메뉴 처리 시작 -->
<div class="subMenuDiv">

	<c:set var="join" value="0"/>
	<img id="img_size" src="${memberProfileUpPath}/${dto.mPhoto}" alt="Alt text"/>
	<c:if test="${dto.mProfileId != sessionScope.memberDTO.id}">
		<ul class="subMenu">
			<li>
				<c:choose>
					<c:when test="${joinList.size()==0}">
						<a href="tfPlusMemberJoinInsert?profileNum=${dto.mProfileNum}&id=${sessionScope.memberDTO.id}">
							<img id="img_center" src="resources/tfPlus/images/default/join.JPG">
						</a>
					</c:when>
					<c:otherwise>
						<c:forEach var="fdto" items="${joinList}">
							<c:choose>
								<c:when test="${dto.mProfileNum==fdto.memberJoinNum && fdto.memberJoinId==sessionScope.memberDTO.id}">
									<c:set var="join" value="1"/>
									<a href="tfPlusMemberJoinDelect?profileNum=${dto.mProfileNum}&newsJoinPK=${fdto.memberJoinPK}">
										<img id="img_center" src="resources/tfPlus/images/default/unjoin.JPG">
									</a>
								</c:when>
							</c:choose>
						</c:forEach>
						
						<c:forEach var="fdto" items="${joinList}">
							<c:if test="${join==1}"></c:if>
							<c:if test="${join!=1}">
								<a href="tfPlusMemberJoinInsert?profileNum=${dto.mProfileNum}&id=${sessionScope.memberDTO.id}">
									<img id="img_center" src="resources/tfPlus/images/default/join.JPG">
								</a>
								<c:set var="join" value="1"/>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</li>
			<li><a href="memberProfileEmail">메일 보내기</a></li>
		</ul>
	</c:if>
	
	<c:if test="${dto.mProfileId == sessionScope.memberDTO.id}">
		<ul class="subMenu">
			<li>
				<a href="#" onclick="window.open('tfPlusMemberProfileUpdate?profileNum=${dto.mProfileNum}','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=715,height=500,left=500, top=250, scrollbars=yes');return false"  title="게시물을 수정할까요?" class="poshytip">
				수정 하기
				</a>
			</li>
			<li><a href="memberProfileDelete?profileNum=${dto.mProfileNum}">삭제 하기</a></li>
		</ul>
	</c:if>
	
</div>
<!-- 컨텍스트 메뉴 처리 끝 -->
       					
       					
       					
       					
       					
       					
       					
       					
       					
       					
       					