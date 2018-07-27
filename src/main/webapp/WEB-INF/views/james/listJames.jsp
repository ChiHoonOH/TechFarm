<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp"%>
	<div class="left">
		<div class="left_content1">
			<div align="center">
				<br>
				
				<a href="listJames?folder=INBOX">받은편지함</a>
				<!-- 
				<a href="listJames?folder=Sent">보낸편지함</a>
				<a href="listJames?folder=Trash">휴지통</a>  
				-->
				<div align="center">
					<table class="jjm494">
						<c:choose>
							<c:when test="${listJames.size()==0 }">
								<tr>
									<th>받은 메일이 없습니다.</th>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var = "dto" items="${listJames }">
									<tr>
										<th><input type="checkbox" name="chk_mail" value="${dto.num	}"></th>
										<td><a href="sendJames?to=${dto.from}">${dto.from }</a></td>
										<td><a href="getJames?num=${dto.num }">${dto.subject }</a></td>
										<td>${dto.sentDate }</td>
										<th><a href="javascript:onClick=confirmDel('${dto.num }')">삭제</a></th>			
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				
		<ul class="pageUL"> 
			<c:if test="${pageMaker.prev}"> 
				<li><a href='listJames?page=${pageMaker.start -1}'>이전</a></li> 
			</c:if> 
			<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}" var="idx"> 
				<li class='<c:out value="${idx == pageMaker.page?'current':''}"/>'> 
					<a href='listJames?page=${idx}'>${idx}</a> 
				</li> 
			</c:forEach> 
			<c:if test="${pageMaker.next }"> 
				<li><a href='listJames?page=${pageMaker.end +1}'>다음</a></li> 
			</c:if> 
		</ul>


			</div>
		</div>
	</div>
	 
<%@ include file="footer.jsp" %>