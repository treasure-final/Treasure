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

        .container {
            width: 800px;
            height: 1200px;
            padding: 40px;
            box-sizing: border-box;
            margin: 50px auto;
            line-height: 30px;
            background-color: #ffffff;
        }

        .container > h2 {
            font-size: 24px;
            color: black;
            margin-bottom: 40px;
            text-align: center;
        }

        #buy-form > input {
            width: 95%;
            height: 48px;
            padding: 0 10px;
            box-sizing: border-box;
            margin-bottom: 16px;
            border-radius: 6px;
            background-color: #F8F8F8;
            margin-right: 10px;
            text-align: right;
            font-size: 18px;
            font-weight: bold;
        }

        #buy-form > input::placeholder {
            color: #D2D2D2;
        }

        .btn-buyType {
            font-size: 14px;
            color: #fff;
            background-color: #ef6253;
            padding: 10px 0;
            border-radius: 25px;
            font-weight: 400;
            text-transform: capitalize;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            margin-top: 4px;
            width: 300px;
            text-align: center;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #fff;
            color: #747f55;
            border: 1px solid #747f55;
        }

        .deadline {
            border: 1px solid darkgray;
            padding: 15px 50px;
            border-radius: 15px;
            margin-right: 7px;
            cursor: pointer;
        }
        .deadline:hover {
            background-color: #f3f3f3;
        }

        .btn-submit {
            width: 100%;
            padding: 17px 0;
            border-radius: 15px;
            background-color: #747f55;
            color: #ffffff;
            font-size: 14px;
            cursor: pointer;
        }

        .price-info {
            float: left;
            width: 49%;
            margin-top: 20px;
            font-size: 16px;
        "
        }
    </style>
    <script>
        $(function () {
            $("#result-bid").hide();
            $("#buy-bid").css("background-color", "#e3e3e3")
                .css("color", "black");
            $("#buy-bid").click(function () {
                $("#result-immediate").hide();
                $("#result-bid").show();
                $("#buy-immediate").css("background-color", "#e3e3e3")
                    .css("color", "black");
                $("#buy-bid").css("background-color", " #ef6253")
                    .css("color", "#fff");
            });
            $("#buy-immediate").click(function () {
                $("#result-bid").hide();
                $("#result-immediate").show();
                $("#buy-bid").css("background-color", "#e3e3e3")
                    .css("color", "black");
                $("#buy-immediate").css("background-color", " #ef6253")
                    .css("color", "#fff");
            })
            $(".deadline").click(function () {
                $(".deadline").css("border", "1px solid darkgray");
                $(this).css("border", "1px solid black");
            });
        })
    </script>
</head>
<body>
<div class="container">
    <div id="info" style="width: 100%; height: 30%; margin-bottom: 10px; margin-left: 40px;">
        <img src="../../img/화면%20캡처%202023-05-04%20140755.png"
             style="width: 110px; float: left; margin-right: 20px; border-radius: 10px;">
        <div id="left-info"
             style="width: 70%; float: left; height: 40%; margin-right: 20px; margin-bottom: 10px; line-height: 20px; margin-top: 15px">
            <div id="content" style="font-size: 14px;">
                <b style="font-size: 14px">DR0148-102</b><br>
                (W) Nike Air Force 1 '07 LX Summit White Gorge Green<br>
                <p style="opacity: 0.6; font-size: 14px;">(W) 나이키 에어포스 1 '07 LX 서밋 화이트 골지 그린</p>
                240
            </div>
        </div>
        <div id="right-info"
             style="border-top: 1px solid #b9b9b9; width: 90%; float: left; height: 40%;">
            <div class="price-info" align="center">
                <div style="opacity: 0.7; font-size: 14px;">즉시 구매가</div>
                169,000
            </div>
            <div class="price-info" align="center" style="border-left: 1px solid #b9b9b9">
                <div style="opacity: 0.7; font-size: 14px;">즉시 판매가</div>
                -
            </div>
            <div id="typeBtn"
                 style="margin-left: 7px; background-color: #e3e3e3; height: 50px; margin-top: 100px; margin-right: 10px; border-radius: 25px">
                <input type="button" value="구매 입찰" class="btn-buyType" id="buy-bid"
                       style="float: left; margin-right: 23px; margin-left: 2px;">
                <input type="button" value="즉시 구매" class="btn-buyType" id="buy-immediate" style="float: left">
            </div>
        </div>
    </div>
    <div id="result-immediate" style="margin-left: 40px">
        <div style="font-size: 13px;">즉시 구매가</div>
        <div align="right" style="font-size: 20px; margin-right: 35px; margin-top: 10px">177,000원</div>

        <div class="result-content"
             style="border-top: 1px solid #b9b9b9; width: 95%; height: 10%; margin-top: 39px;">
        </div>
        <div style="padding-top: 20px; padding-bottom: 10px; font-size: 14px; opacity: 0.4">총 결제금액은
            다음 화면에서 계산됩니다.
        </div>
        <div style="border-top: 1px solid #b9b9b9; width: 95%; height: 10%; margin-top: 15px; font-size: 14px; padding-top: 20px">
            총 결제금액<span style="font-size: 14px; opacity: 0.4; margin-left: 450px;">다음 화면에서 확인</span>
            <input type="button" value="즉시 구매 계속" class="btn-submit">
        </div>
    </div>

    <div id="result-bid" style="margin-left: 40px">
        <div style="font-size: 13px;">구매 희망가</div>
        <div align="right" style="font-size: 20px; margin-right: 35px;" id="buy-form">
            <input type="text" id="hopePrice">원
        </div>

        <div class="result-content"
             style="border-top: 1px solid #b9b9b9; width: 95%; height: 10%; margin-top: 15px;">
        </div>
        <div style="padding-top: 20px; padding-bottom: 10px; font-size: 14px; opacity: 0.4">총 결제금액은
            다음 화면에서 계산됩니다.
        </div>
        <div style="padding: 30px 0;">
            <p style="font-size: 14px;">입찰 마감기한</p>
            <p style="font-size: 13px;">30일 (2023/06/06 마감)</p><br>
            <span class="deadline">
                1일
            </span>
            <span class="deadline">
                3일
            </span>
            <span class="deadline">
                30일
            </span>
            <span class="deadline">
                30일
            </span>
            <span class="deadline">
                60일
            </span>
        </div>
        <div style="border-top: 1px solid #b9b9b9; width: 95%; height: 10%; margin-top: 15px; font-size: 14px; padding-top: 20px">
            총 결제금액<span style="font-size: 14px; opacity: 0.4; margin-left: 450px;">다음 화면에서 확인</span>
            <input type="button" value="구매 입찰 계속" class="btn-submit"></div>
    </div>
</div>
</body>
</html>