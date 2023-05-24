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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
        }

        .wrapper {
            width: 1300px;
            margin-bottom: 300px;
        }

        .container {
            width: 82%;
            height: 1200px;
            padding: 40px;
            box-sizing: border-box;
            margin-left: 0px;
            margin-top: 30px;
            float: left;
            /* background-color: lightgray; */
        }

        .side {
            width: 13%;
            height: 500px;
            margin-left: 45px;
            margin-top: 70px;
            float: left;
        }

        #side-top {
            margin-bottom: 30px;
            line-height: 30px;
        }

        #side-bottom {
            line-height: 30px;
        }

        .side-title {
            font-size: 20px;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .sub-title {
            font-size: 16px;
            font-weight: bold;
        }

        .sub-menu {
            opacity: 0.5;           
        }
        
        .subsub-menu{
	cursor: pointer;
}

.subsub-menu:hover{
	color: #747f55;
}

        #logo {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 40px;
        }

        .sell-header {
            width: 950px;
            font-size: 12px;
            display: flex;
            margin-left: 10px;
            margin-top: 20px;
            /* background-color: yellow; */
            padding: 10px;
            opacity: 0.7;
        }

        .bid-content {
            width: 850px;
            font-size: 13px;
            display: flex;
            margin-left: 10px;
            /* background-color: #FAFAFA; */
            border: 1px solid rgba(34, 34, 34, .05);
            box-shadow: 0 2px 6px rgba(0, 0, 0, .12);
            border-radius: 20px;
            padding: 10px;
            margin-bottom: 25px;
            justify-content: center;
            align-items: center;
        }

        .bid-content:hover {
            background-color: #f3f3f3;
        }

        .sellImg {
            width: 100px;
            height: 100px;
            border-radius: 15px;
        }

        .sellDescription {
            width: 500px;
            display: flex;
            flex-direction: column;
            margin-left: 10px;
            font-size: 13px;
            margin-top: 15px;
            padding-top: 8px;
        }

        .process-menu {
            float: left;
            width: 295px;
            height: 30px;
            font-size: 13px;
            text-align: center;
            padding: 20px 0;
            cursor: pointer;
        }

        .menu-num {
            font-size: 15px;
            font-weight: bold;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $(".process-menu").css("color", "gray");
            $("#bid-menu").css("border-bottom", "2px solid black");
            $(".menu-num").css("color", "black");
            $("#bid-menu").css("color", "black");
            $("#bid-num").css("color", "red");

            $("#bid-view").show();
            $("#ing-view").hide();
            $("#end-view").hide();

            $(".sell-header").hide();
            $("#bid-header").show();

            for (let i = 1; i <=${itemBuyBidJoinList.size()}; i++) {
                $(".wishprice" + i).text(comma($(".wishprice" + i).text()));
            }

            $(".process-menu").click(function () {
                $(".process-menu").css("border-bottom", "none");
                $(".process-menu").css("color", "gray");
                $(this).css("border-bottom", "2px solid black");
                $(this).css("color", "black");
                $(".menu-num").css("color", "black");
                $(this).children(".menu-num").css("color", "red");
                if ($(this).attr("name") === "구매입찰") {
                    $("#bid-view").show();
                    $("#ing-view").hide();
                    $("#end-view").hide();

                    $(".sell-header").hide();
                    $("#bid-header").show();
                } else if ($(this).attr("name") === "진행중") {
                    $("#bid-view").hide();
                    $("#ing-view").show();
                    $("#end-view").hide();

                    $(".sell-header").hide();
                    $("#ing-header").show();
                } else {
                    $("#bid-view").hide();
                    $("#ing-view").hide();
                    $("#end-view").show();

                    $(".sell-header").hide();
                    $("#end-header").show();
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
    
    <script type="text/javascript">
$(function(){
	
	$(".notready").click(function(){
		
		alert("서비스 준비 중입니다")
	});
})
</script>
</head>
<body>
<div class="wrapper">
    <div class="side">
        <div class="side-title">마이 페이지</div>
        <div id="side-top">
            <div class="sub-title">쇼핑 정보</div>
            <div class="sub-menu">
                <div class="subsub-menu" onclick="location.href='/user/buyHistory'" style="color: #747f55;">구매 내역</div>
                <div class="subsub-menu" onclick="location.href='/user/sellHistory'">판매 내역</div>
                <div class="subsub-menu notready">보관 판매</div>
                <div class="subsub-menu notready">관심 상품</div>
            </div>
        </div>
        <div id="side-bottom">
            <div class="sub-title">내 정보</div>
            <div class="sub-menu">
                <div class="subsub-menu" onclick="location.href='/user/myProfile'"><b>프로필 정보</b></div>
                <div class="subsub-menu notready">주소록</div>
                <div class="subsub-menu notready">결제 정보</div>
                <div class="subsub-menu notready">판매 정산 계좌</div>
                <div class="subsub-menu notready">현금영수증 정보</div>
                <div class="subsub-menu notready">포인트</div>
            </div>
        </div>
    </div>


    <div class="container">
        <h2 id="logo">구매 내역</h2>
        <div>
            <div class="process-menu" id="bid-menu" name="구매입찰">
                <div class="menu-num" id="bid-num">${itemBuyBidJoinList.size()}</div>
                구매 입찰
            </div>
            <div class="process-menu" name="진행중">
                <div class="menu-num">${purchaseIngList.size()}</div>
                진행 중
            </div>
            <div class="process-menu" name="종료">
                <div style="padding-top: 3px;"></div>
                <div class="menu-num">${purchaseEndList.size()}</div>
                종료
            </div>
            <div style="clear: left; border-top: 1px solid #e3e3e3; width: 90%;"></div>
        </div>

        <div class="sell-header" id="bid-header">
            <div style="width: 750px">전체 ${itemBuyBidJoinList.size()}개</div>
            <div style="width:200px; padding-left: 230px">구매 희망가</div>
            <div style="width:200px; padding-right: 60px; padding-top: 4px">만료일</div>
        </div>

        <div class="sell-header" id="ing-header">
            <div style="width: 750px">전체 ${purchaseIngList.size()}개</div>
            <div style="width:200px; margin-left: 70px; padding-top: 4px">상태</div>
        </div>

        <div class="sell-header" id="end-header">
            <div style="width: 750px">전체 ${purchaseEndList.size()}개</div>
            <div style="width:200px; padding-left: 300px; padding-top: 4px;">구매일</div>
            <div style="width:200px; padding-right: 60px; padding-top: 4px">상태</div>
        </div>

        <div style="margin-top: 30px;"></div>

        <section id="bid-view">
            <c:forEach var="list" items="${itemBuyBidJoinList}" varStatus="i">
                <div class="bid-content">
                    <div style="width:750px; display: flex; font-size: 15px;">
                        <img class="sellImg" src="../img/item_image/${list.itemDto.item_image}">
                        <div class="sellDescription">
                            <div>${list.itemDto.item_engname}</div>
                            <div style="opacity: 0.6">${list.itemDto.item_korname}</div>
                            <div>${list.buy_size}</div>
                        </div>
                    </div>
                    <div style="width:150px; color: #f15746;"></div>
                    <div style="width:400px; margin-right: 0px; font-size: 14px;" class="wishprice${i.count}">${list.buy_wishprice}원</div>
                    <div style="width:150px; padding-right: 20px; font-size: 14px;">
                        <fmt:formatDate value="${list.buy_inputday}" pattern="yyyy/MM/dd"></fmt:formatDate></div>
                </div>
            </c:forEach>
        </section>

        <section id="ing-view">
            <c:forEach var="list" items="${purchaseIngList}">
            <div class="bid-content">
                <div style="width:750px; display: flex; font-size: 15px;">
                    <img class="sellImg" src="../img/item_image/${list.itemDto.item_image}">
                    <div class="sellDescription">
                        <div>${list.itemDto.item_engname}</div>
                        <div style="opacity: 0.6">${list.itemDto.item_korname}</div>
                        <div>265</div>
                    </div>
                </div>
                <div style="width:150px; color: #f15746;"></div>
                <div style="width:150px; padding-right: 20px; font-size: 14px; text-align: center">
                    대기 중<br><span style="opacity: 0.6; font-size: 14px;">발송 대기</span>
                </div>
            </div>
                </c:forEach>
        </section>

        <section id="end-view">
            <c:forEach var="list" items="${purchaseEndList}">
            <div class="bid-content">
                <div style="width:750px; display: flex; font-size: 15px;">
                    <img class="sellImg" src="../img/item_image/${list.itemDto.item_image}">
                    <div class="sellDescription">
                        <div>${list.itemDto.item_engname}</div>
                        <div style="opacity: 0.6">${list.itemDto.item_korname}</div>
                        <div>255</div>
                    </div>
                </div>
                <div style="width:150px; color: #f15746;"></div>
                <div style="width:400px; margin-right: 30px"><fmt:formatDate value="${list.buynow_inputday}" pattern="yyyy/MM/dd"></fmt:formatDate></div>
                <div style="width:300px; font-size: 15px;">
                    배송완료
                </div>
            </div>
            </c:forEach>
        </section>

    </div>

    <div style="clear: left"></div>
</div>


</body>
</html>
