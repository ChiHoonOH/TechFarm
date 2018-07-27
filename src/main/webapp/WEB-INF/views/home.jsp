<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/resources/home/header.jsp" %>
<style>
	.search{
		padding: 5px;
		width:400px; height:40px;
		font-size:20px;
	}
	.enter{
		padding: 5px;
		width:50px; height:40px;
		font-size:15px;
	}	
</style>
<body>
<div class="main" align="center">
	<img src="resources/home/imgs/name.png" width="600"><br>
	<form name="f" action="search.naver" method="post">
		<input class="search" type="search" name="search">
		<input class="enter" type="submit" value="검색">
	</form>
</div>
<div id="main_bottom" align="right">
<table style="width: 100%; height: 100%;" border=0>
        <tr>
            <td style="vertical-align: middle;" align="center">
               made by ITBank TechFarm team
            </td>
        </tr>
    </table>
</div>
</body>
</html>
