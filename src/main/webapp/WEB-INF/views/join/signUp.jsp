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
			alert("회원가입 되었습니다.");
			location.href="loginForm.html";
		</script>
	</c:if>	
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("회원가입에 실패하셨습니다.");
			history.back();
		</script>
	</c:if>	
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("아이디가 중복되었습니.");
			history.back();
		</script>
	</c:if>
</body>
</html>