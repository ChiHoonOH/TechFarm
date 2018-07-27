<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<meta charset="UTF-8">
<%@ include file="header.jsp"%>
<section>
	<article>
	<div align="center">
	<font size="5">${search_option}의 ${search_text}값을 검색</font>
	</div>
	<c:choose>
	<c:when test="${searchlist.size()==0}">
	<table>
		<tr>
			<th class="menu" id="hotblogheader" colspan="2">
			검색된 블로그가 없습니다.
			</th>
		</tr>
	</table>
	</c:when>
	<c:otherwise>
	<table align="center">
		<tr>
	<c:forEach var="searchlist" items="${searchlist}">
			<td class="searchlist" width="500px" height="500px">
			<div class="searchlistdiv" width="500px" height="500px">
	<table>
		<tr>
			<th class="menu" colspan="2" background="resources/upload/${searchlist.id}/${searchlist.header}" id="hotblogheader" width="450px" height="300">
			<p align="right" class="hotblogheaderword">
			<a href="myBlog?id=${searchlist.id}" class="deconone"><font color="white">${searchlist.headerword}</font></a>
			</p>
			</th>
		</tr>
		<tr>
			<td align="right">
				<img src="resources/upload/${searchlist.id}/${searchlist.profile}"  width="50" height="50" class="homemenu"/>
			</td>
			<td align="left" width="450px"><font size="5">${searchlist.id}</font><font size="3" color="gray"> (${searchlist.blogname})</font></td>
		</tr>
	</table>
			</div>
			</td>
	</c:forEach>
		</tr>
	</table>
	</c:otherwise>
	</c:choose>
	</article>  
</section>
<%@ include file="aside.jsp"%>
</body>
</html>