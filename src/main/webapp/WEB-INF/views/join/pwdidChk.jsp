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
		alert("비밀번호 힌트를 제출하시오.")
		location.href="pwdHint2.html"
		</script>
	</c:if>
	<c:if test="${result < 0 }">
		<script type="text/javascript">
			alert("없는 아이디 입니다.");
			history.back();
		</script>
	</c:if>

</body>
</html>