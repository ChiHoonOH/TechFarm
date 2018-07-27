<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<meta charset="UTF-8"> 
<% 
String pfPath = config.getServletContext().getRealPath("/WEB-INF/blog/profile/"); //프로필 이미지 경로
%>
<c:set var = "pf" value="<%=pfPath%>"/>
<aside>
	<div align="center" class="ad">
	<c:if test="${membermode=='guest'}">
	<img src="resources/images/guest.png"  width="180" height="180" class="homemenu"/><br><br>
	<b>Guest</b>님 환영합니다.<br><a href="login" id="login">로그인</a>해서 더 많은 서비스를 이용해보세요!<br><br>
	<input type="button" value="블로그 만들기" onclick="javascript:login();">
	</c:if>
	<c:if test="${membermode=='membernoblog'}">
	<img src="resources/images/guest.png"  width="180" height="180" class="homemenu"/><br><br>
	<b>${sessionScope.memberDTO.id}</b>님  환영합니다.<br><br>
	<input type="button" value="블로그 만들기" onclick="location.href='blogMake?id=${sessionScope.memberDTO.id}&mode=${mode}'">
	</c:if>
	<c:if test="${membermode=='member'}">
	<img src="resources/upload/${optionDTO.id}/${optionDTO.profile}" width="180" height="180" class="homemenu"/><br><br>
	<b>${sessionScope.memberDTO.id}</b>님  환영합니다.<br><br>
	<input type="button" value="내 블로그" onclick="location.href='myBlog?id=${sessionScope.memberDTO.id}'">
	</c:if>
	<br><br><br>
	<div class="blogsearch" align="center">
		<h3>블로그 검색</h3>
		<form action="searchblog" name="search">
		<select name="search_option">
			<option value="blogname">블로그이름</option>
			<option value="id">아이디</option>
			<option value="nickname">닉네임</option>
		</select>
		<input type="text" name="search_text">
		<input type="button" value="검색" onclick="javascript:checksearch();">
		</form>
	</div>
	</div>
	<script>
		function checksearch(){
	    	if(search.search_text.value==""){
	    		alert("검색어를 입력해주세요")
	    		search.search_text.focus()
	    		return
	    	}
	    	document.search.submit()
		}     
</script>	
</aside> 