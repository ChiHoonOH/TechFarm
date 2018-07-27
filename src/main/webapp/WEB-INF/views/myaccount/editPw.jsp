<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="resources/login/style_login.css" rel="stylesheet"/>
<title>Edit PW here</title>
	<script type="text/javascript">
		var goodColor = "#66cc66";
    	var badColor = "#ff6666";
		function checkPasswd(){ // 비밀번호 형식 및 일치여부 확인 메소드
			 var pass1 = document.getElementById('passwd'); 
		     var pass2 = document.getElementById('checkpasswd'); 
		     var message = document.getElementById('sid');
		     var goodColor = "#66cc66";
		     var badColor = "#ff6666";
		     if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,}$/.test(pass1.value)){
		    	 message.style.color = badColor;
		    	 message.innerHTML = "비밀번호는 숫자,영문자,특수문자의 조합으로 6~12자리를 입력해야합니다."
		    	 return false;
		     }else{
		    	 message.style.color = goodColor;
		    	 message.innerHTML = "가능한 비밀번호입니다."
		     }
		     
		     var message = document.getElementById('sid2');
		     if(pass1.value == pass2.value){ 
		            message.style.color = goodColor; 
		            message.innerHTML = "패스워드가 일치합니다!" 
		        }else{ 
		            message.style.color = badColor; 
		            message.innerHTML = "패스워드가 일치하지 않습니다. 확인해주세요!";
		            return false;
		     }
		     return true;
		}
		function checkForm(){
			if(pwform.passwd.value==""){
				alert("변경할 비밀번호를 입력하세요")
				pwform.passwd.focus()
				return false;
			}else if(pwform.checkpasswd.value==""){
				alert("변경할 비밀번호를 확인하세요")
				member.checkpasswd.focus()
				return false;
			}
			var result=checkPasswd();
			if(!result){
				alert("비밀번호를 확인해 주세요.")
				return false;
			}
			return true;
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
				<td><font color="#004080" size=5>비밀번호 변경</font></td>
			</tr>
			<c:if test="${cid!=1}">
			<tr>
				<td>현재 비밀번호 확인</td>
			</tr>
			<tr>
				<form action="editMyPw" method="post">
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
				<td>변경 비밀번호</td>
			</tr>
			<tr>
				<form name="pwform" action="updateMyPw" method="post" onsubmit="return checkForm()">
				<td><input id="passwd" class="idpass" type="password" name="passwd" onblur="checkPasswd()"></td>
			</tr>
			<tr>
				<td><span id="sid"/></td>
			</tr>
			<tr>
				<td>변경 비밀번호 확인</td>
			</tr>
			<tr>
				<td><input id="checkpasswd" class="idpass" type="password" name="checkpasswd" onblur="checkPasswd()"></td>
			</tr>
			<tr>
				<td><span id="sid2"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="변경"></td>
			</tr>
			</c:if>
			</form>
		</table>
	</div>
</body>
</html>