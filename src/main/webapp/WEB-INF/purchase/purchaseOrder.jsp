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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"
    />
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
            height: 1500px;
            padding: 40px;
            box-sizing: border-box;
            margin: 100px auto 200px auto;
            line-height: 30px;
            background-color: #ffffff;
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

        .btn-submit {
            width: 100%;
            padding-top: 15px;
            padding-bottom: 20px;
            border-radius: 15px;
            background-color: #747f55;
            color: #ffffff;
            font-size: 14px;
            cursor: pointer;
            height: 50px;
        }

        #addr-btn {
            margin-left: 470px;
            cursor: pointer;
            opacity: 0.7;
            font-size: 14px;
        }

        #addr-modal {
            margin-top: 140px;
            height: 590px;
            border-radius: 25px;
        }

        #addrForm > div {
            line-height: 25px;
        }

        .modal-input {
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 14px;
        }

        .modal-input > input:not(.btn-modal) {
            width: 95%;
            background-color: #ffffff;
            border: none;
            border-radius: 0px;
            border-bottom: 1px solid #e3e3e3;
            padding-left: 0px;
            color: black;
            font-size: 13px;
        }

        .modal-input > input:focus {
            outline: none;
        }

        .btn-modal {
            border-radius: 10px;
            padding: 0px 40px;
            background-color: #ffffff;
            border: 2px solid #dfebda;
            cursor: pointer;
        }

        .btn-modal:hover {
            background-color: #dfebda;
        }

        .addr-search:hover {
            background-color: #ffffff;
            font-weight: bold;
            color: black;
        }

        .agree-sub {
            border-bottom: 1px solid #e3e3e3;
            line-height: 22px;
            font-size: 14px;
            padding: 16px 0;
            margin: 10px 0;
            font-weight: normal;
        }

        .agree-sub > span {
            font-size: 11px;
            opacity: 0.6;
        }

        .chk {
            width: 25px;
        }

        input[type="checkbox"] {
            display: none;
            float: right;
        }

        input[type="checkbox"] + label {
            width: 23px;
            height: 23px;
            border: 2px solid #747f55;
            position: relative;
            margin-right: 5px;
            float: right;
        }

        input[id="check1"]:checked + label::after, input[id="check2"]:checked + label::after,
        input[id="check3"]:checked + label::after, input[id="check4"]:checked + label::after {
            content: '✔';
            color: #fff;
            background: #747f55;
            font-size: 18px;
            width: 23px;
            height: 23px;
            text-align: center;
            left: 0;
            top: 0;
            float: right;
            padding-top: 0;
        }

        .pay-box {
            width: 220px;
            border-radius: 15px;
            border: 1px solid #e3e3e3;
            float: left;
            font-size: 14px;
            padding: 20px 0 20px 20px;
            margin-top: 15px;
        }

        #purchaseForm {
            margin-top: 15px;
            margin-bottom: 60px;
        }
    </style>
    <script>
        $(function () {
            $("#btn_payment").click(function () {
                var IMP = window.IMP;
                IMP.init('imp01454568');
                IMP.request_pay({
                    pg: 'uplus', // version 1.1.0부터 지원.
                    /*
                        'kakao':카카오페이,
                        html5_inicis':이니시스(웹표준결제) 2
                            'nice':나이스페이 2
                            'payco':페이코
                            'syrup':시럽페이
                            'paypal':페이팔
                        */
                    pay_method: 'card',
                    /*
                        'samsung':삼성페이,
                        'card':신용카드,
                        'trans':실시간계좌이체,
                        'vbank':가상계좌,
                        'phone':휴대폰소액결제
                    */
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    /*
                        merchant_uid에 경우
                        https://docs.iamport.kr/implementation/payment
                        위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                        참고하세요.
                        나중에 포스팅 해볼게요.
                     */
                    name: '주문명:결제테스트',
                    //결제창에서 보여질 이름
                    amount: 1000,
                    //가격
                    buyer_email: 'iamport@siot.do',
                    buyer_name: '구매자이름',
                    buyer_tel: '010-1234-5678',
                    buyer_addr: '서울특별시 강남구 삼성동',
                    buyer_postcode: '123-456',
                    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
                    /*
                        모바일 결제시,
                        결제가 끝나고 랜딩되는 URL을 지정
                        (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
                        */
                }, function (rsp) {
                    console.log(rsp);
                    if (rsp.success) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }
                    alert(msg);
                });
            });
            $("#addr-modal").hide();
            $("#basic-box").css("border", "1px solid black");

            if ("${deliveryWay}" !== "nomal") {
                $(".select-box").click(function () {
                    $(".select-box").css("border", "1px solid #e3e3e3");
                    $(this).css("border", "1px solid black");
                });
            }

            $("#btn-submit").click(function () {
                let addr = $("#buy-addr").text();
                let name = $("#buy-name").text();
                let phone = $("#buy-phone").text();
                let addr_info = name + "," + phone + "," + addr;

                $.ajax({
                    type: "post",
                    url: "insertBuyBid",
                    data: {
                        "price": "${price}",
                        "size": "${size}",
                        "deadline": "${deadline}",
                        "addr": addr_info
                    },
                    success: function (res) {
                        alert(res + "님 구매입찰이 완료되었습니다.")
                        location.reload();
                    }
                });
            });
            $(".modal-input > input:not(.btn-modal)").click(function () {
                $(".modal-input > input").css("border-bottom", "1px solid #e3e3e3");
                $(this).css("border-bottom", "2px solid #747f55");
                $(".none-input").css("border-bottom", "1px solid #e3e3e3");
            });

            $("#modal-submit").click(function () {
                let name = $("#modal-name").val();
                let phone = $("#modal-phone").val();
                let addr = $("#sample6_address").val() + " " + $("#sample6_detailAddress").val();

                $("#buy-name").text(name);
                $("#buy-phone").text(phone);
                $("#buy-addr").text(addr);
            });
            let day = ['일', '월', '화', '수', '목', '금', '토'];
            let today = new Date();
            let tomorrow = new Date(today.setDate(today.getDate() + 1));
            $("#tomorrow").text((tomorrow.getMonth() + 1) + "/" + tomorrow.getDate() + "(" + day[tomorrow.getDay()] + ")");

            $("#btn-submit").attr("disabled", true);
            $("#btn-submit").css("background-color", "#e3e3e3");
            $("#btn-submit").css("cursor", "unset");

            $("#price").text(comma(${price}) + "원")
            $("#totalPrice").text(comma(${price}+5500) + "원")

            $(".chk").change(function () {
                if ($('input:checkbox[class=chk]:checked').length === 4) {
                    $("#btn-submit").attr("disabled", false);
                    $("#btn-submit").css("background-color", "#747f55");
                    $("#btn-submit").css("cursor", "pointer");
                } else {
                    $("#btn-submit").attr("disabled", true);
                    $("#btn-submit").css("background-color", "#e3e3e3");
                    $("#btn-submit").css("cursor", "unset");
                }
            });
        });

        function comma(str) {
            str = String(str);
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
    <div><i id="logo">구매/결제</i></div>
    <div class="hr"></div>
    <div id="info" style="width: 100%; height: 20%; margin-left: 40px; margin-bottom: 20px;">
        <img src="/img/item_image/${dto.item_image}"
             style="width: 110px; float: left; margin-right: 20px; border-radius: 10px;">
        <div id="left-info"
             style="width: 70%; float: left; height: 40%; margin-right: 20px; margin-bottom: 10px; line-height: 20px; margin-top: 15px">
            <div id="content" style="font-size: 14px;">
                <b style="font-size: 14px">${dto.item_modelnum}</b><br>
                ${dto.item_engname}
                <div style="opacity: 0.6; font-size: 14px;">${dto.item_korname}</div>
                ${size}
            </div>
        </div>
        <div id="right-info"
             style="width: 90%; float: left; height: 40%;">
            <span style="font-size: 18px;">배송 주소</span>
            <a id="addr-btn" href="#addr-modal" rel="modal:open">+ 새 주소 추가</a>
            <table>
                <tr>
                    <td class="left-td">받는분</td>
                    <td class="right-td" id="buy-name">김영돈</td>
                </tr>
                <tr>
                    <td class="left-td">연락처</td>
                    <td class="right-td" id="buy-phone">010-2152-9843</td>
                </tr>
                <tr>
                    <td class="left-td">배송 주소</td>
                    <td class="right-td" id="buy-addr">경기 성남시 분당구 경부고속도로 409 (삼평동) 111</td>
                </tr>
            </table>
        </div>
    </div>
    <div id="result-immediate" style="margin-left: 40px">
        <div class="result-content"
             style="border-top: 1px solid #e3e3e3; width: 95%; margin-top: 10px;">
        </div>
        <div style="padding-bottom: 30px; font-size: 14px; opacity: 0.4">
        </div>
        <div style="font-size: 18px; margin-top: 5px">배송 방법</div>
        <div class="select-box" id="basic-box">
            <c:if test="${deliveryWay eq 'nomal'}">
                <img src="../../img/iconmonstr-shipping-box-3-240 (2).png" class="typeImg" style="float: left;">
            </c:if>
            <c:if test="${deliveryWay eq 'fast'}">
                <img src="../../img/iconmonstr-weather-76-240 (1).png" class="typeImg" style="float: left;">
            </c:if>
            <div style="margin-top: 18px; margin-left: 65px; width: 300px; height: 55px; line-height: 20px">
                <c:if test="${deliveryWay eq 'nomal'}">
                    일반배송 3,000원
                </c:if>
                <c:if test="${deliveryWay eq 'fast'}">
                    빠른배송 5,000원
                </c:if>
                <br><span>
                <c:if test="${deliveryWay eq 'nomal'}">
                    검수 후 배송 ・ 5-7일 내 도착 예정
                </c:if>
                <c:if test="${deliveryWay eq 'fast'}">
                    <span style="opacity: 0.6">지금 결제시</span> <span style="color: #297DCB;">내일 <span
                        id="tomorrow"></span> 도착 예정</span>
                </c:if>
            </span></div>
        </div>
        <div class="select-box">
            <img src="../../img/iconmonstr-building-5-240.png" class="typeImg" style="float: left">
            <div style="margin-top: 18px; margin-left: 65px; width: 300px; height: 55px; line-height: 20px">
                창고보관 첫 30일 무료
                <br><span style="opacity: 0.6;">배송 없이 창고에 보관 ・ 빠르게 판매 가능</span></div>
        </div>
    </div>
    <div id="totalOrderInfo" style="border-top: 1px solid #e3e3e3; width: 90%; height: 10%; margin-top: 40px; margin-left: 40px;
    padding-top: 35px">
        <div style="font-size: 18px; margin-bottom: 10px">최종 주문 정보</div>
        <div style="font-size: 14px">총 결제금액</div>
        <div style="color: red; margin-left: 550px; font-size: 18px"><b id="totalPrice">173,500원</b></div>
        <div id="sub-info" style="border-top: 2px solid #e3e3e3; padding-bottom: 50px; margin-top: 30px">
            <table style="padding-top: 20px">
                <tr>
                    <td>즉시 구매가</td>
                    <td class="td2" align="right"><b id="price"></b></td>
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
        <div id="purchaseForm">
            <div style="font-size: 18px; margin-bottom: 10px">결제 방법</div>
            <div style="font-size: 15px;">일반 결제 <span style="opacity: 0.6; font-size: 12px;">일시불・할부</span></div>
            <div id="perchase-selectBox">
                <div class="pay-box" style="margin-right: 10px">
                    신용카드
                </div>
                    <div class="pay-box">
                        카카오페이
                        <img src="../../img/kakaopay.png" style="width: 50px; margin-left: 90px;">
                    </div>
                <div style="clear: left"></div>
            </div>
        </div>
        <div class="agree-box">
            <div class="agree-sub">
                <input type="checkbox" required="required" class="chk" name="chkBox" id="check1" style="width: 25px;">
                <label for="check1" style="margin-top: 8px"></label>
                판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수 있습니다.<br>
                <span>앱 알림 해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래 진행 상태 알림을 받을 수 없습니다.</span>
            </div>
            <div class="agree-sub">
                <input type="checkbox" required="required" id="check2" name="chkBox" class="chk">
                <label for="check2" style="margin-top: 8px"></label>
                창고 보관을 선택한 경우, 구매자에게 배송되지 않고 TREASURE 창고에 보관됩니다.<br>
                <span>검수 합격 후 보관이 완료되면 창고 이용료(현재 첫 30일 무료)가 결제됩니다.</span>
            </div>
            <div class="agree-sub">
                <input type="checkbox" required="required" id="check3" name="chkBox" class="chk">
                <label for="check3" style="margin-top: 8px"></label>
                구매 입찰의 거래가 체결되면, 단순 변심이나 실수에 의한 취소가 불가능합니다.<br>
                <span>본 거래는 개인간 거래로 전자상거래법(제17조)에 따른 청약철회(환불, 교환) 규정이 적용되지 않습니다.</span>
            </div>
            <div class="agree-sub" style="border: none; font-weight: bold">
                구매 조건을 모두 확인하였으며, 입찰 진행에 동의합니다.
                <input type="checkbox" required="required" id="check4" name="chkBox" class="chk">
                <label for="check4"></label>
            </div>
        </div>
        <input type="hidden" id="userNum">
        <div style="margin-top: 50px; font-size: 18px;">
            <span><b>총 결제 금액</b></span><span style="margin-left: 455px; color: red"><b>173,500원</b></span>
        </div>
        <input type="button" value="구매 입찰하기" class="btn-submit" id="btn-submit"><br><br>
        <input type="button" value="결제" class="btn-submit" id="btn_payment">
    </div>
</div>

<!-- 주소 modal창 -->
<div id="addr-modal">
    <div align="center" style="margin-bottom: 30px; font-weight: bold">새 주소 추가</div>
    <form id="addrForm">
        <div class="modal-input">
            이름<br>
            <input type="text" id="modal-name" placeholder="수령인 이름 입력" required="required">
        </div>
        <div class="modal-input">
            전화번호<br>
            <input type="text" id="modal-phone" placeholder="- 없이 입력" required="required"
                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
        </div>
        <input type="hidden" id="sample6_extraAddress">
        <div class="modal-input">
            우편번호<br>
            <input type="text" placeholder="우편 번호를 검색하세요" class="none-input" id="sample6_postcode"
                   readonly="readonly" style="float: left; width: 75%" required="required">
            <input type="button" class="btn-modal addr-search" onclick="sample6_execDaumPostcode()" value="주소 검색"
                   style="float: left; font-size: 12px; padding: 0px 19px; height: 40px; margin-top: 7px;
                            border-radius: 0px; border: none; border-bottom: 1px solid #e3e3e3">
        </div>
        <div style="clear: left; margin-bottom: 20px"></div>
        <div class="modal-input">
            주소<br>
            <input type="text" id="sample6_address" placeholder="우편 번호 입력 시 자동 입력" class="none-input"
                   readonly="readonly">
        </div>
        <div class="modal-input">
            상세 주소<br>
            <input type="text" id="sample6_detailAddress" placeholder="건물, 아파트, 동/호수 입력" required="required">
        </div>
        <div align="center">
            <a href="#" rel="modal:close">
                <input type="button" class="btn-modal" value="취소">
            </a>
            <a href="#" rel="modal:close">
                <input type="button" class="btn-modal" id="modal-submit" value="저장">
            </a>
        </div>
    </form>
</div>

<!-- 주소api -->
<script type="text/javascript">
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>