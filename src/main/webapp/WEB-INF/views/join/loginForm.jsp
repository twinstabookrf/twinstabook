<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="../header.jsp"%>
<html>
<head>
<title>Twinstabook - 트위터와 인스타그램과 페이스북으로부터</title>
<link href="resources/css/loginForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<main>
<form method="post" action="login.html">
	<div><img alt="썸네일" src="${path}/resources/logo/logo-img-w.png"></div>
	<div class="logo">Twinstabook</div>
	<div class="form-group">
		<input type="text" class="form-control" id="member_id" name="member_id" placeholder="사용자 아이디">
	</div>
	<div class="form-group">
	    <input type="password" class="form-control" id="password" name="pwd" placeholder="비밀번호">
	</div>
	    <button type="submit" class="login-btn" >로그인</button>
</form>
	<div class="signUp">
	    	계정이 없으신가요? <button  id="button" class="btn btn-primary" onclick="location.href='signUpForm.html'">회원가입</button>
	</div>
	<div class="footer">
		<a href="pwdHint.html">비밀번호를 잊으셨나요?</a>
	</div>
   </main>    
 </body>
</html>
