<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<script src="resources/js/jquery-1.9.0.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$(".reply_area").hide();
	
	$("a.not_login").click(function(){
	alert("로그인이 필요한 서비스 입니다. 로그인 페이지로 이동합니다.");//씹힘
	location.href="login";
	});
	
	 $("a.reply_button").click(function(){	
	/* $("a").siblings().children().hide(); */
	 $(this).siblings().show('fast');	
	});	
	
	$(".cancel").click(function(){ 		
		$("a#reply").hide();		
	});	
});
</script>
<meta charset="UTF-8">
<table>
<tr><td>댓글 ${r_size}개</td></tr>
<c:choose>
<c:when test="${memberDTO==null}">
<tr><td>로그인이 필요한 서비스 입니다. <a href="login">로그인</a>을 해주세요.</td></tr>
</c:when>
<c:otherwise>
<tr><td>
<form name="f1" method="post" action="tftube_reply_insert">
<textArea name="content"></textArea>
<input type="hidden" name="video_name" value="${vdto.video_name}">
<input type="hidden" name="no" value="${vdto.no}">
<input type="hidden" name="mode" value="general">
<input type="submit" value="입력">
</form>
</td></tr>
</c:otherwise></c:choose>

</table>


<div>
<!-- Reply list -->
<table>
<c:forEach var="rdto" items="${r_list}">
<tr>
<td>
<!-- empty space in front of reply_reply -->
<c:if test="${rdto.re_level==1}">
<div class = "imaj"><!-- float -->
<img src="resources/tftube/imgs/vaccum.JPG" width="60" height="60" style="border-style: none;">
</div>
</c:if>

<!-- re_reply -->
<form name="f2" method="post" action="tftube_reply_insert">
<!-- reply contents with reply information -->

<div class = "titl"><!--empty space securement-->
<a href="tftube_mychannel?mem_no=${rdto.member_no}">${rdto.channel}</a>  ${rdto.reg_date}<br> 

${rdto.content}<br>

<input type="hidden" name="re_step" value="${rdto.re_step}"/>

<c:choose>
<c:when test="${memberDTO==null}">
<a class="not_login" onmouseover="" style="cursor: pointer;">답글</a><br>
</c:when>
<c:otherwise>
<a class="reply_button" onmouseover="답글" style="cursor: pointer;">답글</a>

<c:if test="${rdto.member_no eq memberDTO.no}"> 				<a href="tftube_reply_delete?no=${vdto.no}&re_step=${rdto.re_step}&re_level=${rdto.re_level}&r_no=${rdto.no}"><%-- ${paramScope.rdto} --%>삭제</a> <br></c:if><br>


<a id="reply" class="reply_area">

<textArea name="content_reply"><c:if test="${rdto.re_level==1&&rdto.member_no!=memberDTO.no}">+${rdto.channel}</c:if></textArea>

<input type="hidden" name="video_name" value="${vdto.video_name}">
<input type="hidden" name="mode" value="deep">
<input type="submit" value="입력">
<input class="cancel" type="button" value="취소">
</a>
</div>

</c:otherwise>
</c:choose>
</form>
<!--답글이 존재한다면 답글:답글갯수 -->
</tr>

</c:forEach>
</table>
</div>
<!-- end of Reply List -->

