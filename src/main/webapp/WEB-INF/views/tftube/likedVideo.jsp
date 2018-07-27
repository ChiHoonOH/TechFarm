<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="top.jsp"%>

<link rel="stylesheet" type="text/css" href="resources/tftube/style.css">

<div class="rdiv"> <!-- start of 2-2-1 -->
<h2>관심 동영상</h2>
<c:choose>
<c:when test="${like_all_list.size()==0}">
관심 목록이 없습니다.
</c:when>
<c:otherwise>
<table>
<c:forEach var="likeList" items="${like_all_list}">
<tr><td width="300" height="200">
<div id="like-one-line">

<!-- <div style="float:left">start of 2-2-1 -->
<a href="tftube_videoView?no=${likeList.no}">
<img src="resources/tftube/Image/${likeList.image}" 
width="300" height="200"></a>
<!-- </div> --></td>

<td width="300" height="200">
<div style="overflow:hidden"><!-- start of 2-2-2 -->
<a href="tftube_videoView?no=${likeList.no}">${likeList.title}</a><br>
<a href="tftube_mychannel">${likeList.channel}</a><br>
${likeList.description}				
<div style="float:right">
<a href="likedVideo_delete?no=${likeList.no}">삭제</a>
</div>


</div><!-- end of like one line -->
</td></tr>
</c:forEach>
</table>
</c:otherwise>
</c:choose>
</div>
</div>
<%@ include file="bottom.jsp"%> 

