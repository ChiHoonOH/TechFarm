<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="resources/login/style_login.css" rel="stylesheet"/>
<title>Edit My Info</title>
	<script type="text/javascript">
		var goodColor = "#66cc66";
    	var badColor = "#ff6666";
		function checkPasswd(){ // 비밀번호 형식 및 일치여부 확인 메소드
			var pass = document.getElementById('pwd');
	    	var message = document.getElementById('sid');
		     if(pass.value!=("${sessionScope.memberDTO.rawPassword}")){
		    	 message.style.color = badColor;
		    	 message.innerHTML = "비밀번호를 확인해 주세요."
		    	 return false;
		     }else{
		    	 message.style.color = goodColor;
		    	 message.innerHTML = "비밀번호가 일치 합니다. 정보수정 가능합니다."
		    	 return true;
		     }
		}
		function checkBirthDay(){ // 생일의 신뢰성 향상 메소드
			var year=document.getElementById('year');
			var month=document.getElementById('month');
			var day=document.getElementById('day');
			var message = document.getElementById('sid3');
			var lastDay=get_LastDay(year.value,(month.value-1));
			if(year.value<1900||year.value>2016){
		    	 message.style.color = badColor;
		    	 message.innerHTML = "연도를 다시 확인해 주세요."
		    	 return false;
		     }else if(month.value<1||month.value>12){
		    	 message.style.color = badColor;
		    	 message.innerHTML = "월을 다시 확인해 주세요."
		    	return false;
		     }else if(day.value<1||day.value>lastDay){
		    	 message.style.color = badColor;
		    	 message.innerHTML = "일을 다시 확인해 주세요.";
		    	return false;
		     }
			message.style.color = goodColor;
	    	message.innerHTML = "입력 가능합니다."
	    	return true;
		}
		
		function get_LastDay(year,month){ // 해당 년도와 월을 입력받아 마지막 날을 리턴하는 메소드
			var Last_Mon=new Array(31,29,31,30,31,30,31,31,30,31,30,31) 
		    var Mon2=true;
		   if(year%4==0){ // 윤년 계산
			   Mon2=true;
		   }else{
			   Mon2=false;
		   }
		   if(Mon2){
			   Last_Mon[1]=28; // 윤년일 경우 28일로 치환
		   }
		   return Last_Mon[month];
		}
		
		function checkForm(){
			if(member.passwd.value==""){
				alert("비밀번호를 입력하세요")
				member.passwd.focus()
				return false;
			}else if(member.name.value==""){
				alert("이름를 입력하세요")
				member.name.focus()
				return false;
			}else if(member.email.value==""){
				alert("이메일을 입력하세요")
				member.email.focus()
				return false;
			}else if(member.birthday_year.value==""){
				alert("생일을 입력하세요")
				member.birthday_year.focus()
				return false;
			}
			var result=checkPasswd();
			if(!result){
				alert("비밀번호를 확인해 주세요.")
				return false;
			}
			result=checkBirthDay();
			if(!result){
				alert("생일을 확인해 주세요.")
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<div class="createmain">
		<table>
			<form name="member" action="editMyInfo" method="post" onsubmit="return checkForm()">
			<tr>
				<td><img src="resources/home/imgs/name.png" width="200"></td>
			</tr>
			<tr>
				<td><font size=5>정보수정</font></td>
			</tr>
			<tr>
				<td>아이디<br><input id="id" type="text" name="id" value="${sessionScope.memberDTO.id}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><span><font color="#ff6666">아이디는 변경 불가합니다.</font></span></td>
			</tr>
			<tr>
				<td>비밀번호<br><input id="pwd" type="password" name="passwd" onblur="checkPasswd()"></td>
			</tr>
			<tr>
				<td><span id="sid"></span></td>
			</tr>
			<tr>
				<td>이름<br><input type="text" name="name" value="${sessionScope.memberDTO.name}"></td>
			</tr>
			<tr>
				<td>E-mail<br><input type="text" name="email" value="${sessionScope.memberDTO.email}" ></td>
			</tr>
				<td><span>인증 및 비밀번호 찾기 서비스에 사용될 e-mail을 입력해주세요.</span></td>
			<tr>
				<td>생일<br>
					<input id="year" type="text" name="birthday_year" size="4" maxlength="4" value="${sessionScope.memberDTO.birthday_year}" onblur="checkBirthDay()">년
					<input id="month" type="text" name="birthday_month" size="2" maxlength="2" value="${sessionScope.memberDTO.birthday_month}" onblur="checkBirthDay()">월
					<input id="day" type="text" name="birthday_day" size="2" maxlength="2" value="${sessionScope.memberDTO.birthday_day}" onblur="checkBirthDay()">일
				</td>
			</tr>
			<tr>
				<td><span id="sid3"></span></td>
			</tr>
			<tr>
				<td>성별<br>
				<c:if test="${sessionScope.memberDTO.sex==0}">
					<input type="radio" id="male" name="sex" value="1"><label for="male">남자</label>
					<input type="radio" id="female" name="sex" value="2"><label for="female">여자</label>
					<input type="radio" id="other" name="sex" value="0" checked="checked"><label for="other">비공개</label>
				</c:if>
				<c:if test="${sessionScope.memberDTO.sex==1}">
					<input type="radio" id="male" name="sex" value="1" checked="checked"><label for="male">남자</label>
					<input type="radio" id="female" name="sex" value="2"><label for="female">여자</label>
					<input type="radio" id="other" name="sex" value="0"><label for="other">비공개</label>
				</c:if>
				<c:if test="${sessionScope.memberDTO.sex==2}">
					<input type="radio" id="male" name="sex" value="1"><label for="male">남자</label>
					<input type="radio" id="female" name="sex" value="2" checked="checked"><label for="female">여자</label>
					<input type="radio" id="other" name="sex" value="0"><label for="other">비공개</label>
				</c:if>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="수정"><input type="reset" value="다시작성"></td>
			</tr>
			</form>
		</table>
	</div>
</body>
</html>
