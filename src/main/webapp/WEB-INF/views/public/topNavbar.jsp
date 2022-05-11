<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-light fixed-top border-bottom">
		<!-- navbar-brand : twinstabook logo(white, virtical)  -->
		<a class="navbar-brand" href="main.html">
			<img alt="Twinstabook" src="${path }/resource/logo/logo-garo-w.png" height="50px"></a>
		<!-- 반응형 햄버거 메뉴 (모바일 페이지용) -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 검색 -->
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search" />
		</form>
		<span></span>
		<!-- nav items -->
		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">DM</a></li>
				<li class="nav-item"><a class="nav-link" href="#">NewPost</a></li>
				<li class="nav-item"><a class="nav-link" href="#">MyPage</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>