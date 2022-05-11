<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="header.jsp"%>
<html>
<head>
<title>Twinstabook - 트위터와 인스타그램과 페이스북으로부터</title>
<link href="resources/css/font.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.fixed-width {width: 612px;}
	.img-circle {width: 50px;	height: 50px;	border-radius: 70%;	overflow: hidden;}
	.img-circle img{width: 100%;height:100%;object-fit: cover;}
</style>
</head>
<body>
<div class="register">
        <h3>회원가입</h3>
        <form action="">
            <div class="flex">
                <ul class="container">
                    <li class="item center">
                        이름
                    </li>
                    <li class="item">
                        <input type="text" name="name" autofocus required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        아이디
                    </li>
                    <li class="item">
                        <input type="text" placeholder="아이디를 입력하세요." required>
                    </li>
                    <li class="item">
                        <button class="idcheck">중복확인</button>
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        비밀번호
                    </li>
                    <li class="item">
                        <input type="password" placeholder="비밀번호를 입력하세요." required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        비밀번호 확인
                    </li>
                    <li class="item">
                        <input type="password" placeholder="비밀번호를 입력하세요." required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        생년월일
                    </li>
                    <li class="item">
                        <input type="date" required>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        성별
                    </li>
                    <li class="item">
                        <select name="gender" id="">
                            <option value="선택" selected>선택</option>
                            <option value="남성">남성</option>
                            <option value="여성">여성</option>
                        </select>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        전화번호
                    </li>
                    <li class="item">
                        <input type="text" placeholder="휴대전화번호">
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
                <ul class="container">
                    <li class="item center">
                        
                    </li>
                    <li class="item">
                        <button class="submit">가입하기</button>
                    </li>
                    <li class="item">
                        
                    </li>
                </ul>
            </div>
        </form>
    </div>
 </body>
</html>
