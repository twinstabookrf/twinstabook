<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/font.css" rel="stylesheet" type="text/css">
<style>
/* 	a {
		color: black;
		text-decoration: none;
	} */
	.nav{
		height: 50px;
		background: white;
	}
	.navProfile {
		width: 30px;
		height: 30px;
		border-radius: 70%;
		overflow: hidden;
		margin-left: 10px;
	}
	.d-flex {
		margin-top: 3px;
	}
	.home {
		font-size: 30px;
		color: black;
	}
	
	.logOut {
		font-size: 30px;
		color: black;
	}
</style>
</head>
<body>
<div class="nav justify-content-center">
	<!-- 로고이미지 -->
	<a class="nav-link active" href="main.html"><img alt="Twinstabook" src="${path }/resources/logo/logo-txt-w2.png" height="25px"></a>
	<!-- 검색창 -->
	<form class="d-flex" action="search.html" method="post">
	   	<input class="form-control" type="text" name="name" placeholder="Search (ID)" aria-label="Search">
	   	<button class="btn btn-outline-dark btn-sm" type="submit">Search</button>
	</form>
	<!-- 마이페이지 -->
	<a class="nav-link active" href="myPage.html"><img class="navProfile" alt="프로필사진" src="${path }/resources/happysmile.jpg"></a>
	<!-- 홈 -->
	<a class="nav-link active" href="main.html"><i class="bi bi-house-door-fill home"></i></a>
	<!-- 로그아웃 -->
	<a class="nav-link active" href="logout.html"><i class="bi bi-door-open-fill logOut"></i></a>
</div>
<%-- <div class="header border-bottom" align="center">
<a class="navbar-brand" href="main.html">
	<img alt="Twinstabook" src="${path }/resources/logo/logo-garo-w.png" height="50px"></a>
		<a href="myPage.html">myPage</a>
</div> --%>
</body>
</html>