<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<section>
	<article>
		<h1>블로그 만들기<img src="resources/images/3step.jpg" align="right" width="250" height="100"></h1>
		<h2>3단계:블로그 꾸미기</h2>
		<form action="blogMakePro" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="blogname" value="${blogname}">
		<input type="hidden" name="nickname" value="${nickname}">
		<input type="hidden" name="introduce" value="${introduce}">
		<input type="hidden" name="layout" value="${layout}">
		<input type="hidden" name="id" value="${sessionScope.memberDTO.id}">
		<input type="hidden" name="headerword" value="${headerword}">
			<table width="1000px" height="500px" align="center" class="makeblog">
				<tr>
					<th>스킨</th>
					<td width="75%">
					<br>
					<div align="center">
					<table width="100%">
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
					</td>
					<td><font size="4">마음에 드는<br> 스킨으로<br> 블로그를<br> 꾸며보세요</font></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><hr size="1">
					<input type="submit" value="만들기">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
					</td>
				</tr>				
			</table>
		</form>	
	</article>  
</section>
<%@ include file="aside.jsp"%>
</body>
</html>