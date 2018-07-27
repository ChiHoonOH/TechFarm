<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ include file="top.jsp"%> 
<div class="rdiv"> <!-- start of 2-2 -->
<h2>검색결과</h2>
<table>
<c:forEach var="searchVideo" items="${search_result}">
<tr>
<td width="300" height="200">

<c:if test="${search_result.size()==0}">
해당 검색 결과가 존재 하지 않습니다.
</c:if>
<div style="float:left">
<a href="tftube_videoView?no=${searchVideo.no}">
<img src="resources/tftube/Image/${searchVideo.image}" 
width="300" height="200"></a>
</div>

<td width="300" height="200">
${searchVideo.title}<br>
<a href="tftube_mychannel?mem_no=${searchVideo.member_no}">${searchVideo.channel}</a><br><!-- probability of not working -->
<fmt:formatNumber value="${searchVideo.readcount}" pattern="#,##0"/>회<br>
${searchVideo.description}
</td>



<%-- <a href="tftube_searchVideo_delete?recent_no=${searchVideo.recent_no}">삭제</a> --%>



</td>
</tr>
</c:forEach>
</table>
</div>
<%@ include file="bottom.jsp"%> 