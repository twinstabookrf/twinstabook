<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/signUpForm.css" rel="stylesheet" type="text/css">
<style>
	.drag-over {background : yellow;}
	.thumb{width: 200px; padding: 5px; float:left;}
	.thumb > img{width :100%;}
	.thumb > .close {position: absolute; background : red; cursor : pointer;}
	#drop  {border : 1px solid black; width : 300px; height : 200px; padding : 3px;}
</style>
<script type="text/javascript">

function chkPW(){
	
	 var pw = $("#password").val();
	 var id = $("#id").val();
	 var name = $("#name").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(id.length <2 || id.length >16 ){
			alert("아이디는 2자리~16자리 이내로 입력해 주세요.");
			return false;
	 }
	 else if(pw.length < 4 || pw.length > 20){
		  alert("비밀번호는 4자리 ~ 20자리 이내로 입력해주세요.");
		  return false;
	 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
		  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		  return false;
	}else if (name.length <2 || name.length >16 ){
		alert("닉네임은 2자리~16자리 이내로 입력해 주세요.");
		return false;
	 }else {
		console.log("통과"); 
	    return true;
	 }

	}
	function idChk(){
		if (!frm.id.value){
			alert("아이디를 입력한 후 체크하세요."); frm.id.focus();
			return false;            //action nono
		}
		// id ajax
		$.post('idChk.html', "member_id="+frm.member_id.value, function(data){
			$('#idChk1').html(data);
		});
		
	}
	
		function chk(){
			
			if(!chkPW()){
				return false;
			}else if(frm.pwd.value != frm.pwd2.value){
				alert("암호와 암호확인이 다릅니다."); frm.pwd.focus();
				frm.pwd.value =""; frm.pwd2.value ="";
				return false;
				
		}
	} 
	
</script>
</head>
<body>
	<main>
	<form action="signUp.html" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
		<div><img alt="썸네일" src="${path}/resources/logo/logo-img-w.png"></div>
		<div class="logo">Twinstabook</div> 
			<div class="sign-form">
					<input type="text" id="id" name="member_id" placeholder="사용자 아이디">
					<input type="button" value="중복체크" onclick="idChk()">
					<div id="idChk1" class="err"></div>
			</div> 
			<div class="sign-form">
				<input type="password" id="password" name="pwd" placeholder="비밀번호" required="required">
			</div>
			<div class="sign-form">
				<input type="password" id="password2" name="pwd2" placeholder="비밀번호 확인" required="required">
			</div>
			<div class="sign-form">
				<input type="text" id="name" name="name" placeholder="닉네임 (실제사용되는 닉네임입니다.)" required="required">
			</div>
			<div class="sign-form">
				<input type="email" id="email" name="email" placeholder="email" required="required">
			</div>
			<div class="sign-form">
				<select name="ask" id="ask" required="required">
					<option value="" selected>비밀번호 힌트</option>
					<option value="1">제1호 보물</option>
					<option value="2">졸업한 초등학교</option>
					<option value="3">자신의 첫 직장</option>						
				</select>
			</div>
			<div class="sign-form">
				<input type="text" id="answer" name="answer" placeholder="비밀번호 힌트 답변" required="required">
			</div>
		<input type="submit" class="btn btn-primary" value="가입하기">
		</form>
	</main>
</body>
</html>