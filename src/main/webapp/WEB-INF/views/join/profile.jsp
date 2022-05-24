<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file=../header.jsp %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/profile.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function del(){
		var con =confirm("정말 탈퇴하시겠습니까?");
		if (con) location.href="delete1.html";
		else{
			alert("탈퇴가 취소되었습니다.");
			return;
		}
	}
</script>
</head>
<body>
	<main>
		<div><img class="img" alt="썸네일" src="${path}/resources/logo/logo-img-w.png"></div>
		<div class="logo">Twinstabook</div> 
			<div>
				<input type="text" readonly  value="${member.member_id }님" >
			</div>
			<div>
				<input type="button" class="btn btn-primary" value="프로필 수정" onclick="location.href='updateForm1,html'">
			</div>
				<div>
				<input type="button" class="btn btn-primary" value="로그아웃" onclick="location.href='logout.html'">
			</div>	
				<div>
				<input type="button" class="btn btn-primary" value="탈퇴하기" onclick="del()">
			</div>	
	</main>

</body>
</html>