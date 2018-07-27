<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">		
<%@ include file="editBlogTop.jsp"%>
		<td valign="top">
		<form action="makeBoardTitle" method="post">
		<select name="sideno">
		<option value="1" selected>사이드바1</option>
		<option value="2">사이드바2</option>
		</select>
		<input type="text" name="title">
		<input type="hidden" name="id" value="${optionDTO.id}">
		<input type="hidden" name="mode" value="${mode}">
		<input type="submit" value="추가">
		</form>
		</td>
	</tr>
</table>			
</body>
</html>