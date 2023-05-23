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
    <%--    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
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

        .deadline {
            border: 1px solid darkgray;
            padding: 15px 45px;
            border-radius: 15px;
            margin-right: 7px;
            cursor: pointer;
            font-size: 14px;
        }

        .deadline:hover {
            background-color: #f3f3f3;
        }

        .btn-submit {
            width: 100%;
            height: 55px;
            padding: 14px 0;
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
        }

        .result-bottom {
            border-top: 1px solid #b9b9b9;
            width: 95%;
            height: 10%;
            margin-top: 15px;
            font-size: 14px;
            padding-top: 20px;
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
            if("${price}".includes("구매입찰")) {
                $("#buy-immediate").attr("disabled", true);
                $("#buy-immediate").css("background-color", "#e3e3e3");
                $("#buy-immediate").css("cursor", "unset");
            }else {
                $("#buy-bid").css("background-color", "#e3e3e3")
                    .css("color", "black");
            }
            if("${price}".includes("구매입찰")) {
                $("#result-immediate").hide();
                $("#result-bid").show();
            }else {
                $("#result-bid").hide();
            }
            $("#inputError").hide();


            $("#buy-bid").click(function () {
                $("#result-immediate").hide();
                $("#result-bid").show();
                if("${price}"!="구매입찰") {
                    $("#buy-immediate").css("background-color", "#e3e3e3")
                        .css("color", "black");
                }
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

            intDay = 30;
            // 마감 날짜 계산
            $(".deadline").click(function () {

                let day = $(this).text();
                intDay = $(this).attr("day");
                let deadline = intDay;
                let today = new Date();
                let year = today.getFullYear();
                let month = today.getMonth() + 1
                if(deadline==30) {
                    month+=1;
                    deadline-=31;
                }
                if (deadline==60) {
                    month+=2;
                    deadline-=61;
                }
                let date = today.getDate() + parseInt(deadline);
                defaultDate = today.getDate() + 30;
                let deadDay = year + "/" + month + "/" + date;

                $(".deadline").css("border", "1px solid darkgray");
                $(this).css("border", "1px solid black");
                $("#deadline-day").text(day);
                $("#deadline-date").text(deadDay);
            });

            <!-- default 마감날짜 설정 start -->
            let today = new Date();
            let year = today.getFullYear();
            let month = today.getMonth() + 1
            let date = today.getDate() + 30;
            let deadDay = year + "/" + (month+1) + "/" + (date-31);
            $("#deadline-day").text("30일 ");
            $("#deadline-date").text(deadDay);
            <!-- default 마감날짜 설정 end -->

            <!-- 금액 입력 후 엔터 누르면 1000 단위로 콤마 추가 -->
            $('#hopePrice').on('change', function () {
                let immediatePrice = $("#immediatePrice").text();
                n = uncomma($(this).val());
                if(parseInt(n)>parseInt(uncomma(immediatePrice))) {
                    changePage();
                    n = 0;
                }
                if(parseInt(n) < 50000) {
                    n = 0;
                }
                n = Math.floor(n / 1000) * 1000;
                comma($(this).val(n));
            });

            $("#bid-btn").attr("disabled", true);
            $("#bid-btn").css("background-color", "#e3e3e3");
            $("#bid-btn").css("cursor", "unset");

            $("#hopePrice").change(function () {
                let immediatePrice = $("#immediatePrice").text();
                if($(this).val()>=50000) {
                    $("#bid-btn").attr("disabled", false);
                    $("#bid-btn").css("background-color", "#747f55");
                    $("#bid-btn").css("cursor", "pointer");
                    $("#inputError").hide();
                    $("#hopePriceForm").css("color", "black");
                    $("#hopePrice").css("border", "none");
                }
                else {
                    $("#bid-btn").attr("disabled", true);
                    $("#bid-btn").css("background-color", "#e3e3e3");
                    $("#bid-btn").css("cursor", "unset");
                    $("#inputError").show();
                    $("#hopePriceForm").css("color", "red");
                    $("#hopePrice").css("border", "2px solid red");
                }
            });
        });

        <!-- 금액 입력 후 화면 클릭 시 1000 단위로 콤마 추가 -->
        window.onclick = function change() {
            let immediatePrice = $("#immediatePrice").text();
            let n = uncomma($("#hopePrice").val());
            // 즉시 구매가 가격 보다 높을 시 즉시 구매 페이지로 이동
            if(parseInt(n)>parseInt(uncomma(immediatePrice))) {
                changePage();
                n = 0;
            }
            if(parseInt(n) < 50000) {
                n = 0;
            }
            n = Math.floor(n / 1000) * 1000;
            let m = comma(n);
            $("#hopePrice").val(m);
        }

        function changePage() {
            $("#result-bid").hide();
            $("#result-immediate").show();
            $("#buy-bid").css("background-color", "#e3e3e3")
                .css("color", "black");
            $("#buy-immediate").css("background-color", " #ef6253")
                .css("color", "#fff");
        }

        function moveBidPage() {
            let hopePrice = $("#hopePrice").val();
            let deadline = parseInt(intDay);
            location.href = 'order?item_num=${dto.item_num}&size=${size}&price=' + uncomma(hopePrice) + '&deadline=' + deadline + '&deliveryWay=${deliveryWay}' + '&buyType=구매입찰'
        }

        function moveImmediatePage() {
            let immediatePrice = $("#immediatePrice").text();
            location.href = 'order?item_num=${dto.item_num}&size=${size}&price=' + uncomma(immediatePrice) + '&deliveryWay=${deliveryWay}' + '&buyType=즉시구매'
        }

        function inputNumberFormat(obj) {
            obj.value = comma(uncomma(obj.value));
        }

        function comma(str) {
            str = String(str);
            if(str==0) {
                return "";
            }
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        }
    </script>
</head>
<body>
<div class="container">
    <div><i id="logo">구매하기</i></div>
    <div class="hr"></div>
    <div id="info" style="width: 100%; height: 30%; margin-bottom: 10px; margin-left: 40px;">
        <img src="/img/item_image/${dto.item_image}"
             style="width: 110px; float: left; margin-right: 20px; border-radius: 10px;">
        <div id="left-info"
             style="width: 70%; float: left; height: 40%; margin-right: 20px; margin-bottom: 10px; line-height: 20px; margin-top: 15px">
            <div id="content" style="font-size: 14px; line-height: 22px;">
                <b style="font-size: 14px">${dto.item_modelnum}</b><br>
                ${dto.item_engname}<br>
                <div style="opacity: 0.6; font-size: 14px;">${dto.item_korname}</div>
                ${size}
            </div>
        </div>
        <div id="right-info"
             style="border-top: 1px solid #b9b9b9; width: 90%; float: left; height: 40%;">
            <div class="price-info" align="center">
                <div style="opacity: 0.7; font-size: 14px;">즉시 구매가</div>
                <c:if test="${price.contains('구매입찰')}">
                    구매입찰
                </c:if>
                <c:if test="${!price.contains('구매입찰')}">
                    ${price}
                </c:if>
            </div>
            <div class="price-info" align="center" style="border-left: 1px solid #b9b9b9">
                <div style="opacity: 0.7; font-size: 14px;">즉시 판매가</div>
                -
            </div>
            <div id="typeBtn"
                 style="margin-left: 7px; background-color: #e3e3e3; height: 54px; margin-top: 100px; margin-right: 10px; border-radius: 25px;">
                <input type="button" value="구매 입찰" class="btn-buyType" id="buy-bid"
                       style="float: left; margin-right: 23px; margin-left: 2px;">
                <input type="button" value="즉시 구매" class="btn-buyType" id="buy-immediate" style="float: left">
            </div>
        </div>
    </div>
    <div id="result-immediate" style="margin-left: 40px">
        <div style="font-size: 13px;">즉시 구매가</div>
        <div align="right" id="immediatePrice"
             style="font-size: 20px; margin-right: 33px; margin-top: 10px; font-weight: bold">
            ${price}<span>원</span></div>

        <div class="result-content"
             style="border-top: 1px solid #b9b9b9; width: 95%; height: 10%; margin-top: 39px;">
        </div>
        <div style="padding-top: 20px; padding-bottom: 10px; font-size: 14px; opacity: 0.4">총 결제금액은
            다음 화면에서 계산됩니다.
        </div>
        <div class="result-bottom">
            총 결제금액<span style="font-size: 14px; opacity: 0.4; margin-left: 450px;">다음 화면에서 확인</span>
            <input type="button" value="즉시 구매 계속" class="btn-submit"
                   onclick="moveImmediatePage()">
        </div>
    </div>

    <div id="result-bid" style="margin-left: 40px">
        <div style="font-size: 13px;" id="hopePriceForm">구매 희망가
            <span style="color: red; font-size: 13px; margin-left: 375px" id="inputError">5만원 부터 천원단위로 입력하세요.</span>
        </div>
        <div align="right" style="font-size: 20px; margin-right: 35px;" id="buy-form">
            <input type="text" id="hopePrice" placeholder="희망가 입력" onkeyup="inputNumberFormat(this)"
                   style="color: black; font-size: 20px; font-weight: normal">원
        </div>
        <div class="result-content" style="border-top: 1px solid #b9b9b9; width: 95%; height: 10%; margin-top: 15px;">
        </div>
        <div style="padding-top: 20px; padding-bottom: 10px; font-size: 14px; opacity: 0.4">총 결제금액은
            다음 화면에서 계산됩니다.
        </div>
        <div style="padding: 30px 0;">
            <p style="font-size: 14px;">입찰 마감기한</p>
            <p style="font-size: 13px;"><span id="deadline-day" style="font-size: 13px"></span>(<span id="deadline-date"
                                                                                                      style="font-size: 13px;"></span>)
                마감</p><br>
            <span class="deadline" day="1">
                1일
            </span>
            <span class="deadline" day="3">
                3일
            </span>
            <span class="deadline" day="7">
                7일
            </span>
            <span class="deadline" day="30"
            style="border: 1px solid black">
                30일
            </span>
            <span class="deadline" day="60">
                60일
            </span>
        </div>
        <div class="result-bottom">
            총 결제금액<span style="font-size: 14px; opacity: 0.4; margin-left: 450px;">다음 화면에서 확인</span>
            <input type="hidden" id="size" value="${size}">
            <input type="hidden" id="deliveryWay" value="${deliveryWay}">
            <input type="button" value="구매 입찰 계속" class="btn-submit" id="bid-btn"
                   onclick="moveBidPage()">
        </div>
    </div>
</div>
</body>
</html>