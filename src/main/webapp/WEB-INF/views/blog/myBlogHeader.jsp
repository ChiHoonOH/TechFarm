<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			<td height="80px" width="60%">
			<div id="header">
			<a href="myBlog?id=${optionDTO.id}"><h1>${optionDTO.blogname}</h1></a>
			<h2>${optionDTO.headerword}</h2>
			<div align="right">
			<c:if test="${optionDTO.id.equals(sessionScope.memberDTO.id)}">
			<a href="editBlog?mode=blog&id=${optionDTO.id}">블로그 관리</a>&nbsp;&nbsp;
			</c:if>
			</div>
			</div>
			</td>