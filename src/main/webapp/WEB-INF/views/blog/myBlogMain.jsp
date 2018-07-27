<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<td height="700px" width="60%" valign="top" align="center">
			<div id="main">
			<br><h2>최근 게시글</h2>
			<c:choose>
			<c:when test="${myboardlist.size()==0}">
			<div align="center"><h2>아직 작성된 글이 없습니다. 
			<c:if test="${optionDTO.id.equals(sessionScope.memberDTO.id)}">
				<a href="editBlog?mode=board&id=${optionDTO.id}">'게시판 관리'</a>에서 게시판을 만들어 보세요.
			</c:if></h2></div>
			</c:when>
			<c:otherwise>
			<c:forEach var="myboardlist" items="${myboardlist}">
			<br><br>
			<table class="myblogmain">
				<tr>
					<th width="500px" height="30px" class="myblogmanintd"><font size="4"><a href="viewBoard?no=${myboardlist.no}">${myboardlist.subject}</a></font></th>
					<th width="300px" class="myblogmanintd">${myboardlist.id}</th>
					<th width="200px" class="myblogmanintd">${myboardlist.reg_date}</th>
				</tr>
			</table>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</div>
</td>		