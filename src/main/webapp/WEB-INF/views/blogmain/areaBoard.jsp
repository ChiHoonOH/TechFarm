<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<meta charset="UTF-8">
<%@ include file="header.jsp"%>
<section>
	<article>
	<table>
		<tr>
			<td valign="top" align="center"><h2>${areamode}게시판 >> </h2></td>
			<td class="tdspace" align="center">
				<table class="topbox" width="900px"  height="500px">
				<c:choose>
				<c:when test="${arealist.size()==0}">
					<tr>
						<th class="top" height="70px" colspan="4"><h2>등록된 게시글이 없습니다. 지금 등록 해보세요.</h2></th>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
					<th class="top" height="70px"><h2>작성자</h2></th>
					<th class="top" ><h2>글제목</h2></th>
					<th class="top" ><h2>게시판</h2></th>
					<th class="top" ><h2>작성일</h2></th>
					</tr>	
					<c:forEach var="arealist" items="${arealist}" varStatus="status">
					<tr>
					<th class="top2" height="70px"><font size="4 ">${arealist.id}</font></th>
					<th class="top2"><a href="viewBoard?no=${arealist.no}&joinmode=arealist" class="deconone"><font size="4 ">${arealist.subject}</font></a></th>
					<th class="top2">(${arealist.title})</th>
					<td class="top2" align="center">${arealist.reg_date}</td>
					</tr>
					</c:forEach>
					<tr>
							<td align="center" colspan="4">
							<c:if test="${startPage > pageBlock}">
							[<a href="areasearch?pageNum=${startPage-pageBlock}&bigarea=${bigarea}&areamode=${areamode}">이전</a>]
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
							[<a href="areasearch?pageNum=${i}&bigarea=${bigarea}&areamode=${areamode}">${i}</a>]
							</c:forEach>
							<c:if test="${endPage < pageCount}">
							[<a href="areasearch?pageNum=${startPage+pageBlock}&bigarea=${bigarea}&areamode=${areamode}">다음</a>]
							</c:if>
							</td>
					</tr>
				</c:otherwise>	
				</c:choose>
				</table>
			</td>
		</tr>
	</table>
	</article>  
</section>
<%@ include file="aside.jsp"%>
<%@ include file="footer.jsp"%>