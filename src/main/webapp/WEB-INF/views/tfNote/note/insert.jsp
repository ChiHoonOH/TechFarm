<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- 상단 부분 -->
<!--content -->
	<div id="content">
  
<script type="text/javascript">
	function chkTitle() {
	    var tmp = document.frm.title.value.replace(/\s|　/gi, '');	
		if(!document.frm.title.value || tmp==''){     
			alert("제목을 입력하세요.");
			document.frm.title.focus();
			return false;
		}
	}	
	function chkContent(obj, maxByte) {
	     var strValue = obj.value;
         var strLen = strValue.length;
         var totalByte = 0;
	     var len = 0;
         var oneChar = "";
         var str2 = "";		
	for (var i=0; i<strLen; i++) {
		oneChar = strValue.charAt(i);		
		if(escape(oneChar).length > 4) {
			totalByte += 2;
		} else {
			totalByte++;
	}
	//입력한 문자 길이를 넘어가면 잘라내기 위해 저장
	if(totalByte <= maxByte) {
		len = i + 1;
		}
	}
	//넘어가는 글자는 삭제
	if(totalByte > maxByte) {
		document.frm.cbyte.value = totalByte;
	    alert("글자수가 초과되었습니다.\r\n(초과된 부분 삭제)");
	    str2 = strValue.substr(0, len);
	    obj.value = str2;
	    totalByte = maxByte;
	    }
	    document.frm.cbyte.value = totalByte;
	}
	function chkCancel(){
		var result=confirm("취소하시겠습니까?");
		if(result){
			location.href="note_list.do";
		}else{
			return;
		}
	}	
</script>
	
	<div align="center">
	<h1>글쓰기</h1>
	<form name="frm" method="post" action="note_insert" onsubmit="return chkTitle();">		
		<table class="jjm494">
			<tr>
				<th scope="row">제목</th>
				<td>
					<input type="text" name="title" maxlength="100">
				</td>
			</tr>				
			<tr>
				<th scope="row">내용</th>
				<td>
					<textarea name="content" onKeyUp="chkContent(this, 4000)" rows="10" cols="50"></textarea><br>
					<input type="text" name="cbyte" value="0" size="3" readOnly>/4,000Byte
				</td>
			</tr>							
			<tr>
				<td colspan="2" align="center">
					<!-- 히든으로 넘어갈 정보들 -->
						<input type="hidden" value="${sessionScope.memberDTO.id}" name="id"/>
					<!-- 히든으로 넘어갈 정보들 -->
				    <input type="button" value="취소" onclick="chkCancel()">
					<input type="submit" value="입력">						
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	</div>
<!--//content -->
<!-- 하단 부분 -->
<%@include file="../footer.jsp"%>