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
            width: 50%;
            padding: 40px;
            box-sizing: border-box;
            margin-top: 100px !important;
            line-height: 30px;
            /*background-color: #ced4da;*/
            margin: auto;
            position: relative;
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

        .btn-login {
            font-size: 14px;
            color: #fff;
            background-color: #747f55;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 400;
            text-transform: capitalize;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            margin-top: 15px !important;
            margin: 5px;
            width: 50%;
            text-align: center;
        }

        .btn-login:hover {
            background-color: #fff;
            color: #747f55;
            border: 1px solid #747f55;
        }

        #logo {
            font-size: 25px;
            margin-left: 30%;
            font-weight: bold;
        }

        img.buy_item_image {
            width: 200px;
        }
        span.buy_brand {
            font-size: 15px;
            font-weight: bold;
        }
        span.buy_title {
            font-size: 15px;
        }
        span.buy_size {
            font-size: 12px;
            vertical-align: middle;

        }
        div.buy_size {
            margin: 3px;
            padding: 18px;
            flex-direction: column;
            border: 1px solid darkgray;
            border-radius: 15px;
            background-color: white;
            width: 24%;
            vertical-align: middle;
            text-align: center;
            cursor: pointer;
            line-height: 13px;
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div style="display: flex;">
<%--            <div style="background-color: white; width: 200px; height: 200px;">--%>
                <img src="/img/item_image/shoes/1.png" class="buy_item_image">
<%--            </div>--%>
            <div style="flex-direction: column; padding: 20px;">
                <span class="buy_brand">Jordan</span><br>
                <span class="buy_title">(W) 조던 1 x 트래비스 스캇 레트로 로우 OG SP 미디움 올리브</span><br>
            </div>
        </div>
        <form method="" action="" id="">
            <div style="display:flex;">
            <c:forEach var="i" begin="1" end="4" step="1">
                <div class="buy_size">
                    <span class="buy_size">size</span><br>
                    <span class="buy_size" style="color: #ec0b00;">금액</span>
                </div>
            </c:forEach>
            </div>
        </form>
        <div style="display: flex;">
            <button type="button" class="btn-login">빠른배송</button>
            <button type="button" class="btn-login">일반배송<br><span style="font-size: 5px; color: white;">3일</span></button>
        </div>

    </div>
</body>
</html>
    