<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.jsp"%>

<section>
	<article>
		<h1>블로그 만들기</h1><img src="resources/images/1step.jpg" align="right" width="250" height="100">
		<h2>1단계:블로그 기본설정</h2>
		
		<form action="blogMake2" method="post" enctype="multipart/form-data" name="f">
		
			<table width="700px" height="400px" align="center" class="makeblog">
				<tr>
					<th>블로그 이름</th>
					<td><input type="text" name="blogname" value="${sessionScope.memberDTO.id} BLOG" maxlength="30"></td>
					<td>한글,영문,숫자 혼용가능 (30자 이내)</td>
				</tr>
				<tr>
					<th>별명</th>
					<td><input type="text" name="nickname" maxlength="15"></td>
					<td>한글,영문,숫자 혼용가능 (15자 이내)</td>
				</tr>
				<tr>
					<th>소개글</th>
					<td><textarea rows="10" cols="20" maxlength="200" name="introduce"></textarea></td>
					<td>블로그 프로필 영역의<br>프로필사진 아래에 반영됩니다.<br>(200자 이내)</td>
				</tr>
				<tr>
					<th>타이틀 글</th>
					<td><textarea rows="3" cols="20" maxlength="30" name="headerword"></textarea></td>
					<td>  블로그 타이틀에 반영됩니다<br>(30자 이내)</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><hr size="1">
					<input type="button" value="다음단계" onclick="javascript:checkinfo();">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
					</td>
				</tr>				
			</table>
		</form>	
	</article>  
</section>
<script>
		function checkinfo(){
	    	if(f.blogname.value==""){
	    		alert("블로그 이름을 입력하세요")
	    		f.blogname.focus()
	    		return
	    	}
	    	if(f.nickname.value==""){
	    		alert("별명을 입력하세요")
	    		f.nickname.focus()
	    		return
	    	}
	    	document.f.submit()
		}     
</script>	    
	     
<%@ include file="aside.jsp"%>
</body>
</html>