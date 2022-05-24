<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result < 0 }">
	<script type="text/javascript">
			alert("이전 암호와 같습니다.");
		history.back();
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("비밀번호가 변경되었습니다.");
		location.href="loginForm.html";
	</script>
</c:if>



</body>
</html>