<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html>
<!-- video -->
<div id="2-2" class="rdiv" style="overflow:auto;"> <!-- start of 2-2 -->

<table>
<tr><td colspan="2"><video src="resources/tftube/Video/${vdto.video_name}" autoplay  
controls="controls" width="700" height="450"></video>
</td></tr>
</table>

<table>

<tr><td width="550"><font size="10" style="font-weight: bold;">${vdto.title}</font><br></td></tr>
<tr><td>작성자:<a href="tftube_mychannel?mem_no=${vdto.member_no}">${vdto.channel}</a> </td></tr>
<tr>
<td align="left"><%@include file="videoView_subscribe.jsp" %>
<td align="right">조회수:${readcount}회
</tr>
<tr><td align="left">
<c:if test="${vdto.member_no eq memberDTO.no}">
<a href="tftube_video_edit?no=${vdto.no}">정보수정</a> <a href="tftube_video_delete?no=${vdto.no}">삭제</a>
</c:if></td>
<td align="right"><%@include file="videoView_like.jsp" %> </td>
</table>

<br>

<!-- information -->
<div id="information"> 
  게시일:${vdto.uploaddate.substring(0,10)}<p>	
 ${vdto.description}<p> 
</div>
 <%@include file="videoView_reply.jsp"%>
 
 
 </div><!-- end of 2-2-->
 
 </div> <!-- end of 2 -->


<style>
#like_disabled{
   background-color: #D5D5D5;
   border: none;
   color: white;
   padding: 15px 32px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;   
}
#unlike_disabled{
   background-color: #D5D5D5;
   border: none;
   color: white;
   padding: 15px 32px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;   
}

#like{
background-color: #6799FF;
   border: none;
   color: white;
   padding: 15px 32px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
} 
#unlike{
background-color: #6799FF;
   border: none;
   color: white;
   padding: 15px 32px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
} 
</style>
<%@ include file="bottom.jsp"%>