<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/signUpForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<main>
		<form class="login" method="post" action="">
			<div class="login-form">
				<input type="text" id="id" name="member_id" placeholder="사용자 아이디">
			</div>
			<div class="login-form">
				<input type="password" id="password" name="pwd" placeholder="비밀번호">
			</div>
			<div class="login-form">
				<input type="text" id="name" name="name" placeholder="성함">
			</div>
			<div class="login-form">
				<input type="email" id="email" name="email" placeholder="email">
			</div>
			<button type="submit" class="btn btn-primary" onclick="location.href=loginForm.html">가입하기</button>
			
		
		</form>
	</main>
</body>
</html>