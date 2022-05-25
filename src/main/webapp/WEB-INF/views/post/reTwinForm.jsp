<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Twinstabook - 트위터와 인스타그램과 페이스북으로부터</title>
<link href="resources/css/postWriteForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- topNavbar -->
<%@include file="../public/topNavbar.jsp" %>
<div class="container" align="center">
	<form action="reTwin.html" method="post">
		<input type="hidden" name="postno" value="${postno }">
		<table id="table" class="table table-hover">
			<caption>ReTwin 작성</caption>
			<tr>
				<th>내용<br><br><sup>(<span id="nowByte">0</span>/2000bytes)</sup></th>
				<td><textarea  class="form-control" id="rtContent" rows="5" cols="55" name="rtContent" maxlength="1000"
					placeholder="내용을 입력하세요." onkeyup="fn_checkByte(this)"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input class="btn btn-sm btn-outline-dark" type="submit" value="작성"></td>
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