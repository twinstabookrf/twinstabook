<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("ReTwin 수정 성공 :)")
		history.go(-2);
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("ReTwin 수정 실패 :(")
		history.back();
	</script>
</c:if>
</body>
</html>