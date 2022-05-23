<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/pwdHint.css" rel="stylesheet" type="text/css">
</head>
<body>
	<main>
		<form class="login" method="post" action="pwdHint2.html">
			<div class="img"><img alt="썸네일" src="${path}/resources/logo/logo-img-w.png"></div>
			<div class="logo">Twinstabook</div> 
			<div class="hint-form">
				<input type="text" id="id" name="member_id" required="required" placeholder="사용자 아이디">
			</div> 
			<button type="submit" class="btn btn-primary">비밀번호 찾기</button>
 		</form>
	</main>
</body>
</html>