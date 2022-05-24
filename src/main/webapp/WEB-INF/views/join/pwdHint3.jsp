<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${result > 0 }">
	<script type="text/javascript">
	</script>
</c:if>
<c:if test="${result < 0 }">
	<script type="text/javascript">
		alert("비밀번호 정답이 다릅니다.");
		history.back();
	</script>
</c:if>
<script type="text/javascript">
function chk(){
	if(frm.pwd.value != frm.pwd2.value){
		alert("암호와 암호확인이 다릅니다."); frm.pwd.focus();
		frm.pwd.value =""; frm.pwd2.value ="";            //기존 작성했던 비밀번호와 비밀번호확인 지우고싶을때
		return false;
	}
} 
</script>
<link href="resources/css/pwdHint3.css" rel="stylesheet" type="text/css">
</head>
<body>

	<main>
		<form action="pwdHint4.html" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
			<div><img class="img" alt="썸네일" src="${path}/resources/logo/logo-img-w.png"></div>
			<input type="hidden" name="member_id" value="${member.member_id }">
			<div class="logo">Twinstabook</div> 
			<div class="hint-form">
				<input type="password" id="password" name="pwd" placeholder="새로운 비밀번호" required="required">
			</div>
			<div class="hint-form">
				<input type="password" id="password2" name="pwd2" placeholder="비밀번호 확인" required="required">
			</div>
			<input type="submit" class="btn btn-primary" value="변경하기">
		</form>
	</main>
</body>
</html>