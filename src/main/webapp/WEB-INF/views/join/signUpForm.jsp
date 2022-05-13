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
<link href="resources/css/signUpForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<main>
		<form class="login" method="post" action="">
		<div><img alt="썸네일" src="${path}/resources/logo/logo-img-w.png"></div>
			<div class="sign-form">
				<input type="text" id="id" name="member_id" placeholder="사용자 아이디">
			</div> 
			<div class="sign-form">
				<input type="password" id="password" name="pwd" placeholder="비밀번호">
			</div>
			<div class="sign-form">
				<input type="text" id="name" name="name" placeholder="성함">
			</div>
			<div class="sign-form">
				<input type="email" id="email" name="email" placeholder="email">
			</div>
			<div class="sign-form">
				<select name="pwdHint">
					<option value="" selected>비밀번호힌트</option>
					<option valte="1">제1호 보물</option>
					<option valte="2">졸업한 초등학교</option>
					<option valte="3">자신의 첫 직장</option>						
				</select>
			</div>
			<div class="sign-form">
				<input type="text" id="pwdHint" name="pwdHint" placeholder="비밀번호 힌트 답변">
			</div>
			<button type="submit" class="btn btn-primary" onclick="location.href=loginForm.html">가입하기</button>
			
		
		</form>
	</main>
</body>
</html>