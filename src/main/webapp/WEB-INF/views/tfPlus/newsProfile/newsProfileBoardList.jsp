<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- 상단 부분 -->

		<!-- MAIN -->
		<div id="main">	
			<div class="wrapper clearfix">
			
				<!-- 소식 게시물 리스트 시작 -->
	        	<div id="posts-list">
	        	
	        		<h2 class="page-heading">
	        			<span>
	        				${newsBoardName}
	        				<c:if test="${newsprofileId==sessionScope.memberDTO.id}">
		        				<a href="#" onclick="window.open('tfPlusNewsProfileBoardWriting?name=${newsBoardName}&num=${num}','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=715,height=500,left=500, top=250, scrollbars=yes');return false"  title="게시물을 등록할까요?" class="poshytip">
		        					<img src="resources/tfPlus/img/social/plus.png"/>
		        				</a>
	        				</c:if>
	        			</span>
	        		</h2>	
	        		
	        		<c:if test="${newsBoardList.size() == 0}">
        				<article class="format-standard">
							<h2  class="post-heading"><a href="#">등록된 글이 없습니다.</a></h2>
						</article>
	        		</c:if>
	        		<c:forEach var="dto" items="${newsBoardList}">
	        		<c:set var="profileBoardNum" value="${dto.profileBoardPK}"/>
	        			<c:choose>
	        				<c:when test="${newsBoardList.size() != 0}">
	        					<article class="format-standard">
	        						<c:set var="BoardDate" value="${dto.profileBoardDate}"/>
									<div class="entry-date">
										<div class="number">${fn:substring(BoardDate,8,10)}</div> 
										<div class="year">${fn:substring(BoardDate,5,7)}, ${fn:substring(BoardDate,0,4)}</div>
									</div>
									<div class="feature-image">
										<a href="${newsProfileBoardUpPath}/${dto.profileBoardPhoto}"> <!-- data-rel="prettyPhoto"  -->
											<img src="${newsProfileBoardUpPath}/${dto.profileBoardPhoto}" alt="Alt text" width="600px" height="300px"/>
										</a>
									</div>
									<h2  class="post-heading"><a href="#">${dto.profileBoardTitle}</a></h2>
									<div class="excerpt">${dto.profileBoardContents}</div>
									<c:if test="${dto.profileBoardId == sessionScope.memberDTO.id}">
										<a href="#" onclick="window.open('tfPlusNewsProfileBoardUpdate?profileBoardPK=${dto.profileBoardPK}','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=715,height=500,left=500, top=250, scrollbars=yes');return false"  title="게시물을 수정할까요?" class="poshytip">
	        								수정 &#8594;
	        							</a>
										<a href="tfPlusNewsProfileBoardDelete?profileBoardPK=${dto.profileBoardPK}" class="read-more">삭제 &#8594;</a>
									</c:if>
									<div class="div_add">
										<div class="meta">
											<div class="categories">작성날짜 : ${fn:substring(BoardDate,5,7)}/${fn:substring(BoardDate,8,10)}</div>
											<div class="comments"><a href="javascript:;">댓글 보기</a></div>
											<div class="user">작성자 : ${dto.profileBoardId}</div>
										</div>
										
										<!-- 댓글 -->
										<table class="jjm494_add">
											<c:set var="ch" value="0"/>
											<c:forEach var="dto" items="${newsAddList}">
												<c:choose>
													<c:when test="${dto.profileBoardFK == profileBoardNum}">
													<c:set var="ch" value="1"/>
														<tr>
															<th scope="row">
																<c:set var="addCheck" value="0"/>
																<c:forEach var="addDto" items="${myProfileAllList}">
																	<c:if test="${dto.profileAddId == addDto.myId}">
																		<c:if test="${dto.re_level > 0}">
																		<c:forEach begin="1" end="${dto.re_level}">
																			..
																		</c:forEach>
																		</c:if>
																		<img id="img_size" src="${myProfileUpPath}/${addDto.photo}" style="width:50px; height:25px;"/>
																		<c:set var="addCheck" value="1"/>
																	</c:if>
																</c:forEach>
																<c:if test="${addCheck==0}">
																	<img src="resources/tfPlus/images/default/basicImg.JPG" style="width:50px; height:25px;">
																</c:if>
																${dto.profileAddName}
																<c:if test="${dto.profileAddId == sessionScope.memberDTO.id}">
																	<a href="tfPlusNewsAddDelete?addPK=${dto.profileAddPK}&profileName=${newsBoardName}&id=${newsprofileId}&my=${my}&myId=${sessionScope.memberDTO.id}">삭제</a>
																</c:if>
															</th>
															<td>
																<div class="subMenuDiv_add">
																	${dto.profileAddContents}
																	<a href="javascript:;">답글</a>
																	<form name="f" action="tfPlusNewsProfileAddPro" method="post">
																		<table class="jjm494_subAdd">
																			<tr>
																				<th scope="row">
																		        	<c:if test="${myProfileDTO != null}">
																		        		<img id="img_size" src="${myProfileUpPath}/${myProfileDTO.photo}" style="width:25px; height:15px;"/>
																		        	</c:if>
																		        	<c:if test="${myProfileDTO == null}">
																		        		<img src="resources/tfPlus/images/default/basicImg.JPG" style="width:25px; height:15px;">
																		        	</c:if>
																					<spen style="font-size:10px">${sessionScope.memberDTO.name}</spen>
																				</th>
																				<td>
																					<input name="profileAddContents" type="text" class="form-poshytip" title="내용을 입력하세요" style="background-color:#e2e2e2;"/>
																					<input type="submit" value="등록">
																					<!-- 히든으로 넘어갈 정보들 -->
																						<input type="hidden" value="${sessionScope.memberDTO.id}" name="profileAddId" id="to" />
																						<input type="hidden" value="${sessionScope.memberDTO.name}" name="profileBoardName" id="to" />
																						<input type="hidden" value="${profileBoardNum}" name="profileBoardFK" id="to" />
																						
																						<input type="hidden" value="${newsBoardName}" name="profileName" id="to" />
																						<input type="hidden" value="${newsprofileId}" name="id" id="to" />
																						<input type="hidden" value="${num}" name="num" id="to" />
																						<input type="hidden" value="${my}" name="my" id="to" />
																						
																						<input type="hidden" value="${dto.profileAddPK}" name="profileAddPK" id="to"/>
																						<input type="hidden" value="${dto.re_step}" name="re_step" id="to"/>
																						<input type="hidden" value="${dto.re_level}" name="re_level" id="to"/>
																					<!-- 히든으로 넘어갈 정보들 -->
																				</td>
																			</tr>
																		</table>
																	</form>
																</div>
															</td>
														</tr>
													</c:when>
												</c:choose>
											</c:forEach>
											<c:if test="${ch != 1}">
												<tr>
													<th></th>
													<td>등록된 댓글이 하나도 없습니다.</td>
												</tr>
											</c:if>
										</table>
										
										<form name="f" action="tfPlusNewsProfileAddPro" method="post">
											<table class="jjm494_add">
											    <tr>
											        <th scope="row">
											        	<c:if test="${myProfileDTO != null}">
											        		<img id="img_size" src="${myProfileUpPath}/${myProfileDTO.photo}" style="width:50px; height:25px;"/>
											        	</c:if>
											        	<c:if test="${myProfileDTO == null}">
											        		<img src="resources/tfPlus/images/default/basicImg.JPG" style="width:50px; height:25px;">
											        	</c:if>
											        	${sessionScope.memberDTO.name}
											        </th>
											        <td>
											        	<input name="profileAddContents" type="text" class="form-poshytip" title="내용을 입력하세요." style="background-color:#e2e2e2;"/>
											        	<input type="submit" value="등록"/>
														<!-- 히든으로 넘어갈 정보들 -->
															<input type="hidden" value="${sessionScope.memberDTO.id}" name="profileAddId" id="to" />
															<input type="hidden" value="${sessionScope.memberDTO.name}" name="profileBoardName" id="to" />
															<input type="hidden" value="${profileBoardNum}" name="profileBoardFK" id="to" />
															
															<input type="hidden" value="${newsBoardName}" name="profileName" id="to" />
															<input type="hidden" value="${newsprofileId}" name="id" id="to" />
															<input type="hidden" value="${num}" name="num" id="to" />
															<input type="hidden" value="${my}" name="my" id="to" />
															
															<input type="hidden" value="0" name="re_step" id="to"/>
															<input type="hidden" value="0" name="re_level" id="to"/>
														<!-- 히든으로 넘어갈 정보들 -->
													</td>
											    </tr>
											</table>
										</form>
										<!-- 댓글 끝 -->
										
									</div>
								</article>
	        				</c:when>
						</c:choose>
					</c:forEach>
					
					<!-- 소식 게시물 페이지 처리 시작 -->
		        	<!--소식 게시물 페이지 처리 끝 -->
	        		
	        	</div>
	        	<!-- 소식 게시물 리스트 끝 -->
		
				<!-- 사이드 메뉴 -->
	        	<aside id="sidebar">
	        		<ul>
		        		<li class="block">
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
	        				<ul class="address-block">
	        					<li class="address">ID : ${sessionScope.memberDTO.id}</li>
	        					<li class="email"><a href="mailto:email@server.com">${sessionScope.memberDTO.email}</a></li>
	        				</ul>
		        		</li>
	        		</ul>
	        		<em id="corner"></em>
	        	</aside>
				<!-- 사이드 메뉴 끝 -->
	        	
			</div>
		</div>
		<!-- ENDS MAIN -->
		
<!-- 하단 부분 -->
<%@include file="../footer.jsp"%>