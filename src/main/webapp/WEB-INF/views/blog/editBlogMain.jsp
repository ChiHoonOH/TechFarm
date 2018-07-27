<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
<%@ include file="editBlogTop.jsp"%>
		<td valign="top">
<form action="editBlog" method="post" enctype="multipart/form-data">
<c:choose>
<c:when test="${mode=='board'}"></c:when>
<c:when test="${mode=='neighbor'}"></c:when>
<c:otherwise><br>&nbsp;&nbsp;&nbsp;<input type="submit" value="저장"></c:otherwise>
</c:choose>
<br><br>
<input type="hidden" value="${mode}">	

<c:if test="${mode=='profile'}">
	<div align="center">
	<h1>프로필 사진 변경</h1><br>
	<input type="hidden" name="id" value="${optionDTO.id}">
	<input type="hidden" name="mode" value="${mode}">
	<img src="resources/upload/${optionDTO.id}/${optionDTO.profile}" width="300px" height="300px" id="pfimg"><br>
	<input type="file" name="profile" id="pf"><br>
	<input type="button" value="사진변경" onclick="document.getElementById('pf').click();">
	<br><br>
	이미지 파일은 jpg,png,gif 파일만 등록 가능합니다.
	<br><br>
	<h1>소개 글 변경</h1><br>
	<textarea rows="10" cols="30" maxlength="200" name="introduce">${optionDTO.introduce}</textarea>
	</div>
</c:if>

<c:if test="${mode=='layout'}">
	<div align="center">
		<h1>레이아웃 변경</h1><br>
		<input type="hidden" name="id" value="${optionDTO.id}">
		<input type="hidden" name="mode" value="${mode}">
		<input type="radio" name="layout" value="1" id="layout1" checked style="display:none;">
		<img src="resources/images/layout/layout1on.jpg" onclick='layoutChoice(1)' style="cursor:pointer;" class="layout1">
		<input type="radio" name="layout" value="2" id="layout2" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout2.jpg" onclick='layoutChoice(2)' style="cursor:pointer;" class="layout2">
		<input type="radio" name="layout" value="3" id="layout3" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout3.jpg" onclick='layoutChoice(3)' style="cursor:pointer;" class="layout3">
		<input type="radio" name="layout" value="4" id="layout4" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout4.jpg" onclick='layoutChoice(4)' style="cursor:pointer;" class="layout4">
		<input type="radio" name="layout" value="5" id="layout5" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout5.jpg" onclick='layoutChoice(5)' style="cursor:pointer;" class="layout5">
		<input type="radio" name="layout" value="6" id="layout6" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout6.jpg" onclick='layoutChoice(6)' style="cursor:pointer;" class="layout6">
	</div><br><br>
	<div class="layoutedit1" align="center" style="border: 5px double #ccc; width:500px;" >
		레이아웃1
		<table width="300px" height="200px" align="center">
			<tr>
				<td align="left" rowspan="2" valign="top">
					<div class="aside" height="100%" align="right">
						<img src="resources/images/layout/sidebar.jpg">
					</div>
				</td>
				<td>
					<div class="title" width="100%" align="center">
						<img src="resources/images/layout/title.jpg">
					</div>
				</td>
				<td align="left" rowspan="2" valign="top">
					<div class="aside2" align="left">
						<img src="resources/images/layout/empty.jpg">
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div>
						<img src="resources/images/layout/main.jpg">
					</div>
				</td>
			</tr>
		</table>
			</div>
			<div class="layoutedit2" align="center" style="border: 5px double #ccc; width:500px; display:none;">
				레이아웃2
		<table width="300px" height="200px" align="center">
			<tr>
				<td align="right" rowspan="2" valign="top">
					<img src="resources/images/layout/empty.jpg">
				</td>
				<td align="center">
					<div class="title" width="100%">
						<img src="resources/images/layout/title.jpg">
					</div>
				</td>
				<td align="left" rowspan="2" valign="top">
					<div class="aside2" height="100%" align="left">
						<img src="resources/images/layout/sidebar2.jpg">
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div>
						<img src="resources/images/layout/main.jpg">
					</div>
				</td>
			</tr>
		</table>
			</div>
			<div class="layoutedit3" align="center" style="border: 5px double #ccc; width:500px; display:none; ">
				레이아웃3
				<table width="300px" height="200px" align="center">
					<tr>
						<td align="right" rowspan="2" valign="top">
							<div class="aside" height="100%" align="right">
								<img src="resources/images/layout/sidebar.jpg">
							</div>
						</td>
						<td align="center">
							<div class="title" width="100%">
								<img src="resources/images/layout/main.jpg">
							</div>
						</td>
						<td align="left" rowspan="2" valign="top">
							<div class="aside2" height="100%" align="left">
								<img src="resources/images/layout/empty.jpg">
							</div>
						</td>
					</tr>
					<tr>
						<td align="center">
							<div>
								<img src="resources/images/layout/title.jpg">
							</div>
						</td>
					</tr>
				</table>
					</div>
					<div class="layoutedit4" align="center" style="border: 5px double #ccc;width:500px;display:none; ">
						레이아웃4
						<table width="300px" height="200px" align="center">
							<tr>
								<td align="right" rowspan="2" valign="top">
								<img src="resources/images/layout/empty.jpg">
								</td>
								<td align="center">
									<div class="title" width="100%">
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
								<td align="left" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/sidebar2.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td align="center">
									<div>
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="layoutedit5" align="center" style="border: 5px double #ccc;width:500px;display:none; ">
						레이아웃5
						<table width="300px" height="200px" align="center">
							<tr>
								<td align="right" rowspan="2" valign="top">
									<div class="aside" height="100%" align="right">
									<img src="resources/images/layout/sidebar.jpg">
									</div>
								</td>
								<td align="center">
									<div class="title" width="100%">
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
								<td align="left" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/sidebar2.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td align="center">
									<div>
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="layoutedit6" align="center" style="border: 5px double #ccc;width:500px;display:none; ">
						레이아웃6
						<table width="300px" height="200px" align="center">
							<tr>
								<td align="right" rowspan="2" valign="top">
								<img src="resources/images/layout/sidebar.jpg">
								</td>
								<td align="center">
									<div class="title" width="100%">
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
								<td align="left" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/sidebar2.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td align="center">
									<div>
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div>
</c:if>

