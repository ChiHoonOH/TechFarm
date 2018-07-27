<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="header.jsp"%>
<section>
	<article>
	<table width="700px" height="400px" align="center" class="makeblog">
		<tr>
		<td><h2>블로그 만들기 성공!<img src="resources/images/1step.jpg" align="right" width="150" height="50"></h2></td>
		</tr>
		<tr>
		<td><input type="button" value="내 블로그 보러가기" onclick="location.href='myBlog?id=${id}'"></td>
		<td><input type="button" value="블로그 홈" onclick="location.href='blogStart'"></td>
		</tr>
	</table>	
	</article>  
</section>
<%@ include file="aside.jsp"%>
<%@ include file="footer.jsp"%>