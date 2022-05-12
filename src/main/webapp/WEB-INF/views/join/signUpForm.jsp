<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="login" method="post">
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

</body>
</html>