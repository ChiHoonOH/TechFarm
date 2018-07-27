<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<td height="700px" width="60%" valign="top" align="center">
			<hr width="95%">
			<div id="boardList">
			<div align="left">
				<h2>임시보관함</h2><br>
			</div>
			<br>
				<div>
					<table class="listBoard">
						<c:choose>
						<c:when test="${listBoard.size()==0}">
						<tr>
						<td>
						게시글이 없습니다. 지금 작성 해보세요.
						</td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="imsilist" items="${imsilist}">
						<tr id="list">
						<td width="50%" class="boardlist"><a href="viewBoard?no=${imsilist.no}">${imsilist.subject}</a></td>
						<td width="15%" class="boardlist">${optionDTO.nickname}(${imsilist.id})</td>		
						<td width="10%" class="boardlist"><img src="resources/images/reply.jpg">&nbsp;${imsilist.reply} &nbsp;&nbsp;&nbsp;  <img src="resources/images/view.jpg">&nbsp;${imsilist.readcount}  </td>
						<td width="15%" class="boardlist">${imsilist.reg_date}</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</table>			
				</div>
			</div>
</td>		
