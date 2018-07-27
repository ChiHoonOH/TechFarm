<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%@include file="top.jsp" %>
<!-- <html lang="en"> -->

<meta charset="UTF-8">

<div id="2-2-1" class="rdiv">
<form name="f" method="post" action="tftube_video_edit">

<table>
<tr><td>제목: <input type="text" name="title" id="title" >
<font color="red"><p id="title_check"></p></font></td></tr>
<tr><td>설명: <input type="text" name="description" id="description">
<font color="red"><p id="description_check"></p></font></td></tr>

<tr><td>카테고리 
<select name="category">
<option value="movie" selected>영화</option>
<option value="animation">애니메이션</option>
<option value="car">자동차</option>
<option value="music">음악</option>
<option value="animal">동물</option>
<option value="sports">스포츠</option>
<option value="travel/event">여행/이벤트</option>
<option value="game">게임</option>
<option value="blog/person">블로그/인물</option>
<option value="comedy">코미디</option>
<option value="entertainment">엔터테인먼트</option>
<option value="news/politics">뉴스/정치</option>
<option value="nohow/style">노하우/스타일</option>
<option value="education">교육</option>
<option value="technology">과학기술</option>
<option value="none_profit/social_movement">비영리/사회운동</option>
</select></td></tr>

<tr><td>공개범위 
<select name="open">
<option value="t" selected>공개</option>
<option value="f">비공개</option>
</select></td></tr>

<tr><td><input type="hidden" name="no" value="${no}">
<input type="button" onClick="check_file_update()" value="전송">
<input type="reset" value="취소"></td></tr>
</table>
</form> 
</div>
<script>
function check_file_update(){			
	var title=document.getElementById("title").value;
	var description=document.getElementById("description").value;
	/* alert(image); alert(video); */
	if(title==""){		
		title_check.innerHTML = '제목을 입력해주세요.'; 	
	}else{
		title_check.innerHTML ="";		
	}	
	
	if(description==""){			
		description_check.innerHTML = '내용을 입력해주세요.'; 	
	}else{
		description_check.innerHTML ="";
		
	}
	
	if(title==""||description==""){			
		return;
	}else{		
		document.f.submit();
	}
};

</script>
<%@include file="bottom.jsp" %>


