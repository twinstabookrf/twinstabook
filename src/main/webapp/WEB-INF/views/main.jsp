<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Twinstabook - 트위터와 인스타그램과 페이스북으로부터</title>
<link href="resources/css/font.css" rel="stylesheet" type="text/css">
<script src="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script type="text/javascript">
/* 게시글 삭제 함수 */
function del(postno) {
	var cf = confirm("게시물을 삭제 하시겠습니까 ?");
	if (cf) location.href="delete.html?postno="+postno;
	else alert("취소 되었습니다!");
};
/* 작성자 이름 누르면 writerPage로 가는 함수 */
function writerPage(name) {
	location.href="writerPage.html?name="+name;
}
/* ReTwin 하는 함수 */
function reTwin(postno) {
	var cf = confirm("ReTwin 하시겠습니까 ?");
	if (cf) location.href="reTwinForm.html?postno="+postno;
	else alert("취소 되었습니다!");
}
$( document ).ready( function() {
    $( '.slider' ).bxSlider();
  } );
$(function() {
	// 댓글창 초기 설정 event listener 추가하기
	$('#reply_input').keydown(function(event) {// 키가 눌릴 때
		if (event.keyCode == 13) {// enter면서
			if (!event.shiftKey) { // shift가 안눌린상태면
				event.preventDefault();// enter 입력 무시
				$('#reply_submit').click();// submit
			}
			// enter면서 shift가 눌리면  개행
		}

		else if ($('#reply_input').val() != "") {
			$('#reply_submit').attr("disabled", false);
		}
		// 댓글 입력창이 비어있으면 submit disable
		else {
			$('#reply_submit').attr("disabled", true);
		}
		adjustHeight();// 어쨌든 키가 눌릴 때 마다 크기 조절
	});
});
/* textare 자동 크기조절 함수 */
function adjustHeight() {
	var textEle = $('#reply_input');
	textEle[0].style.height = 'auto';
	var textEleHeight = textEle.prop('scrollHeight');
	textEle.css('height', textEleHeight);
};
</script>
<style>
	.head {
		width: 40%;
		margin: 0 auto;
		padding-top: 50px;
		padding-bottom: 10px;
		margin-top: 50px;
	}
	
	.headTable {
		margin: auto;
		width: 100%;
	}
	
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
		width: 40%;
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
	
	.proImg {
		width: 150px;
	    height: 150px; 
	    border-radius: 70%;
	    overflow: hidden;
	}
	
	.profile{
		width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	
	/* 메인부분 */
	.space{
		padding-top: 100px;
	}
	.main {
		width: 40%;
		margin: 0 auto;
		border: 1px solid #dcdcdc;
		margin-bottom: 15px;
	}
	#dropdown03{
		color: black;
	}
	body {
		font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
			Helvetica, Arial, sans-serif;
	}

	a {
		color: black;
		text-decoration: none;
	}
	
	a:hover {
		color: black;
	}
	
	.align-items-center {
		align-items: center !important
	}
	
	.fixed-width {
		width: 612px;
	}
	
	.img-circle {
		width: 42px;
		height: 42px;
		border-radius: 70%;
		overflow: hidden;
	}
	
	.img-circle-small {
		width: 14px;
		height: 14px;
		margin-right: 5px;
	}
	
	.img-circle img {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.menu-icon {
		font-size: 25px;
		margin-right: 15px;
		-webkit-text-stroke: 2px
	}
	
	.mId-text {
		font-size: 16px;
		font-weight: bold;
		color: #4793d7;
		cursor: pointer;
	}
	
	.mId-text:hover {
		color: #4793d7;
	}
	
	#wiretet-name {
		width: 100%
	}
	
	.id-text {
		color: #4793d7;
	}
	
	.id-text:hover {
		color: #4793d7;
	}
	
	.font-default-size {
		font-size: 14px;
	}
	
	.margin-top {
		margin-top: 72px;
	}
	
	.cursor {
		cursor: pointer;
	}
	
	.twinCor{
		color: #4793d7;
	}
	
	.twinCor:hover{
		color: #4793d7;
	}
	
	.overflow {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	.crt_date-text {
		font-size: 0.8em;
		color: #828282;
	}
	
	.crt_date-text:hover {
		color: #828282;
	}
	
	.modDel{
		float: right;
	}
	
	.email-text {
		color: #828282;
	}
	
	.email-text:hover {
		color: #828282;
	}
	
	.reply-submit-btn {
		border: 0;
		background-color: white;
		color: #0095f6;
	}
	
	.reply-submit-btn:disabled {
		color: #8095f6;
	}
	
	.reply_input {
		position: relative;
		background: 0 0;
		border: 0;
		color: #262626;
		color: rgba(var(- -i1d, 38, 38, 38), 1);
		height: 20px;
		outline: 0;
		padding: 0;
		resize: none;
		overflow: hidden;
		width: 100%;
	}
	
	#reply_table #rpText{
		width: 700px;"
	}
	
	.content-box {
		width: 95%;
		margin: 0 auto;
		padding: 20px 0;
	}
	
	.fontSize16 {
		font-size: 16px;
	}
	
	.fontSize20 {
		font-size: 20px;
	}
	
	.post-pics {
		position: relative;
		overflow: hidden;
	}
	
	.fixed-square {
		width: 612px;
		height: 612px;
	}
	
	.thumnail {
		cursor: pointer;
	}
	
	.noPost {
		padding-top: 50px;
		margin: 0 auto;
		width: 40%;
		text-align: center;
	}
	
	.noPost i {
		font-size: 200px;
	}
	
	.noPost span {
		font-size: 30px;
		font-weight: bold;
	}
	
	.topNavbar{
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 100;
	}
	
	.crtMod{
		margin-top: 8px;
	}
	
	#reTwinBtn{
		font-size: 1.3em;
		font-weight: bold;
		cursor: pointer;
	}
	
	.rt1{
		float: right;
	} 
	
	.rtId{
		font-size: 1.1em;
		font-weight: boid;
		color: black;
		cursor: pointer;
	}
	
	.rtCo{
		font-size: 0.8em;
		color: gray;
	}
	
	.rts{
		font-size: 0.8em;
		color: gray;
		float: right;
	}
