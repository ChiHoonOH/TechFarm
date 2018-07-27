<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
	<div class="left">
		<div class="left_content1">
			<div align="center">
		
				<h1 align="center">메일내용</h1>
		
				<a href="listJames?folder=INBOX">받은편지함</a>
				<!-- 
				<a href="listJames?folder=Sent">보낸편지함</a>
				<a href="listJames?folder=Trash">휴지통</a>
				 -->
				<p>
				<!-- 
				<c:if test="${!empty dto.photo }">
					<img src="resources/contacts/upload/${dto.photo }" style="max-width: 30px; height: auto;">
				</c:if>
				<c:if test="${empty dto.photo }" >
					<img src="resources/contacts/images/account.png" style="max-width: 30px; height: auto;">
				</c:if>
				 -->
				<table class="jjm494">
					<tr>
						<th>From:</th><td>${jamesDTO.from }</td>
						<th>Subject:</th><td>${jamesDTO.subject }</td>
						<th>Date:</th><td>${jamesDTO.sentDate }</td>
					</tr>
				</table>
				</p> 
				<div id="contents" align="left" style="margin: 30px">
					${jamesDTO.content }
				</div>
		
			</div>
		</div>
	</div>
	 
<%@ include file="footer.jsp" %>