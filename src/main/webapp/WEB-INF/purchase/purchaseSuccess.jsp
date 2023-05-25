<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
    >
    <title>Treasure</title>
    <!-- Bootstrap core CSS -->

    <%--    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="application/javascript"
            src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"
    ></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
          integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"
    />
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

        * {
            font-family: "GmarketSansMedium";
        }

        #logo {
            font-size: 25px;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-wrapper {
            width: 800px;
            padding: 40px;
            box-sizing: border-box;
            margin-top: 100px !important;
            line-height: 30px;
            /*background-color: #ced4da;*/
            margin: auto;
            position: relative;

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
            border: none;
        }

        .btn-login:hover {
            background-color: #fff;
            color: #747f55;
            border: 1px solid #747f55;
            cursor: pointer;
        }

        #bidbox {
            background-color: #333333;

        }

        #bidbox-sub:hover {
            color: #333333;
        }

        #bidbox:hover {
            background-color: #ffffff;
            color: #333333;
            border: 1px solid #333333;
            cursor: pointer;
        }
        #logo {
            font-size: 25px;
            font-weight: bold;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .hr {
            border: none;
            height: 2px;
            background: black;
            margin-bottom: 50px;
        }

        .right-td {
            font-size: 14px;
            padding-left: 20px;
        }

        .left-td {
            font-size: 14px;
            opacity: 0.7;
        }

        img.buy_item_image {
            width: 200px;
        }

        span.buy_brand {
            font-size: 14px;
            font-weight: bold;
        }

        span.buy_title {
            font-size: 14px;
        }

        span.buy_size {
            font-size: 12px;
            vertical-align: middle;
            color: gray;
        }

        div.buy_size {
            margin: 3px;
            padding: 18px;
            flex-direction: column;
            border: 1px solid #ebebeb;
            border-radius: 20px;
            background-color: white;
            width: 140px;
            vertical-align: middle;
            text-align: center;
            cursor: pointer;
            line-height: 13px;
        }

        div.size_active {
            border: 2px solid #747f55;
        }

        div.buy_size:hover {
            background-color: #f3f3f3;
        }
        .order_image {
            width: 300px;
            margin-top: -60px;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div>
            <i id="logo">즉시 구매가 완료되었습니다</i>
        </div>
        <div class="hr"></div>
        <div style="display:flex; justify-content: center;">
            <img src="/img/item_image/${itemDto.item_image}" class="order_image">
        </div>
        <div style="display:flex; justify-content: center; margin-bottom: 100px;">
        <span style="margin-bottom: 20px; font-size: 12pt; color: dimgray;">구매한 상품은 전문가 검수 완료 후, 안전하게 배송될 예정입니다.</span>
        </div>
        <div style="font-size: 16pt;">
        <span>총 결제금액</span><span style="float: right;"><b style="color: #ff6961; font-style: italic;"><fmt:formatNumber value="${buyNowDto.buynow_price+delivery+2500}" pattern="###,###,###"/></b> 원</span>
        </div>
        <div style=" margin-bottom: 50px;">
        <span>구매 가격</span><span style="float: right;"><fmt:formatNumber value="${buyNowDto.buynow_price}" pattern="###,###,###"/></span><br>
        <span>배송비</span><span style="float: right;"><fmt:formatNumber value="${delivery}" pattern="#,###"/></span><br>
        <span>검수비</span><span style="float: right;">2,500</span>
        </div>
        <div style="border: none; height: 1px; background: gray; margin-bottom: 50px;"></div>
            <div id="right-info"
                 style="width: 90%; float: left;">
                <span style="font-size: 18px;">주문 상품</span>
                <table>
                    <tr>
                        <td class="left-td">모델</td>
                        <td class="right-td">${itemDto.item_modelnum}</td>
                    </tr>
                    <tr>
                        <td class="left-td">상품명</td>
                        <td class="right-td">${itemDto.item_korname}</td>
                    </tr>
                    <tr>
                        <td class="left-td">사이즈</td>
                        <td class="right-td">${size}</td>
                    </tr>
                </table>
                <br><br>
                <span style="font-size: 18px;">배송 주소</span>
                <table>
                    <tr>
                        <td class="left-td">받는분</td>
                        <td class="right-td" id="buy-name">${userName}</td>
                    </tr>
                    <tr>
                        <td class="left-td">연락처</td>
                        <td class="right-td" id="buy-phone">${userPhone}</td>
                    </tr>
                    <tr>
                        <td class="left-td">배송 주소</td>
                        <td class="right-td" id="buy-addr">${buyNowDto.buy_addr}</td>
                    </tr>
                </table>
                <div class="hr" style="margin-top: 60px;"></div>
            </div>
    </div>

</body>
</html>