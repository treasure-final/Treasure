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

        div.main {
            font-family: "GmarketSansMedium";
            font-size: 13px;
            padding: 0;
            margin: 0;
            border: none;
            color: black;
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

        .right-td {
            font-size: 14px;
            padding-left: 20px;
        }

        .left-td {
            font-size: 14px;
            opacity: 0.7;
        }

        #required-btn {
            font-family: "GmarketSansMedium";
            width: 95%;
            border-radius: 15px;
            background-color: #ffffff;
            text-align: left;
            padding: 5px 15px;
            margin: 10px 0;
            border: 1px solid #e3e3e3;
        }

        .select-box {
            padding: 0px 0;
            width: 95%;
            border: 1px solid #e3e3e3;
            border-radius: 10px;
            margin-top: 15px;
        }

        .select-box:hover {
            background-color: #fff;
            border: 1px solid black;
        }

        .typeImg {
            margin-left: 10px;
            margin-top: 15px;
            width: 45px;
            height: 45px;
        }

        .td2 {
            padding-left: 490px;
        }

        td {
           font-size: 14px;
        }

        .hr {
            border: none;
            height: 2px;
            background: black;
            margin-bottom: 50px;
        }

        #logo {
            font-size: 25px;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
    </style>
    <script>
        $(function () {
            $("#basic-box").css("border", "1px solid black");
            $(".select-box").click(function () {
                $(".select-box").css("border", "1px solid #e3e3e3");
                $(this).css("border", "1px solid black");
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div><i id="logo">구매/결제</i></div>
    <div class="hr"></div>
    <div id="info" style="width: 100%; height: 30%; margin-bottom: 10px; margin-left: 40px;">
        <img src="../../img/화면%20캡처%202023-05-04%20140755.png"
             style="width: 110px; float: left; margin-right: 20px; border-radius: 10px;">
        <div id="left-info"
             style="width: 70%; float: left; height: 40%; margin-right: 20px; margin-bottom: 10px; line-height: 20px; margin-top: 15px">
            <div id="content" style="font-size: 14px;">
                <b style="font-size: 14px">DR0148-102</b><br>
                (W) Nike Air Force 1 '07 LX Summit White Gorge Green
                <div style="opacity: 0.6; font-size: 14px;">(W) 나이키 에어포스 1 '07 LX 서밋 화이트 골지 그린</div>
                240
            </div>
        </div>
        <div id="right-info"
             style="width: 90%; float: left; height: 40%;">
            <span style="font-size: 18px;">배송 주소</span><span style="margin-left: 480px; cursor: pointer; opacity: 0.7; font-size: 14px;">+ 새 주소 추가</span>
            <table>
                <tr>
                    <td class="left-td">받는분</td>
                    <td class="right-td">김영돈</td>
                </tr>
                <tr>
                    <td class="left-td">연락처</td>
                    <td class="right-td">010-2152-9843</td>
                </tr>
                <tr>
                    <td class="left-td">배송 주소</td>
                    <td class="right-td">경기 성남시 분당구 경부고속도로 409 (삼평동) 111</td>
                </tr>
            </table>
            <input type="text" id="required-btn" placeholder="배송 시 요청사항을 입력해주세요">
        </div>
    </div>
    <div id="result-immediate" style="margin-left: 40px">

        <div class="result-content"
             style="border-top: 1px solid #e3e3e3; width: 95%; height: 10%; margin-top: 60px;">
        </div>
        <div style="padding-top: 20px; padding-bottom: 10px; font-size: 14px; opacity: 0.4">
        </div>
        <div style="font-size: 18px;">배송 방법</div>
        <div class="select-box" id="basic-box">
            <img src="../../img/iconmonstr-shipping-box-3-240 (2).png" class="typeImg" style="float: left;">
            <div style="margin-top: 18px; margin-left: 65px; width: 300px; height: 55px; line-height: 20px">
                일반배송 3,000원
                <br><span style="opacity: 0.6;">검수 후 배송 ・ 5-7일 내 도착 예정</span></div>
        </div>
        <div class="select-box">
            <img src="../../img/iconmonstr-building-5-240.png" class="typeImg" style="float: left">
            <div style="margin-top: 18px; margin-left: 65px; width: 300px; height: 55px; line-height: 20px">
                창고보관 첫 30일 무료
                <br><span style="opacity: 0.6;">배송 없이 창고에 보관 ・ 빠르게 판매 가능</span></div>
        </div>
    </div>
    <div id="totalOrderInfo" style="border-top: 1px solid #e3e3e3; width: 90%; height: 10%; margin-top: 60px; margin-left: 40px;
    padding-top: 50px">
        <div style="font-size: 18px; margin-bottom: 10px">최종 주문 정보</div>
        <div style="font-size: 14px">총 결제금액</div>
        <div style="color: red; margin-left: 550px; font-size: 18px"><b>173,500원</b></div>
        <div id="sub-info" style="border-top: 2px solid #e3e3e3; padding-bottom: 50px; margin-top: 30px">
            <table style="padding-top: 20px">
                <tr>
                    <td>즉시 구매가</td>
                    <td class="td2" align="right"><b>168,000원</b></td>
                </tr>
                <tr>
                    <td style="opacity: 0.8">검수비</td>
                    <td class="td2" align="right">무료</td>
                </tr>
                <tr>
                    <td style="opacity: 0.8">수수료</td>
                    <td class="td2" align="right">2,500원</td>
                </tr>
                <tr>
                    <td style="opacity: 0.8">배송비</td>
                    <td class="td2" align="right">3,000원</td>
                </tr>
            </table>

        </div>
    </div>
</div>
</body>
</html>