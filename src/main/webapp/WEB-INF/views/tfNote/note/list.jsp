<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- 상단 부분 -->
<!--content -->
	<div id="content">
		
	<div align="center">
	<h1>메모작성</h1>
	<form name="frm" method="post" action="note_insert" onsubmit="return chkTitle();">		
		<table class="jjm494">			
			<tr>
				<td>
					<div style="border:1px solid; padding:10px; width:90%;  word-break:break-all;flex:1;margin-left:5px; margin-right:5px;">
						<p>제목 : <input type="text"></p><br>
						<p><textarea name="content" onKeyUp="chkContent(this, 4000)" rows="5" style="width:100%; height:100%;"></textarea></p>
					</div>
				</td>
			</tr>	
			<tr>
				<td align="center">
					<input type="text" name="cbyte" value="0" size="3" readOnly>/4,000Byte
				</td>
			</tr>						
			<tr>
				<td colspan="2" align="center">
					<!-- 히든으로 넘어갈 정보들 -->
						<input type="hidden" value="${sessionScope.memberDTO.id}" name="id"/>
					<!-- 히든으로 넘어갈 정보들 -->
				    <a href="#" onclick="document.getElementById('from').submit();">
				    	<img src="resources/tfNote/plus.jpg" style="width:15px; height:15px; margin-left:10px;">
				    </a>					
				</td>
			</tr>
		</table>
	</form>
	</div>

	<c:if test="${noteList.size()==0}">
		<h2>작성된 메모가 없습니다.</h2>
	</c:if>
	<div style="display:flex;">
		<c:forEach var="dto" items="${noteList}">
			<div style="border:1px solid; padding:10px; width:200px;  word-break:break-all;flex:1;margin-left:5px; margin-right:5px;">
				<div align="right">
					<a href="note_update?num=${dto.num}">수정</a>
					<a href="note_delete?num=${dto.num}&id=${dto.id}">
						<img src="resources/tfNote/close.JPG" style="width:15px; height:15px; margin-left:10px;">
					</a>
				</div>
				<p>제목 : <input type="text" value="${dto.title}"></p><br>
				<p><textarea name="content" onKeyUp="chkContent(this, 4000)" rows="5" style="width:100%; height:100%;">${dto.content}</textarea></p>
			</div>
		</c:forEach>
	</div>


	</div>
<!--//content -->
<!-- 하단 부분 -->
<%@include file="../footer.jsp"%>
