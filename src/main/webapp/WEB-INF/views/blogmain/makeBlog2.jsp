<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<%
String bgPath = config.getServletContext().getRealPath("/WEB-INF/blog/background/"); //백그라운드 이미지 경로
String hdPath = config.getServletContext().getRealPath("/WEB-INF/blog/header/"); //헤더 이미지 경로
%>	
<c:set var = "bg" value="<%=bgPath%>"/>
<c:set var = "hd" value="<%=hdPath%>"/>
<section>
	<article>
		<h1>블로그 만들기<img src="resources/images/2step.jpg" align="right" width="250" height="100"></h1>
		<h2>2단계:레이아웃 선택</h2>
		<form action="blogMake3" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="blogname" value="${blogname}">
		<input type="hidden" name="nickname" value="${nickname}">
		<input type="hidden" name="introduce" value="${introduce}">
		<input type="hidden" name="headerword" value="${headerword}">	
			<table width="800px" height="500px" align="center" class="makeblog">
				<tr>
					<th width="8%">레이<br>아웃</th>
					<td width="73%">
					<div align="center">
						<input type="radio" name="layout" value="1" id="layout1" checked style="display:none;">
		<img src="resources/images/layout/layout1on.jpg" onclick='layoutChoice(1)' style="cursor:pointer;" class="layout1">
		<input type="radio" name="layout" value="2" id="layout2" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout2.jpg" onclick='layoutChoice(2)' style="cursor:pointer;" class="layout2">
		<input type="radio" name="layout" value="3" id="layout3" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout3.jpg" onclick='layoutChoice(3)' style="cursor:pointer;" class="layout3">
		<input type="radio" name="layout" value="4" id="layout4" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout4.jpg" onclick='layoutChoice(4)' style="cursor:pointer;" class="layout4">
		<input type="radio" name="layout" value="5" id="layout5" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout5.jpg" onclick='layoutChoice(5)' style="cursor:pointer;" class="layout5">
		<input type="radio" name="layout" value="6" id="layout6" style="display:none;">&nbsp;
		<img src="resources/images/layout/layout6.jpg" onclick='layoutChoice(6)' style="cursor:pointer;" class="layout6">
					</div><br><br>
					<div class="layoutedit1" align="center" style="border: 5px double #ccc; ">
						레이아웃1
						<table width="70%" height="100%" align="center">
							<tr>
								<td align="left" rowspan="2" valign="top">
									<div class="aside" height="100%" align="right">
									<img src="resources/images/layout/sidebar.jpg">
									</div>
								</td>
								<td>
									<div class="title" width="100%">
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
								<td align="right" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/empty.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div><div class="layoutedit2" align="center" style="border: 5px double #ccc; display:none; ">
						레이아웃2
						<table width="70%" height="100%" align="center">
							<tr>
								<td align="left" rowspan="2" valign="top">
								<img src="resources/images/layout/empty.jpg">
								</td>
								<td>
									<div class="title" width="100%">
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
								<td align="right" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/sidebar2.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="layoutedit3" align="center" style="border: 5px double #ccc;display:none; ">
						레이아웃3
						<table width="70%" height="100%" align="center">
							<tr>
								<td align="left" rowspan="2" valign="top">
									<div class="aside" height="100%" align="right">
									<img src="resources/images/layout/sidebar.jpg">
									</div>
								</td>
								<td>
									<div class="title" width="100%">
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
								<td align="right" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/empty.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="layoutedit4" align="center" style="border: 5px double #ccc;display:none; ">
						레이아웃4
						<table width="70%" height="100%" align="center">
							<tr>
								<td align="left" rowspan="2" valign="top">
								<img src="resources/images/layout/empty.jpg">
								</td>
								<td>
									<div class="title" width="100%">
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
								<td align="right" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/sidebar2.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="layoutedit5" align="center" style="border: 5px double #ccc;display:none; ">
						레이아웃5
						<table width="70%" height="100%" align="center">
							<tr>
								<td align="left" rowspan="2" valign="top">
									<div class="aside" height="100%" align="right">
									<img src="resources/images/layout/sidebar.jpg">
									</div>
								</td>
								<td>
									<div class="title" width="100%">
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
								<td align="right" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/sidebar2.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="layoutedit6" align="center" style="border: 5px double #ccc;display:none; ">
						레이아웃6
						<table width="70%" height="100%" align="center">
							<tr>
								<td align="left" rowspan="2" valign="top">
								<img src="resources/images/layout/sidebar.jpg">
								</td>
								<td>
									<div class="title" width="100%">
									<img src="resources/images/layout/main.jpg">
									</div>
								</td>
								<td align="right" rowspan="2" valign="top">
									<div class="aside2" height="100%" align="left">
									<img src="resources/images/layout/sidebar2.jpg">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>
									<img src="resources/images/layout/title.jpg">
									</div>
								</td>
							</tr>
						</table>
					</div>
					</td>
					<td>
					레이아웃은 추후에<br>변경 가능합니다.
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><hr size="1">
					<input type="submit" value="다음단계">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
					</td>
				</tr>				
			</table>
		</form>	
	</article>  
</section>
<%@ include file="aside.jsp"%>
</body>
</html>