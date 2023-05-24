<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <title>Treasure</title>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="application/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
            charset="utf-8"></script>
<style>
@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

*{
	font-family: "GmarketSansMedium";
}

div.main {
	font-family: "GmarketSansMedium";
	font-size: 13px;
	padding: 0;
	margin: 0;
	border: none;
}

.login-wrapper {
	width: 480px;
	padding: 40px;
	box-sizing: border-box;
	margin-left: 33%;
	margin-top: 20px;
	line-height: 30px;
}

.login-wrapper>h2 {
	font-size: 25px;
	margin-bottom: 20px;
	text-align: center;
	margin-top: 30px;
	margin-bottom: 50px;
}

#login-form>input:not(#btn-login) {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#login-form>input::placeholder {
	color: #D2D2D2;
}

#login-form>input[type="checkbox"] {
	display: none;
}

#login-form>label {
	color: #babbbc;
}

#login-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-repeat: no-repeat;
	background-size: contain;
}

#login-form input[type="checkbox"]:checked+label {
	background-repeat: no-repeat;
	background-size: contain;
}

#btn-login {
	font-size: 14px;
	color: #fff;
	background-color: #747f55;
	padding: 5px 20px;
	border-radius: 10px;
	font-weight: 400;
	text-transform: capitalize;
	letter-spacing: 0.5px;
	transition: all 0.3s;
	position: relative;
	overflow: hidden;
	margin-top: 15px;
	width: 100%;
	text-align: center;
}

#btn-login:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

#sub-menu {
	margin-left: 30px;
	margin-top: 5px;
	color: #495057;
}

#sub-menu span {
	padding-right: 30px;
}

#sub-menu span:not(.bar) {
	cursor: pointer;
}

#btn-api {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	margin: auto;
}

.btn {
	margin: auto;
	cursor: pointer;
}
</style>
<script>
	$(document).ready(function() {
		$(".submitBtn").click(function() {
			let email = $("#email").val();
			let password = $("#password").val();
			$.ajax({
				type : "get",
				url : "loginError",
				data : {
					"email" : email,
					"password" : password
				},
				success : function(res) {
					if (res == 0) {
						alert("이메일 혹은 비밀번호를 확인해주세요");
					}
				}
			});
		});
	});
</script>
</head>
<body>
<div class="login-wrapper">
    <h2><i>로그인</i></h2>
    
    <form method="post" action="loginProc" id="login-form">
        이메일 주소
        <input type="text" name="email" id="email" placeholder="Email" required="required"
               value="${sessionScope.saveOk==null?"":sessionScope.loginEmail }">
        <span>${valid_email}</span>
        비밀번호
        <input type="password" name="password" id="password" placeholder="Password" required="required">
        <label for="remember-check">
            <input type="checkbox" id="remember-check" name="saveOk" style="cursor: pointer; float: left"
                   name="${sessionScope.saveOk==null?"":"checked"}">
        </label>
        <div style="margin-top: 13px; float: left">아이디 저장하기</div>

        <input type="submit" value="Login" id="btn-login" class="submitBtn" style="cursor: pointer;">
        <div id="sub-menu">
            <span onclick="location.href='joinForm'">회원 가입</span><span class="bar">|</span>
            <span onclick="location.href='emailSearchForm'">이메일 찾기</span><span class="bar">|</span>
            <span onclick="location.href='passSearchForm'">비밀번호 찾기</span>
        </div>
        <div id="btn-api" style="margin-top: 30px;">
            <button type="button" class="btn" onclick="location.href='${urlNaver}'" style="border: none; background-color: #fff;">
                <img src="../../img/naver_login.png" style="width: 180px; height: 45px;">
            </button>
        
    		 <button type="button" class="btn" onclick="location.href='${urlKakao}'" style="border: none; background-color: #fff;">
            	<img src="../../img/kakao_login_medium.png" style="width: 180px; height: 45px;">
            </button>        
        </div>
    </form>
</div>
</body>
</html>