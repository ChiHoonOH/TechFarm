<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- 상단 부분 -->
<!--content -->
	<div id="content">

	<div align="center">
	<table class="jjm494">
		<tr>
			<th scope="row" align="center">
				${dto.title}
			</th>
		</tr>
		<tr>
			<td>
				<textarea name="content" onKeyUp="chkContent(this, 4000)" rows="10" cols="50">${dto.content}</textarea>
			</td>
		</tr>
		<tr>
			<td align="center">
				<a href="note_update?num=${dto.num}">수정</a>
				<a href="note_delete?num=${dto.num}&id=${dto.id}">삭제</a>
			</td>
		</tr>
	</table>
	</div>

	</div>
<!--//content -->
<!-- 하단 부분 -->
<%@include file="../footer.jsp"%>