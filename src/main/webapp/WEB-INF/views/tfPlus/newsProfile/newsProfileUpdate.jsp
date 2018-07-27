<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link rel="stylesheet" media="all" href="resources/tfPlus/css/style.css"/>
		<link rel="stylesheet" media="all" href="resources/tfPlus/css/windowOpen.css"/>
		
		<!-- jstl -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		
		<!-- 이미지 경로 부분 -->
		<c:set var="newsProfileUpPath" value="resources/tfPlus/images/contents/profile"/>
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 이미지 미리보기 -->
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 이미지 미리보기 -->
		
		<title>소식 프로필 수정</title>
	</head>
	<body>
		<form name="f" id="contactForm" action="tfPlusNewsProfileUpdatePro" method="post" enctype="multipart/form-data">
			<fieldset>
				<table class="jjm494">
					<tr>
						<th scope="row">이름</th>
						<td>
							<label>${newsProfileUpdate.profileName}</label>
						</td>
					</tr>
					<tr>
						<c:set var="testVar">게임,운동,학업,미용</c:set>
						<th scope="row">분류</th>
						<td>
							<select class="selectOption" name="checkOption">
							<c:forTokens items="${testVar}" delims="," var="value">
								<c:if test="${newsProfileUpdate.checkOption == value}">
									<option value="${value}" selected="selected">${value}</option>
								</c:if>
								<c:if test="${newsProfileUpdate.checkOption != value}">
									<option>${value}</option>
								</c:if>
							</c:forTokens>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">프로필 한줄평</th>
						<td>
							<textarea  name="profileContents"  id="comments" rows="2" cols="6" class="form-poshytip" title="한줄평을 남기세요">${newsProfileUpdate.profileContents}</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">프로필 사진</th>
						<td>
							<div style="text-align:center;">
								<input name="photo" id="file1" type="file" style="width:500px;" accept="image/*" onchange="fileInfo(this)"/><br>
								<div id="img_box">
									<img src="${newsProfileUpPath}/${newsProfileUpdate.photo}" width="300px" height="100px"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" colspan="2" align="center">
						
							<!-- 히든으로 넘어갈 정보들 -->
								<input type="hidden" value="${newsProfileUpdate.profileName}" name="profileName" id="to"/>
								<input type="hidden" value="${newsProfileUpdate.profileNum}" name="profileNum" id="to"/>
								<input type="hidden" value="${sessionScope.memberDTO.id}" name="profileId" id="to" />
								<input type="hidden" value="${newsProfileUpdate.photo}" name="photoOrg" id="to" />
							<!-- 히든으로 넘어갈 정보들 -->
							
							<input type="button" onClick="javascript:input();" value="수정하기"/>
							<input type="button" onClick="self.close();" value="창닫기"/>
						</th>
					</tr>
				</table>
			</fieldset>
		</form>
		
		<script type="text/javascript">
			function input() {
				document.f.submit();
			};
			function fileInfo(contactForm){
				var file = contactForm.files; 
				var reader = new FileReader();
				reader.onload = function(rst){
					$('#img_box').html('<img src="' + rst.target.result + '" width="300px" height="100px">');
				}
				reader.readAsDataURL(file[0]);
			};
		</script>
		
	</body>
</html>