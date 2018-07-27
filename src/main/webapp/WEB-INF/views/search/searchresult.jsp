<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>

<script type="text/javascript">
	function addtionalSearch(pnum){
		document.s.action="search.naver?pagenum="+pnum;
		document.s.submit();
	};
	function changeTarget(num){
		var target=document.getElementById('targetnum');
		target.value=num;
		document.s.submit();
	}
</script>
	<div class="left">
		<div class="left_content1">
		

	<form name="s" method="post">
		<input type="hidden" id="targetnum" name="targetnum" value="${targetnum}">
		<input type="hidden" name="search" value="${search}">
	</form>
			<c:forEach var="dto" items="${result}">
			<table class="jjm494">
				<tr>
					<th>
						 <a href="#" onclick="window.open('${dto.link}')">${dto.title}</a>
					</th>
				</tr>
				<tr>
					<td>
						${dto.description}
					</td>
				</tr>
			</table>
			</c:forEach>
			<p>
				검색결과 : ${total}</br>
				검색시간 : ${time}
			</p>
			<input type="button" value="웹검색" onclick="javascript:changeTarget(0);">
		<input type="button" value="뉴스" onclick="javascript:changeTarget(1);">
		<input type="button" value="사전" onclick="javascript:changeTarget(2);">
		<div align="center">
			<p class="paging">     
			    <a href="javascript:addtionalSearch(0);" class="num">1</a> 
			    <a href="javascript:addtionalSearch(1);" class="num">2</a>
			    <a href="javascript:addtionalSearch(2);" class="num">3</a> 
			    <a href="javascript:addtionalSearch(3);" class="num">4</a> 
			    <a href="javascript:addtionalSearch(4);" class="num">5</a>  
			</p>
		 </div>
 
 
		</div>
	</div>
	 
<%@ include file="footer.jsp" %>