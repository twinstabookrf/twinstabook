<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/pwdHint2.css" rel="stylesheet" type="text/css">
</head>
<body>
<c:if test="${result > 0 }">
		<script type="text/javascript">
		</script>
	</c:if>
	<c:if test="${result < 0 }">
		<script type="text/javascript">
			alert("없는 아이디 입니다.");
			history.back();
		</script>
</c:if>
	<main>
		<form class="login" method="post" action="pwdHint3.html">
			<input type="hidden" name="member_id" value="${member.member_id }">
			<div class="img"><img alt="썸네일" src="${path}/resources/logo/logo-img-w.png"></div>
			<div class="logo">Twinstabook</div> 
			<%-- <input type="text" id="id" name="member_id"  readonly value="${member.member_id} "> --%>
			<span>${member.member_id}</span>
			<div class="hint-form">
				<div class="pwdHint">
					<c:if test="${member.ask==1 }">
							제 1호 보물
					</c:if>
					<c:if test="${member.ask==2 }">
							졸업한 초등학교
					</c:if>
					<c:if test="${member.ask==3 }">
							자신의 첫 직장
					</c:if>
						
				</div>
					<input type="text" id="answer" name="answer" required="required" placeholder="비밀번호 힌트 답변">
			</div> 
			<button type="submit" class="btn btn-primary">비밀번호 찾기</button>
		</form>
	</main>
</body>
<script>

// function checkHint(){
   
// 	var params = {
//             id        : $("#id").val()
//           , ansert       : $("#answer").val()
//   }      

//   $.ajax({
//       type : "POST",           
//       url : "pwdHint3.html",      
//       data : {member_id :$("#id").val() },           
//       success : function(data){ 
//          alert(data);
      
//       },
//   });
	
// }
</script>
</html>