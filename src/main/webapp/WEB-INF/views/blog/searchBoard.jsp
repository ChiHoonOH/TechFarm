<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<td height="700px" width="60%" valign="top" align="center">
			<hr width="95%">
			<div id="boardList">
			<div align="left">
				<h2>'${search_option}'에서 '${search_text}' 검색</h2><br>
			</div>
			<br>
				<div>
					<table class="listBoard">
						<c:choose>
						<c:when test="${searchlist.size()==0}">
						<tr>
						<td>
						검색 결과가 없습니다.
						</td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="searchlist" items="${searchlist}">
						<tr id="list">
						<td width="50%" class="boardlist"><a href="viewBoard?no=${searchlist.no}">${searchlist.subject}</a></td>
						<td width="15%" class="boardlist">${optionDTO.nickname}(${searchlist.id})</td>		
						<td width="10%" class="boardlist"><img src="resources/images/reply.jpg">&nbsp;${searchlist.reply} &nbsp;&nbsp;&nbsp;  <img src="resources/images/view.jpg">&nbsp;${searchlist.readcount}  </td>
						<td width="15%" class="boardlist">${searchlist.reg_date}</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						<c:if test="${searchlist.size()>0}">
						<tr>
							<td align="right" colspan="4">
							<form action="searchboard">
							<select name="search_option">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							</select>
							<input type="text" name="search_text">
							<input type="submit" value="검색">
							</form>
							</td>
						</tr>
						</c:if>
					</table>			
				</div>
			</div>
</td>