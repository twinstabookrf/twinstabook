<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/postWriteForm.css" rel="stylesheet" type="text/css">
<link href="resources/css/font.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function chk() {
		if (frm.file.value == "" && frm.content.value == "") {
			alert("파일을 첨부하거나 내용을 입력해 주세요 ! :)");
			return false;
		}
	}
	window.onload = function(){		// 파일 업로드하면 밑에 파일명 보여주기
        target = document.getElementById('file');
        target.addEventListener('change', function(){
            fileList = "";
            for(i = 0; i < target.files.length; i++){
                fileList += target.files[i].name + '<br>';
            }
            target2 = document.getElementById('showFiles');
            target2.innerHTML = fileList;
        });
	}
</script>
</head>
<body>
	<!-- topNavbar -->
	<%@include file="../public/topNavbar.jsp" %>
	
	<div class="container" align="center">
		<form action="updateForm.html" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
<<<<<<< HEAD
			<input type="hidden" name="postno" value="${post.postno }">
				<table id="table" class="table table-hover">
				<caption>게시물 수정</caption>
					<%-- <tr>
						<td colspan="2">${member.profile_pic}${member.member_id}</td>
					</tr> --%>
					<tr>
						<th>파일</th>
						<td><input class="form-control" id="file" type="file" name="file" multiple="multiple">
							 <div id="showFiles">
							 	<c:forEach items="${media }" var="media">
							 		${media.fileName }
							 	</c:forEach></div></td>
					</tr>
					<tr>
						<th>내용<br><br><sup>(<span id="nowByte">0</span>/2000bytes)</sup></th>
						<td><textarea  class="form-control" id="content" rows="5" cols="55" name="content" maxlength="1000"
							placeholder="내용을 입력하세요." onkeyup="fn_checkByte(this)">${post.content }</textarea></td>
=======
			<input type="hidden" name="postno" value="${list.postno }">
				<table id="table" class="table table-hover">
				<caption>게시물 수정</caption>
					<%-- <tr>
						<td colspan="2">${member.profile_pic}${member.member_id}</td>
					</tr> --%>
					<tr>
						<th>파일</th>
						<td><input class="form-control" id="file" type="file" name="file" multiple="multiple">
							 <div id="showFiles">${list.filename }</div></td>
					</tr>
					<tr>
						<th>내용<br><br><sup>(<span id="nowByte">0</span>/2000bytes)</sup></th>
						<td><textarea  class="form-control" id="content" rows="5" cols="55" name="content" maxlength="1000"
							placeholder="내용을 입력하세요." onkeyup="fn_checkByte(this)">${list.content }</textarea></td>
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
					</tr>
					<tr>
						<td colspan="2" align="center"><input class="btn btn-sm btn-outline-dark" type="submit" value="수정"></td>
					</tr>
				</table>
		</form>
	</div>

<script type="text/javascript">
//textarea 바이트 수 체크하는 함수
function fn_checkByte(obj){
    const maxByte = 2000; //최대 2000바이트
    const text_val = obj.value; //입력한 문자
    const text_len = text_val.length; //입력한 문자수

    let totalByte=0;
    for(let i=0; i<text_len; i++){
        const each_char = text_val.charAt(i);
        const uni_char = escape(each_char) //유니코드 형식으로 변환
        if(uni_char.length>4){
            // 한글 : 2Byte
            totalByte += 2;
        }else{
            // 영문,숫자,특수문자 : 1Byte
            totalByte += 1;
        }
    }
    
    if(totalByte>maxByte){
        alert('최대 2000Byte까지만 입력가능합니다.');
        document.getElementById("nowByte").innerText = "2000";
        document.getElementById("nowByte").style.color = "red";
    }else{
        document.getElementById("nowByte").innerText = totalByte;
        document.getElementById("nowByte").style.color = "white";
    }
}
</script>
</body>
</html>