<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">
    <title>Treasure</title>
    <style>
        .container {
            width: 100%;
            margin: 100px 0px 0px 0px;
        }

        #slider {
            opacity: 1;
            width: 100%;
            margin: 100px 0px 0px 0px;
        }

        #container {
            width: 1000px;
            margin-left: 160px;
            margin-top: 50px;
        }

        .card-list {
            width: 100%;
            height: 1000px;
            margin-right: 20px;
        }

        .item-box {
            float: left;
            width: 240px;
        }

        .item-wrapper {
            float: left;
        }

        img {
            width: 220px;
            margin: 5px;
            border-radius: 10px;
        }

        .plus {
            width: 100px;
            height: 40px;
            padding-left: 15px;
            color: black;
            margin-left: 410px;
            margin-top: 40px;
            background-color: #ffffff;
            font-size: 10px;
            margin-bottom: 50px;
            border-radius: 10px;
            border: 1px solid #dfebda;
        }

        .plus:hover {
            background-color: #dfebda;
            color: black;
        }
    </style>
    <script>
        $(function () {
            $("#item2").hide();
            $("#item3").hide();
            $("#itemBtn2").hide();

            $("#itemBtn1").click(function () {
                $("#item2").show();
                $("#itemBtn2").show();
                $("#itemBtn1").hide();
            });

            $("#itemBtn2").click(function () {
                $("#item3").show();
                $("#itemBtn2").hide();
            });
        });
        var currentPic = 0;
        var opacity = 1;
        var numOfPics = 4;
        var maxOpacity = 1;
        var minOpacity = 0;
        var speed = 30;
        var timer = 5000;
        var pics = [];

        pics[0] = "../../img/banner1.png";
        pics[1] = "../../img/banner1.png";
        pics[2] = "../../img/banner1.png";
        pics[3] = "../../img/banner1.png";


        function fadeOut(element, speed) {

            opacity -= 0.1

            element.style.opacity = opacity;

            if (opacity <= minOpacity) {

                return true;
            }

            setTimeout(fadeOut.bind(null, element, speed), speed);
        }

        function fadeIn(element, speed) {

            opacity += 0.1

            element.style.opacity = opacity;

            if (opacity >= maxOpacity) {

                return true;
            }

            setTimeout(fadeIn.bind(null, element, speed), speed);
        }

        function imageSliderOut() {

            var slider = document.getElementById("slider");

            fadeOut(slider, speed);

            currentPic++;

            if (currentPic === numOfPics) {

                currentPic = 0;
            }

            setTimeout("imageSliderIn()", (timer / 3));
        }

        function imageSliderIn() {

            var slider = document.getElementById("slider");

            slider.src = pics[currentPic];

            fadeIn(slider, speed);

            setTimeout("imageSliderOut()", timer);
        }

        window.onload = imageSliderIn;
    </script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>

<div class="container">
    <img src="../../img/banner1.jpg" id="slider" alt="Image">
</div>
<div id="container">
    <div class="card-list">
        <div style="margin-left: 10px;">
            <span style="font-weight: bold; font-size: 14px;">Just Dropped</span><br>
            <span style="opacity: 0.6; font-size: 12px;">발매 상품</span>
        </div>
        <div id="item1">
            <c:forEach items="${itemDtoList1}" var="dto" varStatus="i">
                <div class="item-wrapper">
                    <div class="item-box" style="margin-bottom: 20px; font-size: 5px;">
                        <img src="../../img/item_image/${dto.item_image}">
                        <div style="width: 220px; font-size: 10px; font-weight: bold;">${dto.item_brandname}</div>
                        <div style="width: 220px; font-size: 9px;
                        padding-top: 5px;">${dto.item_engname}</div>
                        <div style="width: 220px; height: 50px; font-size: 9px; font-size: 13px; font-weight: bold; padding-top: 20px">
                                ${dto.item_releaseprice}
                        </div>
                        <div style="font-size: 10px; opacity: 0.6">즉시 구매가</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="clear: left"></div>
        <input class="plus" id="itemBtn1" type="button" value="더보기">
        <div style="width: 950px; border: 1px solid #e3e3e3">
        </div>
        <div id="item2">
            <c:forEach items="${itemDtoList2}" var="dto" varStatus="i">
                <div class="item-wrapper">
                    <div class="item-box" style="margin-bottom: 20px; font-size: 5px;">
                        <img src="../../img/item_image/${dto.item_image}">
                        <div style="width: 220px; font-size: 10px; font-weight: bold;">${dto.item_brandname}</div>
                        <div style="width: 220px; font-size: 9px;
                        padding-top: 5px;">${dto.item_engname}</div>
                        <div style="width: 220px; height: 50px; font-size: 9px; font-size: 13px; font-weight: bold; padding-top: 20px">
                                ${dto.item_releaseprice}
                        </div>
                        <div style="font-size: 10px; opacity: 0.6">즉시 구매가</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="clear: left"></div>
        <input class="plus" id="itemBtn2" type="button" value="더보기">
        <div id="item3">
            <c:forEach items="${itemDtoList3}" var="dto" varStatus="i">
                <div class="item-wrapper">
                    <div class="item-box" style="margin-bottom: 20px; font-size: 5px;">
                        <img src="../../img/item_image/${dto.item_image}">
                        <div style="width: 220px; font-size: 10px; font-weight: bold;">${dto.item_brandname}</div>
                        <div style="width: 220px; font-size: 9px;
                        padding-top: 5px;">${dto.item_engname}</div>
                        <div style="width: 220px; height: 50px; font-size: 9px; font-size: 13px; font-weight: bold; padding-top: 20px">
                                ${dto.item_releaseprice}
                        </div>
                        <div style="font-size: 10px; opacity: 0.6">즉시 구매가</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<div class="banner">
    wnd들어갈 자리
</div>
</body>
</html>