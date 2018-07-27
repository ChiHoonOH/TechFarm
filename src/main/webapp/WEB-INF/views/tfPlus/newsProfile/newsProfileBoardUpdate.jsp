<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link rel="stylesheet" media="all" href="resources/tfPlus/css/style.css"/>
		<link rel="stylesheet" media="all" href="resources/tfPlus/css/windowOpen.css"/>
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 이미지 미리보기 -->
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 이미지 미리보기 -->
		
		<!-- jstl -->
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		
		<!-- 이미지 경로 부분 -->
		<c:set var="newsProfileBoardUpPath" value="resources/tfPlus/images/contents/profileBoard"/>
		
		<title>게시물 수정</title>
	</head>
	<body>
	
	<form name="f" id="contactForm" action="tfPlusNewsProfileBoardUpdatePro" method="post" enctype="multipart/form-data">
			<fieldset>
				<table class="jjm494">
					<tr>
						<th scope="row">글제목</th>
						<td>
							<input name="profileBoardTitle" type="text" class="form-poshytip" title="글 제목을 입력하세요" value="${newsProfileUpdate.profileBoardTitle}"/>
						</td>
					</tr>
					<tr>
						<th scope="row">글내용</th>
						<td>
							<textarea  name="profileBoardContents"  id="comments" rows="2" cols="6" class="form-poshytip" title="글 내용을 입력하세요">${newsProfileUpdate.profileBoardContents}</textarea>
						</td>
					</tr>
					<tr>
						<th scope="row">이미지</th>
						<td>
							<div style="text-align:center;">
								<input name="photo" id="file1" type="file" style="width:500px;" accept="image/*" onchange="fileInfo(this)"/><br>
								<div id="img_box">
									<img src="${newsProfileBoardUpPath}/${newsProfileUpdate.profileBoardPhoto}" width="300px" height="100px"/>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" colspan="2" align="center">
						
							<!-- 히든으로 넘어갈 정보들 -->
								<input type="hidden" value="${newsProfileUpdate.profileBoardPK}" name="profileBoardPK" id="to" />
								<input type="hidden" value="${newsProfileUpdate.profileBoardPhoto}" name="photoOrg" id="to" />
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
			function fileInfo(f){
				var file = f.files; 
				var reader = new FileReader();
				reader.onload = function(rst){
					$('#img_box').html('<img src="' + rst.target.result + '" width="300px" height="100px">');
				}
				reader.readAsDataURL(file[0]);
			};
		</script>
	
	</body>
</html>