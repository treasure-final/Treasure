<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../hangul.js" type="text/javascript"></script>
    <!-- or from CDN -->
    <script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
    <script src="/assets/js/data.js"></script>

    <title></title>





    <style type="text/css">
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'GmarketSansMedium';
        }

        div.main {
            font-family: "GmarketSansMedium";
            font-size: 13px;
            padding: 0;
            margin: 0;
            border: none;
        }

        div.Kategorie {
            width: 150px;
            height: 500px;
            /*overflow-y: scroll;
            -ms-overflow-style: none; !* 인터넷 익스플로러 *!
            scrollbar-width: none; !* 파이어폭스 *!*/
            top: 20px;
            margin-left: 50px;
        }

        div.Kategorie::-webkit-scrollbar {
            width: 10px;
        }

        div.Kategorie::-webkit-scrollbar-thumb {
            background: #dfebda; /* 스크롤바 색상 */
            border-radius: 10px; /* 스크롤바 둥근 테두리 */
        }

        div.Kategorie::-webkit-scrollbar-track {
            background: white /*스크롤바 뒷 배경 색상*/
        }

        /*버튼 클릭시 박스안 색상 변경  */
        input[type=checkbox] {
            accent-color: #747f55;
        }

        input[type=radio] {
            accent-color: #747f55;
        }

        input[type='checkbox'] {
            position: relative;
            bottom: 20px; /*체크박스  위치 조절*/

        }

        input[type='radio'] {
            position: relative;
            bottom: 20px; /*체크박스  위치 조절*/

        }

        div.imgbox {
            margin-top: 45px;
            width: 150px;
            height: 230px;
            display: inline-flex;
            margin-right: 65px; /*아이템별 간격  */
            margin-left: 10px;
            margin-bottom: 150px;
        }

        div.Kategorie > b {
            font-size: 14px;
        }

        div.Kategorie > li {
            font-size: 14px;

        }

        .pho {
            width: 220px;
            height: 200px;
            position: relative;
        }

        .p {
            width: 200px;;
            height: 130px;
            margin-top: 230px;
            position: absolute;
            margin-left: 20px;
            font-size: 5px;
        }

        span {
            font-size: 12px;
        }

        .pagename {
            width: 100%;
            margin-top: 30px;
            height: 100px;
            border: 0px solid red;
            font-size: 16px;
            margin-left: 230px;
        }


        #brandmenu > li {
            margin-right: 40px;
            margin-bottom: 10px;

        }


        .sortitembtn > b:hover {

            color: #747f55;

        }

        .sortitembtn > b {
            cursor: pointer;
        }

        #findbtn {
            font-size: 13px;
            color: #747f55;
            background-color: #fff;
            height: 30px;
            border-radius: 15px;
            font-weight: 400;
            text-transform: capitalize;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            margin: auto;
            width: 100px;
            text-align: center;
            margin-bottom: 50px;
            border: 1px solid #747f55;
            margin-left: 5px;
        }

        #findbtn:hover {
            background-color: #747f55;
            color: white;
        }

        #container {
            width: 1000px;
            min-height : 60vh;
        }
    </style>
</head>

