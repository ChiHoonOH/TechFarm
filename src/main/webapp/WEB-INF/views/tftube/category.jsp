<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="top.jsp"%>

<div class="rdiv">
<h2>${category}</h2>
<table>
<tr>
<c:choose>
<c:when test="${clist.size()==0}">
해당 카테고리의 영상이 존재하지 않습니다.
</c:when>
<c:otherwise>
<c:forEach var="cdto" items="${clist}"> 
<td width="196" height="200">
<a href="tftube_videoView?no=${cdto.no}">
<img src="resources/tftube/Image/${cdto.image}" width="196" height="100"><br>
${cdto.title}</a><br>
<a href="tftube_mychannel">${cdto.channel}</a><br>
${cdto.readcount}회  * ${cdto.uploaddate}
</td>
<c:set var="count" value="${count=count+1}"/>
</c:forEach>
</c:otherwise></c:choose>
<c:if test="${count%6==0}">
</tr><tr>
</c:if>
</tr>
</table>
</div>

<%@include file="bottom.jsp"%>