</style>
</head>
<body>
	<!-- topNavbar -->
	<div class="topNavbar"><%@include file="public/topNavbar.jsp"%></div>
	<!-- 메인 네이바에 가려져서 띄우기용 -->
	<div class="space"></div>
	<!-- 마이페이지 메인 -->
	<c:if test="${!empty postList }">
		<c:forEach var="post" items="${postList}">
			<div class="main">
				<!-- 게시물 헤드 (프로필사진, 이름, 작성일, 수정-삭제) -->
				<div class="post_head p-2 d-flex justify-content-start border-bottom align-items-center">
					<a href="#" class="m-2 img-circle"> <img alt="프사" src="${path}/resources/${post.profile_pic}"></a>
					<div class="d-flex flex-column align-items-start" id="wiretet-name" >
						<a class="mId-text" onclick="writerPage('${post.name}')">${post.name}</a>
					</div>
					<!-- 내가 쓴 글일 때 -->
					<c:if test="${member_id eq post.member_id }">
						<!-- 게시물을 쓴 사람과 rt원작글의 사람이 같으면 -->
						<c:if test="${post.name eq post.origin_name }">
							<div class="modDel">
								<nav class="navbar navbar-expand-sm" aria-label="Third navbar example"> <!-- 수정,삭제 드롭다운 -->
				   					<div class="container-fluid">
										<div class="collapse navbar-collapse" id="navbarsExample03">
											<ul class="navbar-nav me-auto mb-2 mb-sm-0">
												<li class="nav-item dropdown">
													<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false" title="수정,삭제"><i class="bi bi-eraser-fill"></i></a>
												<ul class="dropdown-menu" aria-labelledby="dropdown03">
													<li><a class="dropdown-item" href="updateForm.html?member_id=${member.member_id }&postno=${post.postno}">수정</a></li>
													<li><a class="dropdown-item" onclick="del(${post.postno})">삭제</a></li>
												</ul>
												</li>
											</ul>
										</div>
									</div>
								</nav>
							</div>
						</c:if>
						<!-- 게시물을 쓴 사람과 rt원작글의 사람이 다르면 -->
						<c:if test="${post.name ne post.origin_name }">
							<div class="modDel">
								<nav class="navbar navbar-expand-sm" aria-label="Third navbar example"> <!-- 수정,삭제 드롭다운 -->
				   					<div class="container-fluid">
										<div class="collapse navbar-collapse" id="navbarsExample03">
											<ul class="navbar-nav me-auto mb-2 mb-sm-0">
												<li class="nav-item dropdown">
													<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-bs-toggle="dropdown" aria-expanded="false" title="수정,삭제"><i class="bi bi-eraser-fill"></i></a>
												<ul class="dropdown-menu" aria-labelledby="dropdown03">
													<li><a class="dropdown-item" href="rtUpdateForm.html?name=${post.name }&postno=${post.postno}">수정</a></li>
													<li><a class="dropdown-item" onclick="del(${post.postno})">삭제</a></li>
												</ul>
												</li>
											</ul>
										</div>
									</div>
								</nav>
							</div>
						</c:if>
					</c:if>
					<!-- 본인의 게시글이 아니면 생기는 rt버튼 -->
					<c:if test="${post.member_id ne member_id }">
						<div class="reTwin">
							<a onclick="reTwin('${post.postno}')" title="RT"><i class="bi bi-bootstrap-reboot" id="reTwinBtn"></i>&nbsp</a>
						</div>
					</c:if>
				</div>
				<!-- rt게시물 원작자 표시 -->
				<c:if test="${post.name ne post.origin_name }">
					<div class="rt1">
						<span class="rtId">
							<img src="${path}/resources/logo/logo-img-w.png" width="15px" height="15px">
							<a onclick="writerPage('${post.origin_name}')">${post.origin_name }</a>
						</span>
						<span class="rtCo">님의 게시물을 ReTwin&nbsp</span>
					</div><br>
				</c:if>
				<!-- 게시물 글내용 -->
				<c:if test="${!empty post.content }">
					<c:if test="${empty post.mediaList }">
						<div class="content-box" align="left">
							<table class="font-default-size content-table">
								<tr>
									<td class="content fontSize20">${post.content }</td>
								</tr>
							</table>
						</div>
					</c:if>
					<c:if test="${!empty post.mediaList }">
						<div class="content-box" align="left">
							<table class="font-default-size content-table">
								<tr>
									<td class="content fontSize16">${post.content }</td>
								</tr>
							</table>
						</div>
					</c:if>
				</c:if>
				<!-- 게시물 내용(썸네일, 메뉴, 좋아요 현황, 댓글 목록, 댓글 입력 창 -->
				<div class="post_content">
					<!-- 게시물 썸네일 및 사진 목록 -->
					<c:if test="${not empty post.mediaList }">
						<!-- 슬라이드 뷰 -->
						<div class="post-pics post_pics_slide mb-1 border-bottom align-items-center slider">
							<c:forEach var="media" items="${post.mediaList }">
								<div class="align-items-center">
									<img class="thumnail w-100" alt="썸네일"
										src="${path}/resources/upload/${media.fileName}">
								</div>
							</c:forEach><!-- post.media pics -->
						</div> 
						<!-- post-pics -->
					</c:if>
					<!-- rtContent가 있을 시 -->
					<c:if test="${!empty post.reTwinList }">
						<c:forEach var="reTwin" items="${post.reTwinList}">
							<div class="content-box" align="left">
								<table class="font-default-size content-table">
									<tr>
										<c:if test="${reTwin.name eq post.name}">
											<td>
												<a class="twinCor cursor" onclick="writerPage('${reTwin.name}')"><i class="bi bi-twitter"></i> ${reTwin.name }</a>&nbsp
											</td>
										</c:if>
										<c:if test="${reTwin.name ne post.name}">
											<td>
												<a class="cursor" onclick="writerPage('${reTwin.name}')"><i class="bi bi-twitter"></i> ${reTwin.name }</a>&nbsp
											</td>
										</c:if>
										<td class="content fontSize16">${reTwin.rtContent }</td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:if>
					<!-- post.mediaList -->
					<div class="post_foot p-2">
						<!-- 좋아요, 댓글, DM 메뉴 버튼 -->
						<div class="post_menu d-flex justify-content-start mb-2	">
							<a href="#"><i class="bi bi-heart menu-icon"></i></a> 
							<a href="#"><i class="bi bi-chat-left menu-icon"></i></a>
							<a href="#"><i class="bi bi-send menu-icon"></i></a>
						</div>
						<!-- 첫번째 좋아요 사용자 외 XX명이 좋아합니다 -->
						<div
							class="post_likes font-default-size d-flex flex-row align-items-center"
							align="left">
							<a href="#" class="img-circle img-circle-small"> <img
								alt="프사" src="${path}/resources/happysmile.jpg"></a> <a
								href="#" class="id-text font-default-size">${post.firstLike}</a>
							외 <a href="#">${post.likes}</a>명이 좋아합니다
						</div>
						<div class="post_replys font-default-size" align="left">
							<!-- 댓글 목록 -->
							<c:if test="${!empty post.replyList }">
								<table class="font-default-size">
									<c:forEach var="reply" items="${post.replyList}">
								 		<!-- <colgroup>
											<col width="50px">
											<col width="530px">
											<col width="20px">
										</colgroup> -->
										<tr>
											<td style="width: 5%"><a href="#" class="id-text">${reply.writer}&nbsp</a></td>
											<td style="width: 100%">${reply.content}</td>
											<!-- 댓글 좋아요 버튼 -->
											<td style="width: 5%"><input type="checkbox" id="like1" class="likes" name="like1" hidden="hidden">
												<label class="cursor" id="replyLike" onclick="reply_submit()" for="like1"><i class="bi bi-heart"></i></label></td>
										</tr>
									</c:forEach>
									<!-- repylList -->
								</table>
							</c:if>
							<!-- 작성일/수정일 -->
							<div class="crtMod">
								<c:if test="${post.mdf_date eq null }">
									<a href="#" class="crt_date-text font-default-size">작성일 : ${post.crt_date}</a>
								</c:if>
								<c:if test="${post.mdf_date ne null }">
									<a href="#" class="crt_date-text font-default-size">수정일 : ${post.mdf_date}</a>
								</c:if>
								<span class="rts">RT횟수 : ${post.rts }</span>
							</div>
							<hr>
							<!-- replyList -->
							<!-- 댓글 입력창 -->
							<div class="post_reply_input d-flex align-items-center">
								<form action="replyInsert.html" onsubmit="return rply_chk()" id="reply_form" 
									name="reply_form" class="m-0 p-0 d-flex align-items-baseline">
									<input type="hidden" name="sessionId" value="${member.member_id}">
									<input type="hidden" name="postNo" value="${post.postno}">
									<table id="reply_table">
										<tr>
											<td id="rpText">
												<textarea id="reply_input" name="reply_input" class="reply_input" placeholder="댓글 달기..."></textarea>
											</td>
											<td id="rpSubmit">
												<input id="reply_submit" type="submit" name="reply_submit" class="reply-submit-btn" value="게시" disabled="disabled">
											</td>
										</tr>
									</table>
								</form>
							</div>
							<!-- post_reply_input -->
						</div>
						<!-- post_replys -->
					</div>
					<!-- post_foot -->
				</div>
				<!-- post_content -->
				<!-- posts -->
			</div>
		</c:forEach>
		<!-- postList -->
	</c:if>
</body>
</html>