<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
	<div class="left">
		<div class="left_content1">
			<div align="center">
			
		<!-- 	
		<h1 align="center" style="color:#b0b0e2;">메일 보내기</h1>
		 -->
		<form action="sendJames" method="post" enctype="multipart/form-data">
		<table class="jjm494">
			<tr>
				<th>받는 사람</th>
				<td><input type="email" name="to" value="${to }" placeholder="상대의 이메일" size="85%" style="height:30px;"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" placeholder="제목을 입력해주세요" size="85%" style="height:30px;"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="text" cols="100" rows="12" placeholder="내용을 입력해주세요" ></textarea>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="sendFile" multiple></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="보내기" >
      				<input type="reset" value="취소">
				</td>
			</tr>
      	</table>
  		</form>


			</div>
		</div>
	</div>
	 
<%@ include file="footer.jsp" %>