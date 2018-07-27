<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
	<div class="left">
		<div class="left_content1">
			<div align="center">
	
	
		<form method="post" action="addContact" enctype="multipart/form-data">

		<table class="jjm494">
			<tr>
				<th><img src="resources/home/imgs/account.png" style="max-width: 60px; height: auto;"></th>
				<td colspan="2">Name : <input type="text" name = "name" placeholder="Name" class="jjm494_input"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="file" name="photoMultipart"></td>
			</tr>
			<tr>
				<th><img src="resources/contacts/images/company.png" style="max-width: 30px; height: auto;"></th>
				<td>Company : <input type="text" name="company" placeholder="Company" class="jjm494_input"></td>
				<td>Jobtitle : <input type="text" name="jobtitle" placeholder="Jobtitle" class="jjm494_input"></td>
			</tr>
			<tr>
				<th><img src="resources/contacts/images/email.png" style="max-width: 30px; height: auto;"></th>
				<td colspan="2">Email : <input type="email" name="email" placeholder="Email" class="jjm494_input"></td>
			</tr>
			<tr>
				<th><img src="resources/contacts/images/phone.png" style="max-width: 30px; height: auto;"></th>
				<td colspan="2">Phone :  <input type="text" name="phone" placeholder="Phone" class="jjm494_input"></td>
			</tr>
			<tr>
				<th><img src="resources/contacts/images/notes.png" style="max-width: 30px; height: auto;"></th>
				<td colspan="2">Notes : <input type="text" name="notes" placeholder="Notes" class="jjm494_input"></td>
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