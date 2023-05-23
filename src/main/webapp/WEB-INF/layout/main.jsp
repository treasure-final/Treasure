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
            opacity: 0.9;
        }

        #menulist, #searchinput {
            margin-top: -13px;
        }

        #slider {
            opacity: 1;
            width: 100%;
            height: 500px;
            margin: 0px 0px 0px 0px;
            border-radius: unset;
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
            cursor: pointer;
            cursor: pointer;
        }

        .item-box > div {
            padding-left: 10px;
        }

        .item-wrapper {
            float: left;
        }

        img {
            width: 220px;
            margin: 5px;
            border-radius: 10px;
            cursor: pointer;

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
            cursor: pointer;
        }

        .plus:hover {
            background-color: #dfebda;
            color: black;
        }

        #select-menu {
            float: left;
            margin-top: 20px;
        }

        .menu {
            float: left;
        }

        .menu > img {
            margin-right: 5px;
            width: 180px;
        }

        .menu-name {
            font-size: 13px;
            text-align: center;
            width: 190px;
            float: left;
            opacity: 0.6;
        }
    </style>
    <script>
        $(function () {
            $("#item2").hide();
            $("#item3").hide();
            $("#itemBtn2").hide();

            $("#hr1").show();
            $("#hr2").hide();
            $("#hr3").hide();

            $("#itemBtn1").click(function () {
                $("#item2").show();
                $("#itemBtn2").show();
                $("#itemBtn1").hide();

                $("#hr1").hide();
                $("#hr2").show();

                $("#card-list1").css("height", "1000px");
            });

            $("#itemBtn2").click(function () {
                $("#item3").show();
                $("#itemBtn2").hide();

                $("#hr2").hide();
                $("#hr3").show();

                $("#card-list1").css("height", "1250px");
            });
        });
        var currentPic = 0;
        var opacity = 1;
        var numOfPics = 2;
        var maxOpacity = 1;
        var minOpacity = 1;
        var speed = 20;
        var timer = 4000;
        var pics = [];

        pics[0] = "../../img/banner2.png";
        pics[1] = "../../img/banner7.jpg";

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
    <div class="card-list" id="card-list1" style="height: 600px;">
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
                        <div style="width: 220px; height: 20px; font-size: 9px; font-size: 13px; font-weight: bold; padding-top: 20px">
                                ${dto.item_releaseprice}
                        </div>
                        <div style="font-size: 10px; opacity: 0.6;">즉시 구매가</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="clear: left"></div>
        <input class="plus" id="itemBtn1" type="button" value="더보기">
        <div id="hr1" style="width: 950px; border: 1px solid #e3e3e3"></div>
        <div id="item2">
            <c:forEach items="${itemDtoList2}" var="dto" varStatus="i">
                <div class="item-wrapper">
                    <div class="item-box" style="margin-bottom: 20px; font-size: 5px;">
                        <img src="../../img/item_image/${dto.item_image}">
                        <div style="width: 220px; font-size: 10px; font-weight: bold;">${dto.item_brandname}</div>
                        <div style="width: 220px; font-size: 9px;
                        padding-top: 5px;">${dto.item_engname}</div>
                        <div style="width: 220px; height: 20px; font-size: 9px; font-size: 13px; font-weight: bold; padding-top: 20px">
                                ${dto.item_releaseprice}
                        </div>
                        <div style="font-size: 10px; opacity: 0.6">즉시 구매가</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="clear: left"></div>
        <input class="plus" id="itemBtn2" type="button" value="더보기">
        <div id="hr2" style="width: 950px; border: 1px solid #e3e3e3"></div>
        <div id="item3">
            <c:forEach items="${itemDtoList3}" var="dto" varStatus="i">
                <div class="item-wrapper">
                    <div class="item-box" style="margin-bottom: 20px; font-size: 5px;">
                        <img src="../../img/item_image/${dto.item_image}">
                        <div style="width: 220px; font-size: 10px; font-weight: bold;">${dto.item_brandname}</div>
                        <div style="width: 220px; font-size: 9px;
                        padding-top: 5px;">${dto.item_engname}</div>
                        <div style="width: 220px; height: 20px; font-size: 9px; font-size: 13px; font-weight: bold; padding-top: 20px">
                                ${dto.item_releaseprice}
                        </div>
                        <div style="font-size: 10px; opacity: 0.6">즉시 구매가</div>
                    </div>
                </div>
            </c:forEach>
            <div style="clear: left"></div>
            <div id="hr3" style="width: 950px; border: 1px solid #e3e3e3; margin-top: 50px;"></div>
        </div>
    </div>

    <div class="card-list" style="height: 350px;">
        <div style="margin-left: 10px;">
            <span style="font-weight: bold; font-size: 14px;">Items By Category </span><br>
            <span style="opacity: 0.6; font-size: 12px;">카테고리별 상품</span>
        </div>
        <div id="select-menu">
            <div class="menu"><img src="../../img/item_image/22.png"></div>
            <div class="menu"><img src="../../img/item_image/35.png"></div>
            <div class="menu"><img src="../../img/item_image/17.png"></div>
            <div class="menu"><img src="../../img/item_image/5.png"></div>
            <div class="menu"><img src="../../img/item_image/47.png"></div>
        </div>
        <div style="clear: left"></div>
        <div style=" float: left">
            <div class="menu-name">Top</div>
            <div class="menu-name">Bottom</div>
            <div class="menu-name">Outer</div>
            <div class="menu-name">Shoes</div>
            <div class="menu-name">Bag</div>
        </div>
        <div style="clear: left"></div>
    </div>
    <div class="card-list">
        <div style="margin-left: 10px;">
            <span style="font-weight: bold; font-size: 14px;">Most Popular</span><br>
            <span style="opacity: 0.6; font-size: 12px;">인기 상품</span>
        </div>
        <div id="most-box">
            <c:forEach items="${itemDtoList4}" var="dto" varStatus="i">
                <div class="item-wrapper">
                    <div class="item-box" style="margin-bottom: 20px; font-size: 5px;">
                        <img src="../../img/item_image/${dto.item_image}">
                        <div style="width: 220px; font-size: 10px; font-weight: bold;">${dto.item_brandname}</div>
                        <div style="width: 220px; font-size: 9px;
                        padding-top: 5px;">${dto.item_engname}</div>
                        <div style="width: 220px; height: 20px; font-size: 9px; font-size: 13px; font-weight: bold; padding-top: 20px">
                                ${dto.item_releaseprice}
                        </div>
                        <div style="font-size: 10px; opacity: 0.6;">즉시 구매가</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="clear: left"></div>
    </div>
</div>
</body>
</html>