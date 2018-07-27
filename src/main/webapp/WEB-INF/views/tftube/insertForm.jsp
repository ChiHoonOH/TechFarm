<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%@include file="top.jsp" %>
<!-- <html lang="en"> -->

<meta charset="UTF-8">

<div id="2-2-1" class="rdiv">
<form name="f" method="post" enctype="multipart/form-data" action="tftube_video_insert">

<table>

<tr><td>파일: <input type="file" id="video" name="filename" accept="video/*" >
<font color="red"><p id="video_check"></p></font></td></tr>
<tr><td>제목: <input type="text" name="title" id="title" >
<font color="red"><p id="title_check"></p></font></td></tr>
<tr><td>설명: <textarea name="description" 
id="description" maxlength="400" style="width:200; height:100;">
</textarea>
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



<tr><td>미리보기 이미지:<input type="file" name="image" id="image">
<font color="red"><p id="image_check"></p></font>
<input type="button" onClick="check_file()" value="전송">
<input type="reset" value="취소">
</td></tr>
</table>
</form> 

<!-- <article> -->
  <p id="status"><!-- File API &amp; FileReader API not supported --></p>   
  <div id="holder"></div>
  </div> <!-- end of 2-2-1 -->
<!-- </article> -->

<script>
var video_check=document.getElementById("video_check");
var title_check=document.getElementById("title_check");
var description_check=document.getElementById("description_check");
var image_check=document.getElementById("image_check"); 

/*  video.onchange=function(){
	if(!(file.substring(file.length()-3, file.length()).equals("mp4"))){
		video_check.innerHTML = 'mp4 동영상만 업로드 가능 합니다';		
	}else if(file==null){
		video_check.innerHTML = '업로드 하실 동영상을 선택하세요.'; 	
	}
};  */
 
 function check_file(){	
	var image=document.getElementById("image").value;//이것만 다르다.
	var video=document.getElementById("video").value;//이것만 다르다.
	var title=document.getElementById("title").value;
	var description=document.getElementById("description").value; 
	var image_text= image.slice(image.indexOf(".") + 1).toLowerCase();

	
	/* alert(image); alert(video); */
	if(title==""){		
		title_check.innerHTML = '제목을 입력해주세요.'; 	
		
	}else{
		title_check.innerHTML ="";		
	}
	
	if(video==""){		
	 	video_check.innerHTML = '업로드 하실 동영상을 선택하세요.';	 
	 	
	}else if(! /\.mp4$/.test(video)){	
		video_check.innerHTML = 'mp4 동영상만 업로드 가능 합니다'; 	
		
	}else{
		video_check.innerHTML = "";
	} 
	
	if(description==""){			
		description_check.innerHTML = '내용을 입력해주세요.'; 	
		
	}else{
		description_check.innerHTML ="";
		
	}
	
	
	if(image==""){		
		image_check.innerHTML = '미리보기 이미지를 선택하세요.'; 	
		return;
	}else if(image_text!="jpg"&&image_text!="jpeg"&&image_text!="gif"
			&&image_text!="png"){
		image_check.innerHTML ="jpg,jpeg,gif,png파일만 업로드 가능합니다."
	}
	else{
		image_check.innerHTML ="";		
	}
	
	if(video==""||title==""||description==""||image==""||
			! /\.mp4$/.test(video)||image_text!="jpg"||
			image_text!="jpeg"||image_text!="gif"||
		image_text!="png"){			
		return;
	}else{		
		document.f.submit();
	}
};




/* present image */
 var upload=document.getElementById('image'),  
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  state.innerHTML = ''/* 'File API & FileReader available' */;
}
/* file.onchange = function (e) {//input text 내용 변경 감지
	  e.preventDefault();

	  var file = upload.files[0],
	   reader = new FileReader();
	  reader.onload = function (event) {
	    var img = new Image();
	    img.src = event.target.result;    
	    img.width = 200;
	    img.height=160;
	        
	    holder.innerHTML = '';
	    holder.appendChild(img);
	  };
	  reader.readAsDataURL(file);
	  return false;
	}; */

upload.onchange = function (e) {//input text 내용 변경 감지
  e.preventDefault();//변경 되는걸(?) 막음.

  var file = upload.files[0],
   reader = new FileReader();
  
  //onload dom+모든 리소스 호출후 실행
  //$() dom이 호출되면 실행
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;    
    img.width  = 200;
    img.height = 160;
        
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);
  return false;
};

</script>
</div>
<%@include file="bottom.jsp" %>