<body>
<div id="container">
    <div class="pagename">
        <h3 style="margin-left: 430px; width: 100px;">Shop</h3>
        <br>

        <ul class="shopmenu" style="width: 500px; margin: 0 auto; font-size: 13px;">
            <li style="margin-right: 40px;"><a class="tot" href="itemlist">전체</a></li>
            <li style="margin-right: 40px;"><a class="shoes" href="itemck?ck=shoes">신발</a></li>
            <li style="margin-right: 40px;"><a class="outer" href="itemck?ck=outer">아우터</a></li>
            <li style="margin-right: 40px;"><a class="top" href="itemck?ck=top">상의</a></li>
            <li style="margin-right: 40px;"><a class="bottom" href="itemck?ck=bottom">하의</a></li>
            <li style="margin-right: 40px;"><a class="bag" href="itemck?ck=bag">잡화</a></li>
        </ul>
    </div>


    <div class="Kategorie" style=" width: 200px; float: left; ">


        <form action="itemck" method="get">


            <b style="font-size: 20px;">브랜드</b><br><br>
            <a href="/item/itemlist"><b style="font-size: 11px; float: left;">선택 초기화</b></a>
            <br>
            <br>
            <br>
            <label><input type="radio" name="brand" value="Nike">
                <span style="vertical-align: top;">Nike</span></label>
            <br>

            <label><input type="radio" name="brand" value="Jordan">
                <span style="vertical-align: top;">Jordan</span></label>
            <br>

            <label><input type="radio" name="brand" value="Adidas">
                <span style="vertical-align: top;">Adidas</span></label>
            <br>

            <label><input type="radio" name="brand" value="New Balance">
                <span style="vertical-align: top;">New Balance</span></label>
            <br>

            <label><input type="radio" name="brand" value="Arc'teryx">
                <span
                        style="vertical-align: top;">Arc'teryx</span></label>
            <br>

            <label><input type="radio" name="brand" value="COS">
                <span style="vertical-align: top;">COS</span></label>
            <br>

            <label><input type="radio" name="brand" value="Porter">
                <span
                        style="vertical-align: top;">Porter</span></label>
            <br>

            <label><input type="radio" name="brand" value="Our Legacy">
                <span style="vertical-align: top;">Our Legacy</span></label>
            <br>

            <label><input type="radio" name="brand" value="Stussy">
                <span style="vertical-align: top;">Stussy</span></label>
            <br>

            <label><input type="radio" name="brand" value="Stone Island">
                <span style="vertical-align: top;">Stone Island</span></label>
            <br>

            <label><input type="radio" name="brand" value="IAB Studio</">
                <span style="vertical-align: top;">IAB Studio</span></label>
            <br>

            <label><input type="radio" name="brand" value="AMI">
                <span style="vertical-align: top;">AMI</span></label>
            <br>

            <label><input type="radio" name="brand" value="Essentials">
                <span style="vertical-align: top;">Essentials</span></label>
            <br>

            <label><input type="radio" name="brand" value="Diesel">
                <span style="vertical-align: top;">Diesel</span></label>
            <br>

            <label><input type="radio" name="brand" value="Wooyoungmi">
                <span style="vertical-align: top;">Wooyoungmi</span></label>
            <br>

            

            <br><br>





            <b style="font-size: 20px;">카테고리</b>
            <br>
            <br>
            <label><input type="checkbox" name="ck" value="shoes">
                <span style="vertical-align: top;">신발</span></label><br>

            <label><input type="checkbox" name="ck" value="outer">
                <span style="vertical-align: top;">아우터</span></label><br>

            <label><input type="checkbox" name="ck" value="top">
                <span style="vertical-align: top;">상의</span></label><br>

            <label><input type="checkbox" name="ck" value="bottom">
                <span style="vertical-align: top;">하의</span></label><br>

            <label><input type="checkbox" name="ck" value="bag">
                <span style="vertical-align: top;">잡화</span></label><br>


            <label>
                <button type="submit" id="findbtn">
                    <span style="vertical-align: top;">찾아보기</span></button>
            </label>
            <br>

        </form>
    </div>


    <div style="width:1000px; margin-left: 20%; padding-left: 0px;">
        <div>
            <b style=" margin-left: 60px; float: left"> 상품 ${totitem } ${stotitem } ${soritem } 개</b>
            <div class="sortitembtn" align="right" style="margin-right: 30px; cursor: pointer">
                <a><b id="popsort">인기순</b></a> &nbsp; <a id="namesort" href="itemsort"><b>이름순</b></a>
            </div>
        </div>

        <div style="margin-left: 40px; border: 0px solid gray;">
            <c:forEach var="a" items="${list}" varStatus="i">
                <div class="imgbox">

                    <div class="pho">
                        <a href="detail?item_num=${a.item_num}"><img alt="" src="../img/item_image/${a.item_image }"
                                                                     style="width: 220px; height: 200px; border-radius: 30px; cursor: pointer;"
                        ></a>
                    </div>

                    <span class="p"> <b id="brandcolor"
                                        style="color: black; font-size: 2em;">${a.item_brandname }</b><br>
                  <br>${a.item_engname }<br> <b> ${a.item_korname }</b> <br>
               <br>
               <b style="color: black; font-size: 13px;">${a.item_releaseprice}</b>
               </span><br>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>


</html>

