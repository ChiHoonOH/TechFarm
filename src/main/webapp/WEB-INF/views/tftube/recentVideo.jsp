<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%> 
<meta charset="UTF-8">
<script type="text/javascript">
function delete_recent(){
	location.href="tftube_recentvideo_delete";
};
</script>
</head>
<div class="rdiv"> <!-- start of 2-2 -->
<h2>최근 본 동영상</h2>
<c:choose>
<c:when test="${recent_list.size()==0}">
시청한 동영상이 없습니다.
</c:when>
<c:otherwise>
<a href="tftube_recentvideo_delete_all"><button>모두지우기</button></a>
<table>
<c:forEach var="recentVideo" items="${recent_list}">
<tr>
<td>
<!-- <div style="float:left"> -->
<a href="tftube_videoView?no=${recentVideo.no}">
<img src="resources/tftube/Image/${recentVideo.image}" 
width="300" height="200"></a>
<!-- </div> -->
<td>
<!-- <div style="overflow:hidden" class="wider_spacing"> -->
${recentVideo.title}<br>
<a href="tftube_mychannel?mem_no=${recentVideo.member_no}">${recentVideo.channel}</a><br><!-- probability of not working -->
<fmt:formatNumber value="${recentVideo.readcount}" pattern="#,##0"/>회<br>
${recentVideo.description}
<!-- </div> -->

<div style="float:right">

<a href="tftube_recentvideo_delete?recent_no=${recentVideo.recent_no}">삭제</a>

</div>
</td>
</tr>
</c:forEach>
</table>
</c:otherwise>
</c:choose>
</div>
<%@ include file="bottom.jsp"%> 

