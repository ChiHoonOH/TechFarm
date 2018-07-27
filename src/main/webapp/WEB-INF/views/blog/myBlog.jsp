<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="myBlogTop.jsp"/>

<c:if test="${optionDTO.layout==1}">
<jsp:include page="myBlogSide1.jsp"/>
<jsp:include page="myBlogHeader.jsp"/></tr>
<jsp:include page="myBlogHeaderImg.jsp"/><tr>
<jsp:include page="myBlogMain.jsp"/>	
</c:if>	

<c:if test="${optionDTO.layout==2}">
<jsp:include page="myBlogHeader.jsp"/>
<jsp:include page="myBlogSide1.jsp"/></tr>
<jsp:include page="myBlogHeaderImg.jsp"/><tr>
<jsp:include page="myBlogMain.jsp"/>
</c:if>	

<c:if test="${optionDTO.layout==3}">
<jsp:include page="myBlogSide1.jsp"/>
<jsp:include page="myBlogMain.jsp"/></tr><tr>
<jsp:include page="myBlogHeader.jsp"/></tr>
<jsp:include page="myBlogHeaderImg.jsp"/>			
</c:if>

<c:if test="${optionDTO.layout==4}">
<jsp:include page="myBlogMain.jsp"/>
<jsp:include page="myBlogSide1.jsp"/></tr><tr>
<jsp:include page="myBlogHeader.jsp"/></tr>
<jsp:include page="myBlogHeaderImg.jsp"/>			
</c:if>

<c:if test="${optionDTO.layout==5}">
<jsp:include page="myBlogSide1.jsp"/>
<jsp:include page="myBlogHeader.jsp"/>
<jsp:include page="myBlogSide2.jsp"/></tr>
<jsp:include page="myBlogHeaderImg.jsp"/><tr>
<jsp:include page="myBlogMain.jsp"/>
</c:if>	

<c:if test="${optionDTO.layout==6}">
<jsp:include page="myBlogSide1.jsp"/>
<jsp:include page="myBlogMain.jsp"/>
<jsp:include page="myBlogSide2.jsp"/></tr><tr>
<jsp:include page="myBlogHeader.jsp"/></tr>
<jsp:include page="myBlogHeaderImg.jsp"/>			
</c:if>
		
<jsp:include page="myBlogBottom.jsp"/>		
	