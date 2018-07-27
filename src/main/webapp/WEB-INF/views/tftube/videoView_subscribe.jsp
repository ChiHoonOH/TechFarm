<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<script src="resources/js/jquery-1.9.0.js"></script>
<script type="text/javascript">
var subing_member_no=${vdto.member_no}//비디오 작성자-무조건 있다

var subing_status=${subing_status}

function subing(){
	location.href="tftube_videoView?subing_status=0&no="+${vdto.no};	
}

function subing_disabled(){
	location.href="tftube_videoView?subing_status=1&no="+${vdto.no};	
}  

function move_login(){
	alert("로그인이 필요한 서비스입니다. 로그인을 해주세요.");
	location.href="login";
}

$(function(){
	switch(subing_status){	
	case 0:$("#sub").hide();$("#sub_disabled").show();break;	
	case 1:$("#sub_disabled").hide();$("#sub").show();break;	
	default: $("#sub_disabled").hide();$("#sub").hide();break;
	}
});


</script>
<c:if test="${vdto.member_no ne memberDTO.no}"> 
<button id="sub_disabled" onclick="subing_disabled()">구독</button>
<button id="sub" onclick="subing()">구독중</button>
</c:if>
