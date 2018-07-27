<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
	<div class="left">
		<div class="left_content1">
			<div align="center">
				<table class="jjm494">
					<c:choose>
						<c:when test="${listContacts.size()==0 }">
							<b>등록된 연락처가 없습니다.</b>
						</c:when>
						<c:otherwise>
							<c:forEach var = "dto" items="${listContacts }">
								<tr>
									<th><input type="checkbox" name="chk_contact" value="${dto.no }"></td>
									<th><a href="getContact?no=${dto.no }">
										<c:if test="${!empty dto.photo }">
											<img src="resources/contacts/upload/${dto.photo }" style="max-width: 30px; height: auto;">
										</c:if>
										<c:if test="${empty dto.photo }" >
											<img src="resources/contacts/images/account.png" style="max-width: 30px; height: auto;">
										</c:if>
										</a>
									</th>
									<td align="center"><a href="getContact?no=${dto.no }">${dto.name }</a></td>
									<td align="center"><a href="sendJames?to=${dto.email }">${dto.email }</a></td>
									<td align="center">${dto.phone }</td>
									<th><span data-tooltip-text="연락처 수정"><a href="editContact?no=${dto.no }"><img src="resources/contacts/images/edit.png" style="max-width: 20px; height: auto;"></a></span></td>
									<th><span data-tooltip-text="연락처 삭제"><a href="javascript:onClick=confirmDel('${dto.no }')"><img src="resources/contacts/images/delete.png" style="max-width: 20px; height: auto;"></a></span></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				
			</div>
		</div>
	</div>
	 
<%@ include file="footer.jsp" %>