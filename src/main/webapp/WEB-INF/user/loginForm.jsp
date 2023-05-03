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
            src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff") format("woff");
            font-weight: normal;
            font-style: normal;
        }

        * {
            font-family: "GmarketSansMedium";
            font-size: 10px;
            padding: 0;
            margin: 0;
            border: none;
        }

        .login-wrapper {
            width: 400px;
            height: 800px;
            padding: 40px;
            box-sizing: border-box;
            margin-left: 35%;
            margin-top: 5%;
            line-height: 30px;
        }

        .login-wrapper > h2 {
            font-size: 24px;
            color: black;
            margin-bottom: 40px;
            text-align: center;
        }

        #login-form > input:not(#btn-login) {
            width: 100%;
            height: 48px;
            padding: 0 10px;
            box-sizing: border-box;
            margin-bottom: 16px;
            border-radius: 6px;
            background-color: #F8F8F8;
        }

        #login-form > input::placeholder {
            color: #D2D2D2;
        }

        #login-form > input[type="checkbox"] {
            display: none;
        }

        #login-form > label {
            color: #babbbc;
        }

        #login-form input[type="checkbox"] + label {
            cursor: pointer;
            padding-left: 26px;
            background-repeat: no-repeat;
            background-size: contain;
        }

        #login-form input[type="checkbox"]:checked + label {
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
            padding-right: 20px;
        }

        #sub-menu span:not(.bar) {
            cursor: pointer;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#submit").click(function () {
                let email = $("#email").val();
                let password = $("#password").val();
                $.ajax({
                    type: "get",
                    url: "loginError",
                    data: {
                        "email": email,
                        "password": password
                    },
                    success: function (res) {
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
    <h2>TREASURE</h2>

    <form method="post" action="loginProc" id="login-form">
        이메일 주소
        <input type="text" name="email" id="email" placeholder="Email" required="required"
               value="${sessionScope.saveOk==null?"":sessionScope.loginEmail }">
        <span>${valid_email}</span>
        비밀번호
        <input type="password" name="password" id="password" placeholder="Password" required="required">
        <label for="remember-check">
            <input type="checkbox" id="remember-check" name="saveOk"
                   name="${sessionScope.saveOk==null?"":"checked"}">
        </label>
        <span>아이디 저장하기<br></span>

        <input type="submit" value="Login" id="btn-login">
        <div id="sub-menu">
            <span>회원 가입</span><span class="bar">|</span>
            <span>이메일 찾기</span><span class="bar">|</span>
            <span>비밀번호 찾기</span>
        </div>
        <div id="btn-api" style="margin-top: 20px; cursor: pointer">
            <%--            <button onclick="showLoginPopup();"><img width="200" height="50" src="../../img/naverBtn.png"></button>--%>
            <button type="button" class="btn" onclick="location.href='${urlNaver}'" style="border: none">
                <img src="../../img/midNaverBtn.png" width="130px;" height=100%;>
            </button>
        </div>
    </form>
    <script>

        // // 네이버 로그인을 위한 팝업창 생성
        // function showLoginPopup(){
        //     let uri = 'https://nid.naver.com/oauth2.0/authorize?' +
        //         'response_type=code' +                  // 인증과정에 대한 내부 구분값 code 로 전공 (고정값)
        //         '&client_id=Lal4yqj3h0j5M_kfZORf' +     // 발급받은 client_id 를 입력
        //         '&state=NAVER_LOGIN_TEST' +             // CORS 를 방지하기 위한 특정 토큰값(임의값 사용)
        //         '&redirect_uri=http://localhost:8080/naverLoginCallback';   // 어플케이션에서 등록했던 CallBack URL를 입력
        //
        //     // 사용자가 사용하기 편하게끔 팝업창으로 띄어준다.
        //     window.open(uri, "Naver Login Test PopupScreen", "width=450, height=600");
        // }

    </script>
</div>
</body>
</html>