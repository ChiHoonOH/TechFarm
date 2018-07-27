<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
	<div class="left">
		<div class="left_content1">
			<div align="center">
				<form method="post" action="editContact" enctype="multipart/form-data">
				<input type="hidden" name="no" value="${dto.no }">
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
						<td colspan="2">Name : <input type="text" name = "name" value="${dto.name }" class="jjm494_input"></td>
					</tr>
					<tr>
						<td colspan="3"><input type="file" name="photoMultipart"></td>
					</tr>
					<tr>
						<th><img src="resources/contacts/images/company.png" style="max-width: 30px; height: auto;"></th>
						<td>Compnay : <input type="text" name="company" value="${dto.company }" class="jjm494_input"></td>
						<td>Jobtitle : <input type="text" name="jobtitle" value="${dto.jobtitle }" class="jjm494_input"></td>
					</tr>
					<tr>
						<th><img src="resources/contacts/images/email.png" style="max-width: 30px; height: auto;"></th>
						<td colspan="2">Email : <input type="email" name="email" value="${dto.email }" class="jjm494_input"></td>
					</tr>
					<tr>
						<th><img src="resources/contacts/images/phone.png" style="max-width: 30px; height: auto;"></th>
						<td colspan="2">Phone :  <input type="text" name="phone" value="${dto.phone }" class="jjm494_input"></td>
					</tr>
					<tr>
						<th><img src="resources/contacts/images/notes.png" style="max-width: 30px; height: auto;"></th>
						<td colspan="2">Notes : <input type="text" name="notes" value="${dto.notes }" class="jjm494_input"></td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="submit" value="확인">
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	 
<%@ include file="footer.jsp" %>