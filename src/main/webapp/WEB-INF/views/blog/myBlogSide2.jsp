<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<td rowspan="3"  height="100%" width="20%" valign="top" align="center" class="sidebar2">
			<div id="sidebar2">
				<div id="board">
					<div align="right">
					<c:if test="${optionDTO.id.equals(sessionScope.memberDTO.id)}">
					<a href="editBlog?mode=board&id=${optionDTO.id}">게시판 관리</a>&nbsp;&nbsp;<br><br>
					</c:if>
					</div>
					<c:forEach var="dto" items="${list}">
					<c:if test="${dto.sideno % 2 == 0}">
					<a href="listBoard?boardno=${dto.boardno}&title=${dto.title}">${dto.title}</a><br><br>
					</c:if>
					</c:forEach>
				</div>
			</div>  <!-- sidebar2 div end -->
			</td>