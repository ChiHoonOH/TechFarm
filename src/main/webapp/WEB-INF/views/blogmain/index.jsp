<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<meta charset="UTF-8">
<%@ include file="header.jsp"%>

<section>
	<article>
	<table>
		<tr>
			<td class="tdspace">
		<table class="topbox" width="450px"  height="800px">
			<tr>
			<th colspan="3" class="top" height="70px"><h2>최신글 TOP 10</h2></th>
			</tr>
			<tr><th>제목</th><th>작성자</th><th>작성일</th></tr>
			<c:forEach var="newlist" items="${newlist}" varStatus="status">
			<tr align="center">
			<td class="menu"><a href="viewBoard?no=${newlist.no}&joinmode=newlist" class="deconone">${newlist.subject}</a></td>
			<td class="menu" valign="middle" align="center">
			<img src="resources/upload/${newlist.id}/${newprofile[status.index]}"  width="25" height="25" class="homemenu" align="center"/><font size="4">${newlist.id}</font>
			</td>
			<td class="menu">${newlist.reg_date}</td>
			</tr>
			</c:forEach>
		</table>
			</td>
			<td class="tdspace">
		<table class="topbox" width="450px" height="800px">
		<tr>
			<th colspan="3" class="top" height="70px"><h2>인기글 TOP 10</h2></th>
			</tr>
			<tr><th>제목</th><th>작성자</th><th width="50">조회수</th></tr>
			<c:forEach var="hotlist" items="${hotlist}" varStatus="status">
			<tr align="center">
			<td class="menu"><a href="viewBoard?no=${hotlist.no}&joinmode=hotlist" class="deconone">${hotlist.subject}</a></td>
			<td class="menu" valign="middle" align="center">
			<img src="resources/upload/${hotlist.id}/${hotprofile[status.index]}"  width="25" height="25" class="homemenu" align="center"/><font size="4">${hotlist.id}</font>
			</td>
			<td class="menu">${hotlist.readcount}</td>
			</tr>
			</c:forEach>
		</table>
			</td>
			<td class="tdspace">
		<table class="topbox" width="490px" height="800px">
			<tr>
			<th colspan="2" class="top" height="70px"><h2>인기 블로그 TOP 3</h2></th>
			</tr>
			<c:forEach var="hotblog" items="${hotblog}">
			<tr align="center">
			<td class="menu" colspan="2" background="resources/upload/${hotblog.id}/${hotblog.header}" id="hotblogheader">
			<p align="right" class="hotblogheaderword">
			<a href="myBlog?id=${hotblog.id}" class="deconone"><font color="white">${hotblog.headerword}</font></a>
			</p>
			</td>
			</tr>
			<tr>
				<td align="right">
				<img src="resources/upload/${hotblog.id}/${hotblog.profile}"  width="45" height="45" class="homemenu"/>
				</td>
				<td align="left"><font size="5">${hotblog.id}</font><font size="3" color="gray"> (${hotblog.blogname})</font></td>
			</tr>
			</c:forEach>
		</table>
			</td>
		</tr>
	</table>
	</article>  
</section>
<%@ include file="aside.jsp"%>
<%@ include file="footer.jsp"%>