<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<title>알림 메세지</title>
		<script type="text/javascript">
			alert("${msg}");
			self.close();
		</script>
	</head>
	<body>
	</body>
</html>