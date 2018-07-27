<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
	<div class="left">
		<div class="left_content1">
			<div align="center">
			<span data-tooltip-text="연락처 수정"><a href="editContact?no=${dto.no }"><img src="resources/contacts/images/edit.png" style="max-width: 30px; height: auto;"></a></span>&nbsp
			<span data-tooltip-text="연락처 삭제"><a href="deleteContact?no=${dto.no }"><img src="resources/contacts/images/delete.png" style="max-width: 30px; height: auto;"></a></span>
		<table class="jjm494">
				<tr>
					<th>
						<c:if test="${!empty dto.photo }">
							<img src="resources/contacts/upload/${dto.photo }" style="max-width: 60px; height: auto;">
						</c:if>
						<c:if test="${empty dto.photo }" >
							<img src="resources/contacts/images/account.png" style="max-width: 60px; height: auto;">
						</c:if>	
					</th>
					<td><h2>${dto.name }</h2>
				</tr>
				<tr>
					<td colspan="2" align="left"><h3>연락처 세부정보</h3></td>
				</tr>
				<tr>
					<th><img src="resources/contacts/images/company.png" style="max-width: 30px; height: auto;"></th>
					<td>${dto.company } / ${dto.jobtitle }</td>
				</tr>
				<tr>
					<th><img src="resources/contacts/images/email.png" style="max-width: 30px; height: auto;"></th>
					<td><a href="sendJames?to=${dto.email }">${dto.email }</a></td>
				</tr>
				<tr>
					<th><img src="resources/contacts/images/phone.png" style="max-width: 30px; height: auto;"></th>
					<td>${dto.phone }</td>
				</tr>
				<tr>
					<th><img src="resources/contacts/images/notes.png" style="max-width: 30px; height: auto;"></th>
					<td>${dto.notes }</td>
				</tr>
		</table>
	
	
	
			</div>
		</div>
	</div>
	 
<%@ include file="footer.jsp" %>