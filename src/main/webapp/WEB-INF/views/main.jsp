<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ include file="header.jsp"%>
<html>
<head>
<title>Twinstabook - 트위터와 인스타그램과 페이스북으로부터</title>
<link href="resources/css/font.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	var curr = 0;
	$(document).ready(function(){
		$(".control>a").eq(curr).addClass('on').siblings().removeClass('on');
		$(".post-pics>div").eq(curr).addClass('on').siblings().removeClass('on');
	});
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
	/* @@임시@@ 게시글 삭제 함수 */
	function del(postno) {
		var cf = confirm("게시물을 삭제 하시겠습니까 ?");
		if (cf) location.href="delete.html?postno="+postno;
		else alert("취소 되었습니다!");
	};
</script>
<style type="text/css">
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
	font-size: 30px;
	margin-right: 15px;
	-webkit-text-stroke: 2px
}

.contentId-text {
	font-weight: bold;
}

.id-text {
	color: blue;
}

.id-text:hover {
	color: blue;
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

.overflow {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
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
	height: 18px;
	outline: 0;
	padding: 0;
	resize: none;
	width: 560px;
	overflow: hidden;
}

.post-pics {
	position: relative;
	overflow: hidden;
	height:612px;
}

.post-pics>div {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	transition: 0.3s ease;
	opacity: 0;
}

.post-pics>div.on {
	opacity: 1;
}

.control {
	position: absolute;
	width: 100%;
	bottom: 30px;
	text-align: center;
}

.control a {
	display: inline-block;
	width: 20px;
	height: 20px;
	background: #f6f5f5;
	line-height: 26px;
	font-size: 0.8em;
	border-radius: 14px;
	margin: 0 2px;
	cursor: pointer;
}

.control a.on{
	background: #9ab3f5;
}
</style>
</head>
<body>
	<!-- topNavbar -->
	<%@include file="public/topNavbar.jsp"%>
	<div class="container fixed-width margin-top" align="center">
		<div class="feed fixed-width">
			<div class="posts border">
				<c:if test="${not empty postList }">
					<c:forEach var="post" items="${postList}">
						<!-- 게시물 헤드 (프로필사진, 이름, 이메일) -->
						<div
							class="post_head p-2 d-flex justify-content-start border-bottom align-items-center">
							<a href="#" class="m-2 img-circle"> <img alt="프사"
								src="${path}/resources/${post.profile_pic}"></a>
							<div class="d-flex flex-column align-items-start">
								<a href="#" class="id-text font-default-size">${post.writer}</a>
								<a href="#" class="email-text font-default-size">${post.originWriter}</a>
							</div>
							<div>	<!-- @@@@@@@@@@@@@@@@임시@@@@@@@@@@@@@@@@@@@@-->
								<a href="updateForm.html?postno=${post.postno }">수정</a>
								<a onclick="del(${post.postno})">삭제</a>
							</div> <!-- @@@@@@@@@@@@@@@@임시@@@@@@@@@@@@@@@@@@@@-->
						</div>
						<!-- 게시물 내용(썸네일, 메뉴, 좋아요 현황, 댓글 목록, 댓글 입력 창 -->
						<div class="post_content">
							<!-- 게시물 썸네일 및 사진 목록 -->
							<c:if test="${not empty post.mediaList }">
								<!-- 슬라이드 뷰 -->
								<div class="post-pics post_pics_slide mb-1 border-bottom align-items-center ">
									<c:forEach var="media" items="${post.mediaList }">
										<div>
											<a href="#"><img class="fixed-width" alt="썸네일"
												src="${path}/resources/upload/${media.fileName}">
											</a>
										</div>
									</c:forEach><!-- post.media pics -->
									<section class="control">
										<c:forEach var="media" items="${post.mediaList }">
											
										</c:forEach><!-- post.media radio -->
									</section>
									<!-- control -->
								</div>
								<!-- post-pics -->
							</c:if>
							<!-- post.mediaList -->
							<div class="post_foot p-2">
								<!-- 좋아요, 댓글, DM 메뉴 버튼 -->
								<div class="post_menu d-flex justify-content-start mb-2	">
									<a href="#"><i class="bi bi-heart menu-icon"></i></a> <a
										href="#"><i class="bi bi-chat-left menu-icon"></i></a> <a
										href="#"><i class="bi bi-send menu-icon"></i></a>
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
								<!-- 게시물 내용(content) -->
								<div class="post_content" align="left">
									<c:if test="${!empty post.content }">
										<table class="font-default-size">
											<tr><th><a href="#" class="contentId-text">${post.origin_member_id }</a></th>
												<td>${post.content }</td>
										</table>
									</c:if>
								</div>
								<div class="post_replys font-default-size" align="left">
									<!-- 댓글 목록 -->
									<c:if test="${not empty post.replyList }">
										<table class="font-default-size">
											<c:forEach var="reply" items="${post.replyList}">
												<colgroup>
													<col width="50px">
													<col width="530px">
													<col width="20px">
												</colgroup>
												<tr>
													<td><a href="#" class="id-text">${reply.writer}</a></td>
													<td>${reply.content}</td>
													<!-- 댓글 좋아요 버튼 -->
													<td><input type="checkbox" id="like1" class="likes"
														name="like1" hidden="hidden"> <label
														class="cursor" onclick="likeReply()" for="like1"><i
															class="bi bi-heart"></i></label></td>
												</tr>
											</c:forEach>
											<!-- repylList -->
										</table>
									</c:if>
									<!-- replyList -->
									<!-- 댓글 입력창 -->
									<div class="post_reply_input d-flex align-items-center">
										<form action="replyInsert.html" onsubmit="return rply_chk()"
											id="reply_form" name="reply_form"
											class="m-0 p-0 d-flex align-items-baseline">
											<input type="hidden" name="sessionId"
												value="${sessionMem.member_id}"> <input
												type="hidden" name="postNo" value="${post.postno}">
											<textarea id="reply_input" name="reply_input"
												class="reply_input" placeholder="댓글 달기..."></textarea>
											<input id="reply_submit" type="submit" name="reply_submit"
												class="reply-submit-btn" value="게시" disabled="disabled">
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
					</c:forEach>
					<!-- postList -->
				</c:if>
				<!-- postList -->
			</div>
		</div>
		<!-- feed -->
	</div>
	<!-- container -->
</body>
</html>