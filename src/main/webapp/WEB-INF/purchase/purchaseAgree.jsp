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
        }

        .agree-wrapper {
            width: 900px;
            padding: 40px;
            box-sizing: border-box;
            margin-top: 20px !important;
            line-height: 30px;
            margin: auto;
            position: relative;
        }

        input[type="checkbox"] {
            display: none;
            float: right;
        }

        input[type="checkbox"] + label {
            width: 25px;
            height: 25px;
            border: 2px solid #747f55;
            position: relative;
            margin-right: 5px;
            float: right;
            overflow: hidden;
        }

        input[id="check1"]:checked + label::after, input[id="check2"]:checked + label::after,
        input[id="check3"]:checked + label::after, input[id="check4"]:checked + label::after,
        input[id="check5"]:checked + label::after, input[id="check6"]:checked + label::after {
            content: '✔';
            color: #fff;
            background: #747f55;
            font-size: 18px;
            width: 25px;
            height: 25px;
            text-align: center;
            position: absolute;
            left: 0;
            top: 0;
            float: right;
            padding-top: 5px;
        }


        #agree-back {
            font-size: 15px;
            color: #747f55;
            background-color: #fff;
            padding: 17px 30px;
            border-radius: 25px;
            font-weight: 400;
            text-transform: capitalize;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            margin: auto;
            width: 48%;
            text-align: center;
            margin-bottom: 50px;
            margin-top: 30px;
            border: 1px solid #747f55;
            cursor: pointer;
        }

        #agree-next {
            font-size: 15px;
            color: #fff;
            background-color: #747f55;
            padding: 17px 30px;
            border-radius: 25px;
            font-weight: 400;
            text-transform: capitalize;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            margin: auto;
            width: 48%;
            text-align: center;
            margin-bottom: 50px;
            margin-top: 30px;
            border: 1px solid #747f55;
        }

        #agree-next:hover {
            background-color: #fff;
            color: #747f55;
            border: 1px solid #747f55;
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

        .item {
            width: 100%;
            margin: auto;
            margin-top: 30px;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .item-photo {
            width: 150px;
            object-fit: cover;
            border-radius: 10px;
        }

        .item-info {
            display: flex;
            flex-direction: column;
            margin-left: 20px;
        }

        .item-info > li {
            list-style: none;
            font-size: 14px;
        }

        .agree-ment {
            margin-top: 30px;
            font-size: 20px;
        }

        .agree-sub {
            border-bottom: 1px solid #e3e3e3;
            line-height: 22px;
            font-size: 16px;
            padding: 16px 0;
            margin: 10px 0;
            font-weight: normal;
        }

        .agree-sub > span {
            font-size: 13px;
            opacity: 0.6;
        }

        .agree-box {
            border: 1px solid #e3e3e3;
            padding: 20px 50px 20px 50px;
            margin-top: 20px;
            border-radius: 20px;
        }

        .agree-check > div {
            display: flex;
            align-items: center;
            padding: 10px;
        }

        .agree-check > div > span {
            display: flex;
            align-items: center;
            font-size: 15px;
            padding: 3px;
            width: 640px;
            margin-left: 10px;
        }

        .hr {
            border: none;
            height: 2px;
            background: black;
            margin-bottom: 50px;
        }
    </style>

    <%--	전체 체크되었을 때만 다음으로 이동 가능--%>
    <script>
        function checkAgreement() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            for (var i = 0; i < checkboxes.length; i++) {
                if (!checkboxes[i].checked) {
                    alert("모든 약관에 동의해야 합니다.");
                    return;
                }
            }

            //사이즈와 배송 방법 같이 넘겨주기
            location.href = "/buy/type?item_num=${dto.item_num}&size=${size}&deliveryWay=${deliveryWay}&price=${price}";
        }

        function checkAllAgreements() {
            var checkboxes = document.querySelectorAll('#agree-check input[type="checkbox"]');
            var allChecked = true;
            for (var i = 0; i < checkboxes.length - 1; i++) {
                if (!checkboxes[i].checked) {
                    allChecked = false;
                    break;
                }
            }
            checkboxes[checkboxes.length - 1].checked = allChecked;
        }
    </script>
</head>
<body>
<div class="agree-wrapper">
    <div><i id="logo">구매동의</i></div>
    <div class="hr"></div>
    <div class="item">
        <img alt="" src="/img/item_image/${dto.item_image}" class="item-photo">
        <ul class="item-info" style="line-height: 22px;">
            <li><b>${dto.item_modelnum}</b></li>
            <li>${dto.item_engname}</li>
            <div style="opacity: 0.6; font-size: 14px;">${dto.item_korname}</div>
            <li>${size}</li>
        </ul>
    </div>

    <div class="agree-ment" style="font-size: 22px;"><b style="color: #747f55;">구매</b> 전 꼭 확인 해주세요</div>

    <div class="agree-box" id="agree-check">
        <div class="agree-sub">
            <input type="checkbox" required="required" class="chk" name="chkBox" id="check1" style="width: 25px;">
            <label for="check1" style="margin-top: 8px"></label>
            구매하려는 상품이 맞습니다.<br>
            <span>상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.</span>
        </div >
        <div class="agree-sub">
            <input type="checkbox" required="required" id="check2" name="chkBox" class="chk">
            <label for="check2" style="margin-top: 3px"></label>
            국내/해외에서 발매한 정품 · 새상품입니다.<br>
            <span>모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 국내 발매 상품 여부는 확인드리지 않습니다.</span>
        </div>
        <div class="agree-sub">
            <input type="checkbox" required="required" id="check3" name="chkBox" class="chk">
            <label for="check3" style="margin-top: 3px" ></label>
            제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.<br>
            <span>박스/패키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.</span>
        </div>
        <div class="agree-sub">
            <input type="checkbox" required="required" id="check4" name="chkBox" class="chk">
            <label for="check4" style="margin-top: 3px"></label>
            TREASURE의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.<br>
            <span>건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.</span>

        </div>
        <div class="agree-sub" style="border: none; font-weight: bold">
            위 사항을 모두 숙지 하였으며 전체 동의 합니다
            <input type="checkbox" id="check6" required="required"><label for="check6"></label>
        </div>
    </div>

    <div style="display: flex;">
        <button type="button" id="agree-back"
                onclick="location.href='select?item_num=${dto.item_num}&size=${size}&deliveryWay=${deliveryWay}'">뒤로가기
        </button>
        <button type="button" id="agree-next" onclick="checkAgreement()">구매계속</button>
    </div>
</div>

<script type="text/javascript">

    $("#check6").click(function () {

        var allchk = $(this).is(":checked");

        $(".chk").prop("checked", allchk);

    });
    //4개 이상 체크 시 모두 동의에도 체크되도록 & 하나라도 체크 안하면 모두 동의 칸은 체크 해제
    $(".chk").click(function () {
        if ($('input:checkbox[class=chk]:checked').length === 4) {
            $("input[type='checkbox']").prop("checked", true);
            $('.chk').prop("checked", true);
        } else {
            $("#check6").prop("checked", false);
        }
    });

</script>
</body>
</html>