<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="header.jsp"%>
<html>
<head>
<title>Twinstabook - 트위터와 인스타그램과 페이스북으로부터</title>
<link href="resource/css/font.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.fixed-width {width: 612px;}
	.img-circle {width: 50px;	height: 50px;	border-radius: 70%;	overflow: hidden;}
	.img-circle img{width: 100%;height:100%;object-fit: cover;}
</style>
</head>
<body>
	<!-- topNavbar -->
	<%@include file="public/topNavbar.jsp" %>
	<div class="container" style="margin-top:72px" align="center">
		<div class="feed fixed-width">
			<div class="posts border">
				<div class="post_head p-2 d-flex justify-content-start border-bottom align-items-center">
					<div class="m-2 img-circle"><img alt="프사" src="${path}/resource/happysmile.jpg" height="50px";></div>
					<span >아이디</span>
				</div>
				<!-- post_head -->
				<div class="post_content">
					<div class="post_pics_slide mb-1 border-bottom">
						<img alt="썸네일" src="${path}/resource/logo/logo-img-w.png">
						<!-- 슬라이드 뷰 -->
					</div>
					<!-- post_menu -->
					<div class="post_foot p-2">
						<div class="post_menu d-flex justify-content-start mb-2	">
							<a><span class="glyphicon glyphicon-heart-empty"></span></a>
							<a><span class="glyphicon glyphicon-comment"></span></a>
							<a><span class="glyphicon glyphicon-send"></span></a>
						</div>
						<div class="post_likes" align="left">좋아요 정보</div>
						<div class="post_tags" align="left">태그 리스트</div>
						<div class="post_replys" align="left">
							<table>
								<tr>
									<td>작성자</td>
									<td>내용</td>
									<td>좋아요</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>내용</td>
									<td>좋아요</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>내용</td>
									<td>좋아요</td>
								</tr>
							</table>
							<div class="post_reply_ d-flex align-items-center">
								<a><img src="${path}/resource/happysmile.jpg" alt="imoge"
									height="20px"></a>
								<form action="" class="m-0 p-0 d-flex align-items-baseline">
									<input type="text" name="reply" class="form-text text-muted">
									<input type="submit" name="reply_submit" class="" value="게시">
								</form>
							</div>
							<!-- post_reply_ -->
						</div>
						<!-- post_replys -->
					</div>
					<!-- post_foot -->
				</div>
				<!-- post_content -->
			</div>
			<!-- posts -->
		</div>
		<!-- feed -->
	</div>
	<!-- container -->
</body>
</html>