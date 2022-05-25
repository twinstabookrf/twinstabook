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
<link href="resources/css/updateForm3.css" rel="stylesheet" type="text/css">
<style>
	.drag-over {background : yellow;}
	.thumb{width: 200px; padding: 5px; float:left;}
	.thumb > img{width :100%;}
	.thumb > .close {position: absolute; background : red; cursor : pointer;}
	#drop  {border : 1px solid black; width : 300px; height : 200px; padding : 3px;}
</style>
<script type="text/javascript">
	$(document).on("drop",function(e){ 
		$('input[type="file"]').prop("files", e.originalEvent.dataTransfer.files);
	});
	
	$(function(){
		var uploadfiles = []; //복수의 파일도 가능
		var $drop = $('#drop');
		$drop.on("dragenter",function(e){
			$('#thumbnails').text("");
			$(this).addClass("drag-over");
		}).on("dragleave",function(e){
			$('thumbnails').text("그림 올려놓으세요");
			$(this).removeClass("drag-over");	
		}).on("dragover",function(e){	//그림을 올려놓았을때
			e.stopPropagation();	//이벤트를 전달하지마라
			e.preventDefault();     //원래 기능을 하지마라
		}).on("drop",function(e){
			e.preventDefault();
			$(this).removeClass("drag-over");
			var files = e.originalEvent.dataTransfer.files;   //드래그 그림들
			for(var i = 0 ; i < files.length; i++){
				var file = files[i];
				 var size = uploadfiles.push(file);  //업로드 파일 목록배열
				 preview(file);            //미리보기
			}
		});
		
		// X 클릭한 그림 삭제
		$('thumbnails').on('click',function(e){
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			$target.parent().remove();
		});
	});
	function preview(file){
		var reader = new FileReader();
		reader.onload = (function (f){
			return function(e){
				var div= "<div class='thumb'><div class='close'>X</div><img src='"+e.target.result+"'/><div>'";
				$('thumbnails').append(div);
			}
		})(file);
		reader.readAsDataURL(file);  //readasdata = 컨텐츠를 특정  blob 이나 file에서 불러
	}
		function chk(){
			if(frm.pwd.value != frm.pwd2.value){
				alert("암호와 암호확인이 다릅니다."); frm.pwd.focus();
				frm.pwd.value =""; frm.pwd2.value ="";
				return false;
		}
	} 
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
	<form action="update1.html" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
		<div><img alt="썸네일" src="${path}/resources/logo/logo-img-w.png"></div>
		<div class="logo">Twinstabook</div> 
		<input type="hidden" name="member_id" value="${member.member_id }">
			<div class="update-form">
					<input type="text" id="id" name="member_id" readonly value="${member.member_id }" style="text-align:center; font-weight:bolder">
			</div> 
			<div class="update-form">
				<div id="one">
					<span>비밀번호</span>&nbsp;&nbsp;<input type="password" id="password" name="pwd" placeholder="비밀번호"  autofocus="autofocus">
				</div>
			</div>
			<div class="update-form">
				<input type="password" id="password2" name="pwd2" placeholder="비밀번호 확인">
			</div>
			<div class="update-form">
				<div id="two">
					<span>닉네임</span>&nbsp;&nbsp;<input type="text" id="name" name="name" value="${member.name }" >
				</div>
			</div>
			<div class="update-form">
				<div id="three">
					<span>이메일</span>&nbsp;&nbsp;<input type="email" id="email" name="email" value="${member.email }" >
				</div>
			</div>
			<div class="update-form">
				<div id="four">
					<span>힌트 선택</span>&nbsp;&nbsp;<select name="ask" id="ask" >
						<option value="" selected>비밀번호 힌트</option>
						<option value="1">제1호 보물</option>
						<option value="2">졸업한 초등학교</option>
						<option value="3">자신의 첫 직장</option>						
					</select>
				</div>
			</div>
			<div class="update-form">
				<div id="five"><span>힌트 답변</span>&nbsp;&nbsp;<input type="text" id="answer" name="answer" placeholder="비밀번호 힌트 답변"></div>
			</div>
		    <div>
				<div id="six">
					<span>프로필 사진</span>&nbsp;&nbsp;<input type="file" name="file">
				</div>	
			</div>
				<input type="submit" class="btn btn-primary" value="변경하기">		
		</form>
		<div>
			<input  type="button" class="delete" value="탈퇴하기" onclick="del()">
		</div>	
	</main>
</body>
</html>