<c:if test="${mode=='skin'}">
					<div align="center">
					<h1>스킨 변경</h1><br>
					<input type="hidden" name="id" value="${optionDTO.id}">
					<input type="hidden" name="mode" value="${mode}">
					<table width="1000px">
						<tr>
							<th>고양이</th>
							<td width="20%"><input type="radio" name="skin" value="skin1" checked><img src="resources/images/skin/pf_skin1.jpg" width="100" height="100" align="center" class="skinpf"></td>
							<td width="20%"><input type="radio" name="skin" value="skin2"><img src="resources/images/skin/pf_skin2.jpg" width="100" height="100" align="center" class="skinpf"></td>
							<td width="20%"><input type="radio" name="skin" value="skin3"><img src="resources/images/skin/pf_skin3.jpg" width="100" height="100" align="center" class="skinpf"></td>
							<td width="20%"><input type="radio" name="skin" value="skin4"><img src="resources/images/skin/pf_skin4.jpg" width="100" height="100" align="center" class="skinpf"></td>
						</tr>
						<tr>
							<th>강아지</th>
							<td width="20%"><input type="radio" name="skin" value="skin5"><img src="resources/images/skin/pf_skin5.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin6"><img src="resources/images/skin/pf_skin6.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin7"><img src="resources/images/skin/pf_skin7.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin8"><img src="resources/images/skin/pf_skin8.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
						</tr>
						<tr>
							<th>봄</th>
							<td width="20%"><input type="radio" name="skin" value="skin9"><img src="resources/images/skin/pf_skin9.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin10"><img src="resources/images/skin/pf_skin10.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin11"><img src="resources/images/skin/pf_skin11.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin12"><img src="resources/images/skin/pf_skin12.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
						</tr>
						<tr>
							<th>여름</th>
							<td width="20%"><input type="radio" name="skin" value="skin13"><img src="resources/images/skin/pf_skin13.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin14"><img src="resources/images/skin/pf_skin14.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin15"><img src="resources/images/skin/pf_skin15.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin16"><img src="resources/images/skin/pf_skin16.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
						</tr>
						<tr>
							<th>가을</th>
							<td width="20%"><input type="radio" name="skin" value="skin17"><img src="resources/images/skin/pf_skin17.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin18"><img src="resources/images/skin/pf_skin18.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin19"><img src="resources/images/skin/pf_skin19.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin20"><img src="resources/images/skin/pf_skin20.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
						</tr>
						<tr>
							<th>겨울</th>
							<td width="20%"><input type="radio" name="skin" value="skin21"><img src="resources/images/skin/pf_skin21.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin22"><img src="resources/images/skin/pf_skin22.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin23"><img src="resources/images/skin/pf_skin23.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin24"><img src="resources/images/skin/pf_skin24.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
						</tr>
						<tr>
							<th>하늘</th>
							<td width="20%"><input type="radio" name="skin" value="skin25"><img src="resources/images/skin/pf_skin25.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin26"><img src="resources/images/skin/pf_skin26.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin27"><img src="resources/images/skin/pf_skin27.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
							<td width="20%"><input type="radio" name="skin" value="skin28"><img src="resources/images/skin/pf_skin28.jpg" width="100" height="100" align="center" class="skinpf"></td></td>
						</tr>	
					</table>
					</div>
