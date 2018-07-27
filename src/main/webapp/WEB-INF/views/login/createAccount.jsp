<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" href="resources/login/style_login.css" rel="stylesheet"/>
<title>Welcome to TF</title>
	<script type="text/javascript">
		var sysmsg='${msg}';
		var checkduple='true';
		var checkduple2='${dupleid}'
		if(sysmsg != ''){
			alert('${msg}');
		}
		var goodColor = "#66cc66";
    	var badColor = "#ff6666";
    	function checkId(){
    		var id=document.getElementById('id');
    		location.href="idCheck123?id="+id.value;
    	};
		function checkPasswd(){ // 비밀번호 형식 및 일치여부 확인 메소드
			 var pass1 = document.getElementById('pwd1'); 
		     var pass2 = document.getElementById('pwd2'); 
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
		     };
		     
		     var message = document.getElementById('sid2');
		     if(pass1.value == pass2.value){ 
		            message.style.color = goodColor; 
		            message.innerHTML = "패스워드가 일치합니다!" 
		        }else{ 
		            message.style.color = badColor; 
		            message.innerHTML = "패스워드가 일치하지 않습니다. 확인해주세요!";
		            return false;
		     };
		     return true;
		};
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
		};
		
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
		};
		
		function checkForm(){
			if(checkduple!=checkduple2){
				alert("아이디 중복체크가 필요합니다.")
				return false;
			}
			if(member.id.value==""){
				alert("아이디를 입력하세요")
				member.id.focus()
				return false;
			}else if(member.passwd.value==""){
				alert("비밀번호를 입력하세요")
				member.passwd.focus()
				return false;
			}else if(member.name.value==""){
				alert("이름를 입력하세요")
				member.name.focus()
				return false;
			}else if(member.email1.value==""){
				alert("이메일을 입력하세요")
				member.email1.focus()
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
			var email=member.email1.value+"@"+member.email2.value;
			member.email.value=email;
			return true;
		};
	</script>
</head>
<body>
	<div class="createmain">
		<table>
			<spring:hasBindErrors name="inputInfo"/>
			<form name="member" action="inputmember" method="post" onsubmit="return checkForm()">
			<tr>
				<td><img src="resources/home/imgs/name.png" width="200"></td>
			</tr>
			<tr>
				<td><font size=5>회원가입</font></td>
			</tr>
			<tr>
				<td>
						아이디<br><input id="id" type="text" name="id" value="${inputInfo.id}"/>
						<input type="button" value="중복체크" onclick="checkId();"/>
					<br><form:errors path="inputInfo.id"/>
				</td>
			</tr>
			<tr>
				<td>비밀번호<br><input id="pwd1" type="password" name="passwd" value="${inputInfo.passwd}" onblur="checkPasswd()"><br>
				<form:errors path="inputInfo.passwd"/></td>
			</tr>
			<tr>
				<td><span id="sid"></span></td>
			</tr>
			<tr>
				<td>비밀번호 확인<br><input id="pwd2" type="password" name="passwdcheck" onblur="checkPasswd()"></td>
			</tr>
			<tr>
				<td><span id="sid2"></span></td>
			</tr>
			<tr>
				<td>이름<br><input type="text" name="name" value="${inputInfo.name}">
				<br><form:errors path="inputInfo.name"/></td>
			</tr>
			<tr>
				<td>E-mail<br><input type="text" name="email1" value="${inputInfo.email1}">@<input type="text" name="email2" value="${inputInfo.email2}">
				<br><form:errors path="inputInfo.email"/></td>
			</tr>
				<td><span>인증 및 비밀번호 찾기 서비스에 사용될 e-mail을 입력해주세요.</span></td>
			<tr>
				<td>생일<br>
					<input id="year" type="text" name="birthday_year" size="4" maxlength="4" value="${inputInfo.birthday_year}" onblur="checkBirthDay()">년
					<input id="month" type="text" name="birthday_month" size="2" maxlength="2" value="${inputInfo.birthday_month}" onblur="checkBirthDay()">월
					<input id="day" type="text" name="birthday_day" size="2" maxlength="2" value="${inputInfo.birthday_day}" onblur="checkBirthDay()">일
					<br><form:errors path="inputInfo.birthday_year"/>
					<form:errors path="inputInfo.birthday_month"/>
					<form:errors path="inputInfo.birthday_day"/></td>
				</td>
			</tr>
			<tr>
				<td><span id="sid3"></span></td>
			</tr>
			<tr>
				<td>성별<br>
					<input type="radio" id="male" name="sex" value="1"><label for="male">남자</label>
					<input type="radio" id="female" name="sex" value="2"><label for="female">여자</label>
					<input type="radio" id="other" name="sex" value="0" checked="checked"><label for="other">비공개</label>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="가입"><input type="reset" value="다시작성"></td>
			</tr>
			<input type="hidden" name="email">
			</form>
		</table>
	</div>
</body>
</html>
