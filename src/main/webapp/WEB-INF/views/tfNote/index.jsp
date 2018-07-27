
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@include file="header.jsp"%>

<!-- 상단 부분 -->

<!--content -->

<!-- 	<div id="content"> -->

		

<script type="text/javascript">

	function chkTitle() {

	    var tmp = document.frm.title.value.replace(/\s|　/gi, '');	

		if(!document.frm.title.value || tmp==''){     

			alert("제목을 입력하세요.");

			document.frm.title.focus();

			return false;

		}

	};
	
	function chkTitle1() {

	    var tmp = document.f.title.value.replace(/\s|　/gi, '');	

		if(!document.f.title.value || tmp==''){     

			alert("제목을 입력하세요.");

			document.f.title.focus();

			return false;

		}

	};

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

		document.f.cbyte.value = totalByte; //

	    alert("글자수가 초과되었습니다.\r\n(초과된 부분 삭제)");

	    str2 = strValue.substr(0, len);

	    obj.value = str2;

	    totalByte = maxByte;

	    }

	    document.frm.cbyte.value = totalByte;

	    document.f.cbyte.value = totalByte; //

	};

	function chkCancel(){

		var result=confirm("취소하시겠습니까?");

		if(result){

			location.href="note_list.do";

		}else{

			return;

		}

	};	

</script>

	<div align="center">

	<h1>메모작성</h1>

	<form name="frm" method="post" action="note_insert" onsubmit="return chkTitle();">		

		<table class="jjm494">			

			<tr>

				<td>

					<div style="border:1px solid; padding:10px; width:90%;  word-break:break-all;flex:1;margin-left:5px; margin-right:5px;">

						<p>제목 : <input type="text" name="title"></p><br>

						<p><textarea name="content" onKeyUp="chkContent(this, 4000)" rows="5" style="width:100%; height:100%;"></textarea></p>

					</div>

				</td>

			</tr>	

			<tr>

				<td align="center">

					<input type="text" name="cbyte" value="0" size="3" readOnly>/4,000Byte

				</td>

			</tr>						

			<tr>

				<td colspan="2" align="center">

					<!-- 히든으로 넘어갈 정보들 -->

						<input type="hidden" value="${sessionScope.memberDTO.id}" name="id"/>

					<!-- 히든으로 넘어갈 정보들 -->

				    <!-- <input type="button" value="취소" onclick="chkCancel()">

					<input type="submit" value="입력">		 -->



						<a href="#" onclick="javascript:insert();">

							<img src="resources/tfNote/plus.jpg" style="width:15px; height:15px;">

						</a>
			

				</td>

			</tr>

		</table>

	</form>

	</div>



	<c:if test="${noteList.size()==0}">

		<h2>작성된 메모가 없습니다.</h2>

	</c:if>

	<div style="display:flex;width:100%;" align="center" >
		<c:set var="ch" value="0"/>
		<table>
			<tr>
				<c:forEach var="dto" items="${noteList}">
				<c:if test="${ch == 6}">
					</tr>
					<tr>
					<c:set var="ch" value="0"/>
				</c:if>
				<c:if test="${ch != 6}">
					
						<td>
							<form name="f" method="post" action="note_update" onsubmit="return chkTitle1();">
								<div style="border:1px solid; padding:10px; width:220px;  word-break:break-all;flex:1;margin-left:5px; margin-right:5px; background-color: #fffd97;">
									<div align="right">
										<!-- <a href="#" onclick="javascript:update();">수정</a> -->
										<input type="submit" value="수정">
										<a href="note_delete?num=${dto.num}&id=${dto.id}">
											<img src="resources/tfNote/close.JPG" style="width:15px; height:15px; margin-left:10px;">
										</a>
									</div>
									<p>제목1 : <input type="text" name="title" value="${dto.title}" style="width:100%;background-color: #fffd97;"></p><br>
									<p><textarea name="content" onKeyUp="chkContent(this, 4000)" rows="5" style="width:100%; height:100%;background-color: #fffd97;">${dto.content}</textarea></p>
									<input type="hidden" name="id" value="${dto.id}"/>
									<input type="hidden" name="num" value="${dto.num}"/>
								</div>
							</form>
						</td>
						<c:set var="ch" value="${ch = ch + 1}"/>
					
				</c:if>
				</c:forEach>
			</tr>
		</table>
		
		

		
<%-- 		<div style="border:1px solid; padding:10px; width:220px;  word-break:break-all;flex:1;margin-left:5px; margin-right:5px;">
			<c:forEach var="dto" items="${noteList}">
				<form name="f" method="post" action="note_update" onsubmit="return chkTitle();">
					<div align="right">
						<a href="#" onclick="javascript:update();">수정</a>
						<a href="note_delete?num=${dto.num}&id=${dto.id}">
							<img src="resources/tfNote/close.JPG" style="width:15px; height:15px; margin-left:10px;">
						</a>
					</div>
					<p>제목1 : <input type="text" name="title" value="${dto.title}"></p><br>
					<p><textarea name="content" onKeyUp="chkContent(this, 4000)" rows="5" style="width:100%; height:100%;">${dto.content}</textarea></p>
					<input type="hidden" name="id" value="${dto.id}"/>
					<input type="hidden" name="num" value="${dto.num}"/>
				</form>
			</c:forEach>
		</div> --%>

		
		
	</div>

		

	<!-- </div> -->

<!--//content -->

<!-- 하단 부분 -->

<%@include file="footer.jsp"%>