</c:if>

<c:if test="${mode=='blog'}">
<div align="center">
<div class="edittitle">
<h1>블로그 타이틀 변경</h1><br>
<input type="hidden" name="id" value="${optionDTO.id}">
<textarea rows="3" cols="20" maxlength="30" name="headerword">${optionDTO.headerword}</textarea><br><br><br><br>
<input type="hidden" name="mode" value="${mode}">
</div>
<div class="edittitle">
<h1>블로그 탈퇴</h1><br>
<input type="button" value="탈퇴하기" onclick="javascript:checkDel('${optionDTO.id}');">
</div>
</div>
</c:if>

<c:if test="${mode=='neighbor'}">
<div align="center">
<div class="edittitle">
<h1>이웃관리</h1><br>
<input type="hidden" name="id" value="${optionDTO.id}">
<input type="hidden" name="mode" value="${mode}">
<c:choose>
<c:when test="${neighborlist.size()==0}">
<div align="center">
<h2>등록된 이웃이 없습니다.</h2>
</div>
</c:when>
<c:otherwise>
<c:forEach var="neighborlist" items="${neighborlist}">
<div align="center">
<img src="resources/upload/${neighborlist.neighborid}/${neighborprofile[status.index]}" width="60" height="60" align="center">
${neighborlist.neighborid} &nbsp;&nbsp;&nbsp;<a href="javascript:checkdelNeighbor(${neighborlist.neighborid},${neighborlist.neighborno})">삭제</a>
</div>
</c:forEach>
</c:otherwise>
</c:choose>
<br>

</div>
</div>
</c:if>


<c:if test="${mode=='board'}">
<div align="center">
<h1>게시판 관리</h1><br>
*게시판은 각 사이드바에 속하며 사이드바가 없는 레이아웃을 선택시,<br> 게시판이 보이지 않을 수 있습니다.
<div align="right">
<a href="makeBoardTitle">게시판 추가</a>
</div>
<div>
<table border="1" width="500px" >
	<tr align="center">
		<td width="250px">사이드바1</td>
		<td width="250px">사이드바2</td>
	</tr>
	<tr align="center">
		<c:choose>
		<c:when test="${list.size()==0}">
		<td colspan="2" align="center">
			게시판이 없습니다
		</td>
		</c:when>
		<c:otherwise>
		<td>
		<c:forEach var="dto" items="${list}">
		<c:if test="${dto.sideno % 2 == 1}">
		${dto.title}&nbsp;&nbsp;&nbsp;<a href="editBoardTitle?boardno=${dto.boardno}">수정</a>&nbsp;|&nbsp;<a href="deleteBoardTitle?boardno=${dto.boardno}">삭제</a><br>
		</c:if>
		</c:forEach>
		</td>
		<td>
		<c:forEach var="dto" items="${list}">
		<c:if test="${dto.sideno % 2 == 0}">
		${dto.title}&nbsp;&nbsp;&nbsp;<a href="editBoardTitle?boardno=${dto.boardno}">수정</a>&nbsp;|&nbsp;<a href="deleteBoardTitle?boardno=${dto.boardno}">삭제</a><br>
		</c:if>
		</c:forEach>
		</td> 
		</c:otherwise>
		</c:choose>
	</tr>	
</table>
</div>
</div>
</c:if>
</form>
		</td>
	</tr>
</table>
</body>
</html>
<script type="text/javascript" charset="utf-8">
function checkdelNeighbor(id,neighborno){
	 var isAdd = window.confirm(id+"님을 이웃에서 삭제하시겠습니끼?")
	 if(isAdd){
		 location.href="deleteNeighbor?neighborno="+neighborno
	 }
}
</script>