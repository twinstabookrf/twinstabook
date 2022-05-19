<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/font.css" rel="stylesheet" type="text/css">
<style>
	.head {
		width: 50%;
		margin: 0 auto;
		padding-top: 50px;
		padding-bottom: 10px;
	}
	
	.headTable {
		margin: auto;
		width: 100%;
		/* border: 1px solid black; */
	}
	
	/* .headTable th, td{border: 1px solid black;} */
	
	.text_id {
		font-size: 1.2em;
		color: #4793d7;
	}
	
	.following {
		text-decoration: none;
		color: black;
	}
	
	.following:hover {
		font-weight: bold;
		color: black;
	}
	
	.main_nav {
		width: 50%;
		margin: 0 auto;
		padding-bottom: 10px;
	}
	
	.mainNavLogo {
		width: 40px;
		height: 32px;
	}
	
	.main_nav_icon:hover {
		font-weight: bold;
		font-size: 1.1em;
		cursor: Default;
		color: #4793d7;
	}
	
	.main {
		width: 50%;
		margin: 0 auto;
	}
	.mainTable{
		width: 100%;
		border: 1px solid gray;
	}
	.mainTable td {
		/* border: 1px solid black; */
	}
	.slide_td{
		text-align: center;
	}
	#dropdown03{
		color: black;
	}
</style>
</head>
<body>
	<!-- topNavbar -->
	<%@include file="../public/topNavbar.jsp"%>
	<!-- 마이페이지 프로필 부분 -->
	<div class="head" align="center">
		<table class="headTable">
			<tr>
				<td rowspan="4"><div style="height: 100%;">
						<img alt="프로필사진" src="resources/happysmile.jpg" width="150px"height="150px">
					</div></td>
				<td class="text_id">${name }</td>
				<td colspan="2" style="text-align: center;">
					<button class="btn btn-outline-dark" title="프로필 편집"><i class="bi bi-gear-fill"></i></button>&nbsp &nbsp
					<button class="btn btn-outline-dark" onclick="location.href='postWriteForm.html'" title="글쓰기"><i class="bi bi-pencil-fill"></i></button></td>
			</tr>
			<tr>
				<td colspan="3"><span>게시물 ${post }&nbsp &nbsp </span>
					<a class="following" href="#">팔로워 ${follower }&nbsp&nbsp </a>
					<a class="following" href="#">팔로우 ${follow }</a></td>
			</tr>
			<tr>
				<td colspan="4">${greeting} ${greeting} ${greeting}  ${greeting} ${greeting} ${greeting}</td>
			</tr>
		</table>
		<hr>
	</div>
	<!-- 마이페이지 네비바 -->
	<div class="main_nav" align="center">
		<span class="main_nav_icon"><i class="bi bi-grid-3x3-gap-fill"></i> 게시물</span>&nbsp
		&nbsp <span class="main_nav_icon"><i class="bi bi-bookmark-fill"></i> 북마크</span><hr>
	</div>
	<!-- 마이페이지 메인 -->
	<div class="main">
		<table	class="mainTable">
			<!-- 메인 헤더 -->
			<tr>
				<td rowspan="2" width="20%" align="center"><img alt="" src="resources/happysmile.jpg" width="40" height="32"></td>
				<td>${origin_member_id }</td>
				<td rowspan="2" width="20%" align="center">
				  <nav class="navbar navbar-expand-sm" aria-label="Third navbar example"> <!-- 수정,삭제 드롭다운 -->
   					 <div class="container-fluid">
					      <div class="collapse navbar-collapse" id="navbarsExample03">
					        <ul class="navbar-nav me-auto mb-2 mb-sm-0">
					          <li class="nav-item dropdown">
					            <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false" title="수정,삭제"><i class="bi bi-eraser-fill"></i></a>
					            <ul class="dropdown-menu" aria-labelledby="dropdown03">
					              <li><a class="dropdown-item" href="updateForm.html?postno=${postno }">수정</a></li>
					              <li><a class="dropdown-item" onclick="del(${postno})">삭제</a></li>
					            </ul>
					          </li>
					        </ul>
					      </div>
					     </div>
					   </nav>
					</td>
			</tr>
			<tr>
				<td>${crt_date }</td>
			</tr>
			<!-- 메인 본문 -->
			<tr><!-- 슬라이드뷰 -->
				<td class="slide_td" colspan="3"><img src="resources/happysmile.jpg" width="300px" height="300px;"></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	/* 게시글 삭제 함수 */
	function del(postno) {
		var cf = confirm("게시물을 삭제 하시겠습니까 ?");
		if (cf) location.href="delete.html?postno="+postno;
		else alert("취소 되었습니다!");
	};
	</script>
</body>
</html>

<!-- member_id varchar2(32)   primary key,					-- 아이디
pwd varchar2(50) not null,									-- 암호
name varchar2(32) not null,									-- 이름(별명)
email varchar2(32) not null,									-- 이메일
profile_pic varchar2(32),											-- 프로필사진
reg_date date not null,											-- 가입일
id_drop char(2)  default 'n' not null						-- 삭제여부 -->