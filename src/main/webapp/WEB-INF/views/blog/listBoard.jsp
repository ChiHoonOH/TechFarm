<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<td height="700px" width="60%" valign="top" align="center">
			<hr width="95%">
			<div id="boardList">
			<div align="left">
				<h2>${title}</h2><br>
			</div>
			<c:if test="${optionDTO.id.equals(sessionScope.memberDTO.id)}">
			<div align="right">	
				<img src="resources/images/write.jpg" onclick="location.href='insertBoard?boardno=${boardno}&id=${optionDTO.id}&title=${title}'" style="cursor:pointer;">&nbsp;&nbsp;<br>
			</div></c:if><br>
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
						<c:forEach var="listBoard" items="${listBoard}">
						<tr id="list">
						<td width="50%" class="boardlist"><a href="viewBoard?no=${listBoard.no}">${listBoard.subject}</a></td>
						<td width="15%" class="boardlist">${optionDTO.nickname}(${listBoard.id})</td>		
						<td width="10%" class="boardlist"><img src="resources/images/reply.jpg">&nbsp;${listBoard.reply} &nbsp;&nbsp;&nbsp;  <img src="resources/images/view.jpg">&nbsp;${listBoard.readcount}  </td>
						<td width="15%" class="boardlist">${listBoard.reg_date}</td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						<c:if test="${listBoard.size()>0}">
						<tr>
							<td align="center" colspan="4">
							<c:if test="${startPage > pageBlock}">
							[<a href="listBoard?pageNum=${startPage-pageBlock}&boardno=${boardno}&title=${title}">이전</a>]
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
							[<a href="listBoard?pageNum=${i}&boardno=${boardno}&title=${title}">${i}</a>]
							</c:forEach>
							<c:if test="${endPage < pageCount}">
							[<a href="listBoard?pageNum=${startPage+pageBlock}&boardno=${boardno}&title=${title}">다음</a>]
							</c:if>
							</td>
						</tr>
						<tr>
							<td align="right" colspan="4">
							<form action="searchboard" name="search">
							<select name="search_option">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							</select>
							<input type="text" name="search_text">
							<input type="button" value="검색" onclick="javascript:checksearch();">
							</form>
							</td>
						</tr>
						</c:if>
					</table>			
				</div>
			</div>
</td>		
<script>
		function checksearch(){
	    	if(search.search_text.value==""){
	    		alert("검색어를 입력해주세요")
	    		search.search_text.focus()
	    		return
	    	}
	    	document.search.submit()
		}     
</script>