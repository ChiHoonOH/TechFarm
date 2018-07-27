<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${alertmode=='addNeighbor'}">
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}?id=${id}"
</script>
</c:if>

<c:if test="${alertmode=='delNeighbor'}">
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}?mode=${mode}"
</script>
</c:if>

<c:if test="${alertmode=='addblog'}">
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}"
</script>
</c:if>

<c:if test="${alertmode=='editblog'}">
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}?mode=${mode}"
</script>
</c:if>

<c:if test="${alertmode=='addboardt'}">
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}?mode=${mode}"
</script>
</c:if>
    
<c:if test="${alertmode=='delreply'}">
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}?no=${no}"
</script>
</c:if>

<c:if test="${alertmode=='updateboard'}">
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}?boardno=${boardno}&title=${title}"
</script>
</c:if>

<c:if test="${alertmode=='delboard'}">
<script type="text/javascript">
	alert("${msg}")
	location.href="${url}?boardno=${boardno}&title=${title}"
</script>
</c:if>

