<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">
    <title></title>

    <script type="text/javascript">


    </script>


    <style type="text/css">
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            margin-top: 50px;
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
            float: left;
            margin-right: 65px; /*아이템별 간격  */
            margin-left: 10px;
            margin-bottom: 150px;
        }

        #itemmain{
            float: left;
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
            cursor: pointer;
        }

        .p {
            width: 200px;;
            height: 130px;
            margin-top: 20px;
            position: absolute;
            margin-left: 20px;
            font-size: 12px;
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
        }

        #brandcolor{
            color: black;
            font-weight: bold;
        }
    </style>
</head>
<script type="text/javascript">
    $(document).ready(function() {
       $(".init").click(function() {
           location.reload();
       });
    });
</script>
<body>
    <div class="Kategorie" style=" width: 200px; float: left; ">

        <form action="searchselect" method="get">
        <input type="hidden" name="searchText" value="${searchText}">
            <b style="font-size: 20px;">브랜드</b>
<%--            <a href="/item/itemsearch?searchText=${searchText}"><b style="font-size: 11px; float: left;">선택 초기화</b></a>--%>
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

            <label><input type="radio" name="brand" value="Porter"><span
                    style="vertical-align: top;">Porter</span></label>


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


    <div style="width:1000px; height: 5100px; margin-left: 20%; padding-left: 0px;" id="searchmain">
        <div>
            <b style=" margin-left: 60px; float: left"> 상품 ${fn:length(searchList)} 개</b>
        </div>

        <c:if test="${fn:length(searchList) ne 0}">
        <div id="itemmain">
            <c:forEach var="searchList" items="${searchList}" varStatus="i">
                <div class="imgbox">
                    <div class="pho">
                        <a href="detail?item_num=${searchList.item_num}">
                            <img alt="" src="../img/item_image/${searchList.item_image }" style="width: 220px; height: 200px; border-radius: 30px; cursor: pointer;"></a>
                    </div>
                    <span class="p"><b id="brandcolor" style="color: black;">${searchList.item_brandname }</b><br>
                  <br>${searchList.item_engname }<br>
               <br>
               <b style="color: black; font-size: 13px;">${searchList.item_releaseprice}</b></span>
                </div>
            </c:forEach>
        </div>
        <div style="clear: left;"></div>
    </div>
        </c:if>
</body>
</html>