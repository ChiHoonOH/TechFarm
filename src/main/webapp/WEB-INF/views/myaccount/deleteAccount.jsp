<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="resources/login/style_login.css" rel="stylesheet"/>
<title>withdraw member</title>
	<script type="text/javascript">
		var goodColor = "#66cc66";
    	var badColor = "#ff6666";
		function checkSentence(){ // 비밀번호 형식 및 일치여부 확인 메소드
			 var check = document.getElementById('check');  
		     var message = document.getElementById('sid');
		     var checkmessage='${deletesentence}';
		     if(check.value==checkmessage){
		    	 message.style.color = goodColor;
		    	 message.innerHTML = "일치합니다."
		    	 return true;
		     }else{
		    	 message.style.color = badColor;
		    	 message.innerHTML = "해당 문구를 정확히 입력해주세요."
		    	 return false;
		     }
		}
		function checkForm(){
			if(deleteform.check.value==""){
				alert("해당 문구를 입력해주세요")
				deleteform.check.focus()
				return false;
			}
			var checksen=checkSentence();
			if(!checksen){
				alert("해당 문구를 확인해주세요")
				return false;
			}
			var result=confirm("정말로 탈퇴하시겠습니까? T_T");
			return result;
		}
	</script>
</head>
<body>
	<div class="logmain">
		<table>
			<tr>
				<td><img src="resources/home/imgs/name.png" width="200"></td>
			</tr>
			<tr>
				<td><font color="#004080" size=5>회원탈퇴</font></td>
			</tr>
			<c:if test="${cid!=1}">
			<tr>
				<td>현재 비밀번호 확인</td>
			</tr>
			
			<tr>
				<form action="deleteMember" method="post">
				<td><input class="idpass" type="password" name="currentpasswd"></td>
			</tr>
			</c:if>
			<c:if test="${cid==2}">
				<tr>
					<td><span style="color:red">현재 비밀번호가 일치하지 않습니다.</span></td>
				</tr>
			</c:if>
			<c:if test="${cid==1}">
			<tr>
				<td>아래 문구를 입력해주세요.</td>
			</tr>
			<tr>
				<td><font color="red">${deletesentence}</font></td>
			</tr>
			<tr>
				<form name="deleteform" action="deleteMyAccount" method="post" onsubmit="return checkForm()">
				<td><input id="check" class="idpass" type="text" name="check" onblur="checkSentence()"></td>
			</tr>
			<tr>
				<td><span id="sid"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="탈퇴"></td>
			</tr>
			</c:if>
			</form>
		</table>
	</div>
</body>
</html>