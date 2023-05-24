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
</style>
<script type="text/javascript">
	$(function() {
		//빠른배송 버튼 hover:아이콘 색상 변경
		$(".fastbox").hover(function() {
			$(".fa-paper-plane").css("color", "#ff6961");
		}, function() {
			$(".fa-paper-plane").css("color", "#ffffff");
		});

		//일반배송 버튼 hover:배송기간 색상 변경
		$(".nomalbox").hover(function() {
			$(".nomalday").css("color", "#747f55");
		}, function() {
			$(".nomalday").css("color", "#ffffff");
		});

		$("#bidbox").hide();
		//사이즈 선택했을 때 적용 사항
		$(".buy_size").click(function() {
			$(".buy_size").removeClass("size_active");
			$(this).addClass("size_active");
			price = $(this).text();
			if(price.includes("구매입찰")) {
				$("#bidbox").show();
				$(".fastbox").hide();
				$(".nomalbox").hide();
			} else {
				$("#bidbox").hide();
				$(".fastbox").show();
				$(".nomalbox").show();
			}
			//사이즈 값 받아오기
			size = $(this).find(':nth-child(1)').text();
		});

		//배송 방법 받아오기
		$(".btn-login").click(function() {
			//사이즈 선택 안했을 시 alert
			if (typeof size == "undefined") {
				alert("사이즈를 선택해주세요");
			} else {
				//deliveryWay : 배송방법
				if ($(this).hasClass("fastbox")) {
					deliveryWay = "fast"; //빠른배송
				} else {
					deliveryWay = "nomal"; //일반배송
				}
				//구매동의로 이동
				var data = "item_num=${item_num}&size=" + size + "&deliveryWay=" + deliveryWay;
				if ($(this).hasClass("fastbox")) {
					location.href = "order?" + data + "&orderPrice=" + uncomma(price);;
				} else {
					location.href = "check?" + data + "&price=" + price;;
				}

			}
		});
	});

	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	}
</script>
</head>
<body>
	<div class="login-wrapper">
		<div>
			<i id="logo">사이즈 선택</i>
		</div>
		<div class="hr"></div>
		<div style="display: flex;">
			<img src="/img/item_image/${dto.item_image}" class="buy_item_image">
			<div style="flex-direction: column; padding: 20px; margin-top: 55px; line-height: 22px;">
				<span class="buy_brand">${dto.item_modelnum}</span><br>
				<span style="font-size: 14px;">${dto.item_engname}</span><br>
				<span class="buy_title" style="opacity: 0.6;">${dto.item_korname}</span>
				<br>
			</div>
		</div>
		<c:choose>
			<%--  여성이라 사이즈는 225부터 시작, 사이즈는 5씩 증가--%>
			<c:when test='${dto.item_category eq "shoes"}'>
				<div style="display: inline-flex;">
				<c:forEach var="size" begin="225" step="5" end="270" varStatus="i">
				<div class="buy_size">
					<span class="buy_size selectSize">${size}</span>
					<br>
					<c:if test="${fn:length(buyNowPriceDto) ne 0}">
						<c:forEach items="${buyNowPriceDto}" var="buyPrice">
							<c:if test="${buyPrice.sell_size eq size}">
								<span class="buy_size" style="color: #ec0b00;"><fmt:formatNumber value="${buyPrice.sell_wishprice}" pattern="###,###,###"/></span>
							</c:if>
							<c:if test="${buyPrice.sell_size ne size}">
								<span class="buy_size" style="color: black;">구매입찰</span>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(buyNowPriceDto) eq 0}">
						<span class="buy_size" style="color: black;">구매입찰</span>
					</c:if>
				</div>
				<c:if test="${i.count%4==0}">
		</div>
		<div style="display: inline-flex; margin: auto;">
				</c:if>
				</c:forEach>
		</div>
			</c:when>

			<c:when test='${dto.item_category eq "bag"}'>
				<div style="margin-top: 30px;">
				<div class="buy_size">
					<span class="buy_size selectSize">ONE SIZE</span>
					<br>
					<c:if test="${fn:length(buyNowPriceDto) ne 0}">
						<span class="buy_size" style="color: #ec0b00;"><fmt:formatNumber value="${buyNowPriceDto.sell_wishprice}" pattern="###,###,###"/></span>
					</c:if>
					<c:if test="${fn:length(buyNowPriceDto) eq 0}">
						<span class="buy_size" style="color: black;">구매입찰</span>
					</c:if>
				</div>
				</div>
			</c:when>

			<c:otherwise>
				<c:set var="otherSize">XS,S,M,L,XL,XXL,XXXL</c:set>
				<div style="margin-top: 30px; display: inline-flex;">
					<c:forEach var="key" items="${otherSize}" varStatus="j">
					<div class="buy_size">
						<span class="buy_size selectSize">${key}</span>
						<br>
						<c:if test="${fn:length(buyNowPriceDto) ne 0}">
							<c:forEach items="${buyNowPriceDto}" var="buyPrice" varStatus="i">
								<c:choose>
									<c:when test="${fn:contains(buyPrice.sell_size, key)}">
										<span class="buy_size" style="color: #ec0b00;"><fmt:formatNumber value="${buyPrice.sell_wishprice}" pattern="###,###,###"/></span>
									</c:when>
									<c:otherwise>
										${buyPrice.sell_size}
										<span class="buy_size" style="color: black;">구매입찰</span>
									</c:otherwise>
								</c:choose>
<%--								<c:if test="${buyPrice.sell_size eq key}">--%>
<%--									<span class="buy_size" style="color: #ec0b00;"><fmt:formatNumber value="${buyPrice.sell_wishprice}" pattern="###,###,###"/></span>--%>
<%--								</c:if>--%>
<%--								<c:if test="${buyPrice.sell_size ne key}">--%>
<%--									${buyPrice.sell_size}--%>
<%--									<span class="buy_size" style="color: black;">구매입찰</span>--%>
<%--								</c:if>--%>
							</c:forEach>
						</c:if>
						<c:if test="${fn:length(buyNowPriceDto) eq 0}">
							<span class="buy_size" style="color: black;">구매입찰</span>
						</c:if>
					</div>
					<c:if test="${j.count%4==0}">
				</div>
				<div style="display: inline-flex;">
					</c:if>
					</c:forEach>
				</div>
			</c:otherwise>

			</c:choose>
		<div style="display: flex; margin-top: 25px;">
			<button type="button" class="btn-login fastbox">
				<i class="fa-solid fa-paper-plane fa-xs" style="color: #ffffff;"></i>&nbsp;빠른배송
			</button>
			<button type="button" class="btn-login nomalbox" style="line-height: 17px; padding-top: 16px">
				일반배송
				<br>
				<span class="nomalday" style="font-size: 5px; color: white;">3일</span>
			</button>
		</div>
		<div>
			<button type="button" class="btn-login" id="bidbox" style="line-height: 17px; padding-top: 16px;
			width: 99%">
				구매입찰
				<br>
				<span id="bidbox-sub" style="font-size: 5px;">3일</span>
			</button>
		</div>
	</div>
</body>
</html>