<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
<%@ include file="editBlogTop.jsp"%>
		<td valign="top">
		<form action="editBoardTitle" method="post">
		<c:choose>
		<c:when test="${makeBoardDTO.sideno == 1}">
			<select name="sideno">
			<option value="1" selected>사이드바1</option>
			<option value="2">사이드바2</option>
			</select>
		</c:when>
		<c:otherwise>
			<select name="sideno">
			<option value="1">사이드바1</option>
			<option value="2" selected>사이드바2</option>
			</select>
		</c:otherwise>
		</c:choose>
		<input type="text" name="title" value="${makeBoardDTO.title}">
		<input type="hidden" name="boardno" value="${makeBoardDTO.boardno}">
		<input type="submit" value="수정">
		</form>
		</td>
	</tr>
</table>			
</body>
</html>