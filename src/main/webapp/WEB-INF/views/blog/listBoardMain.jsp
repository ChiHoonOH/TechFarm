<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="myBlogTop.jsp"/>

<c:if test="${optionDTO.layout==1}">
<jsp:include page="myBlogSide1.jsp"/>
<jsp:include page="myBlogHeader.jsp"/></tr><tr>
<c:choose>
<c:when test="${mode=='view'}">
<jsp:include page="viewBoard.jsp"/>
</c:when>
<c:when test="${mode=='search'}">
<jsp:include page="searchBoard.jsp"/>
</c:when>
<c:when test="${mode=='imsi'}">
<jsp:include page="imsiBoard.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="listBoard.jsp"/>
</c:otherwise>
</c:choose>
</c:if>	

<c:if test="${optionDTO.layout==2}">
<jsp:include page="myBlogHeader.jsp"/>
<jsp:include page="myBlogSide1.jsp"/></tr><tr>
<c:choose>
<c:when test="${mode=='view'}">
<jsp:include page="viewBoard.jsp"/>
</c:when>
<c:when test="${mode=='search'}">
<jsp:include page="searchBoard.jsp"/>
</c:when>
<c:when test="${mode=='imsi'}">
<jsp:include page="imsiBoard.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="listBoard.jsp"/>
</c:otherwise>
</c:choose>
</c:if>	

<c:if test="${optionDTO.layout==3}">
<jsp:include page="myBlogSide1.jsp"/>
<c:choose>
<c:when test="${mode=='view'}">
<jsp:include page="viewBoard.jsp"/>
</c:when>
<c:when test="${mode=='search'}">
<jsp:include page="searchBoard.jsp"/>
</c:when>
<c:when test="${mode=='imsi'}">
<jsp:include page="imsiBoard.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="listBoard.jsp"/>
</c:otherwise>
</c:choose>
</tr><tr>
<jsp:include page="myBlogHeader.jsp"/>		
</c:if>

<c:if test="${optionDTO.layout==4}">
<c:choose>
<c:when test="${mode=='view'}">
<jsp:include page="viewBoard.jsp"/>
</c:when>
<c:when test="${mode=='search'}">
<jsp:include page="searchBoard.jsp"/>
</c:when>
<c:when test="${mode=='imsi'}">
<jsp:include page="imsiBoard.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="listBoard.jsp"/>
</c:otherwise>
</c:choose>
<jsp:include page="myBlogSide1.jsp"/></tr><tr>
<jsp:include page="myBlogHeader.jsp"/>			
</c:if>

<c:if test="${optionDTO.layout==5}">
<jsp:include page="myBlogSide1.jsp"/>
<jsp:include page="myBlogHeader.jsp"/>
<jsp:include page="myBlogSide2.jsp"/></tr><tr>
<c:choose>
<c:when test="${mode=='view'}">
<jsp:include page="viewBoard.jsp"/>
</c:when>
<c:when test="${mode=='search'}">
<jsp:include page="searchBoard.jsp"/>
</c:when>
<c:when test="${mode=='imsi'}">
<jsp:include page="imsiBoard.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="listBoard.jsp"/>
</c:otherwise>
</c:choose>
</c:if>	

<c:if test="${optionDTO.layout==6}">
<jsp:include page="myBlogSide1.jsp"/>
<c:choose>
<c:when test="${mode=='view'}">
<jsp:include page="viewBoard.jsp"/>
</c:when>
<c:when test="${mode=='search'}">
<jsp:include page="searchBoard.jsp"/>
</c:when>
<c:when test="${mode=='imsi'}">
<jsp:include page="imsiBoard.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="listBoard.jsp"/>
</c:otherwise>
</c:choose>
<jsp:include page="myBlogSide2.jsp"/></tr><tr>
<jsp:include page="myBlogHeader.jsp"/>		
</c:if>
		
<jsp:include page="myBlogBottom.jsp"/>