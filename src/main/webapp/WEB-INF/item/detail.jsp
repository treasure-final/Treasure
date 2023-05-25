<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link
			href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;890;900&display=swap"
			rel="stylesheet"
	>
	<title>Treasure</title>
	<!-- Bootstrap core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- Additional CSS Files -->
	<link rel="stylesheet" href="../assets/css/fontawesome.css">
	<link rel="stylesheet" href="../assets/css/template.css">
	<link rel="stylesheet" href="../assets/css/owl.css">
	<!-- <link rel="stylesheet" href="assets/css/animate.css"> -->
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
	<!-- <link rel="stylesheet" href="../assets/css/detail.css"> -->
	<!--chart.js  -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

		select {
			text-align: center;
		}

		* {
			font-family: "GmarketSansMedium";
		}

		.btn-detail-border:hover {
			border-color: #747f55;
			background-color: #747f55;
			color: #fff;
		}

		.btn-detail {
			--bs-btn-color: #fff;
			--bs-btn-bg: #747f55;
			--bs-btn-border-color: #747f55;
			--bs-btn-hover-color: #747f55;
			--bs-btn-hover-bg: #fff;
			--bs-btn-hover-border-color: #747f55;
			--bs-btn-focus-shadow-rgb: 49, 132, 253;
			--bs-btn-active-color: #fff;
			--bs-btn-active-bg: #747f55;
			--bs-btn-active-border-color: #747f55;
			--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
			--bs-btn-disabled-color: #fff;
			--bs-btn-disabled-bg: #747f55;
			--bs-btn-disabled-border-color: #747f55;
			border-radius: 25px;
		}

		.btn-outline-detail {
			--bs-btn-color: #747f55;
			--bs-btn-border-color: #747f55;
			--bs-btn-hover-color: #fff;
			--bs-btn-hover-bg: #747f55;
			--bs-btn-hover-border-color: #747f55;
			--bs-btn-focus-shadow-rgb: 13, 110, 253;
			--bs-btn-active-color: #fff;
			--bs-btn-active-bg: #747f55;
			--bs-btn-active-border-color: #747f55;
			--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
			--bs-btn-disabled-color: #747f55;
			--bs-btn-disabled-bg: transparent;
			--bs-btn-disabled-border-color: #747f55;
			--bs-gradient: none;
			border-radius: 25px;
		}

		.detail-box {
			-ms-overflow-style: none;
			/* IE and Edge */
			scrollbar-width: none;
			/* Firefox */
		}

		.detail-box::-webkit-scrollbar {
			display: none;
			/* Chrome, Safari, Opera*/
		}

		.item-detail {
			border-radius: 23px;
			background-color: #fff;
			padding: 30px;
		}

		hr {
			background-color : rgba(34, 34, 34, 0.1);
			height:1px;
			border:0;
		}
	</style>
	<script type="text/javascript">
		$(function() {
			item_num = $(".item_num").val();

			getChartData("체결 거래", item_num, "전체", "all");  // 차트
			tabContentChange("체결 거래", item_num, "all");     // 체결 거래 탭
			sendPurchaseRecentPriceSizeRequest(item_num, "모든 사이즈");

			// 모달창에서 사이즈 선택
			$(".sizeselect").click(function() {
				var buy_size = $(this).find(".size").text();
				//alert(buy_size)
				$(".size-text").text(buy_size);
				$(".size-select").val(buy_size);
				$("#sizeModal").modal("hide");

				$(".chart-size").val(buy_size);

				sendPurchaseRecentPriceSizeRequest(item_num, buy_size);

				// 차트 변경
				type = $(".chart-type").val();
				if(type == "")
					type = "체결 거래";

				period = $(".chart-period").val();
				if(period == "")
					period = "전체";

				if(buy_size == "모든 사이즈" || buy_size == "")
					buy_size = "all";

				// alert("sizeselect : " +type + "," +item_num + ","+ period + "," + buy_size);
				getChartData(type, item_num, period, buy_size);
				tabContentChange(type, item_num, buy_size);
			});

			// 시세 차트 tab
			$(".chart-tab").click(function () {
				item_num = $(".item_num").val();

				period = $(this).text();
				$(".chart-period").val(period);

				size = $(".chart-size").val();
				if(size == "모든 사이즈" || size == "")
					size = "all";

				type = $(".chart-type").val();
				if(type == "")
					type = "체결 거래";

				// alert(period + "," + size + "," + type)
				if (period != "전체" && $("#all").hasClass("show")) {
					$("#all").removeClass("show active");
				}

				// alert("chart-tab : " + type + "," +item_num + ","+ period + "," + size)
				getChartData(type, item_num, period, size);
			});

			// 체결 거래, 판매 입찰, 구매 입찰 버튼
			$(".chart-btn").click(function() {
				item_num = $(".item_num").val();

				type = $(this).text();
				$(".chart-type").val(type);

				period = $(".chart-period").val();
				if(period == "")
					period = "전체";

				size = $(".chart-size").val();
				if(size == "모든 사이즈" || size == "")
					size = "all";

				// alert("chart-btn : " + type + "," +item_num + ","+ period + "," + size)

				getChartData(type, item_num, period, size);
				tabContentChange(type, item_num, size);
			});

			// 시세 모달에서 사이즈 변경
			$("#size-select2").on("change", function() {
				var size = $(this).val();
				$("#modal-size").val(size);
				tab = $("#modal-tab").val();

				if(tab == "")
					tab = "deal";
				// alert(size + ", " + tab);
				modalSizeChange(tab, size);
			});

			// 시세 모달에서 탭 변경
			$(".modal-btn").click(function() {
				var tab = $(this).attr("aria-controls");
				$("#modal-tab").val(tab);

				size =  $("#modal-size").val();
				if(size == "")
					size = "모든 사이즈";

				//alert(size + ", " + tab);
				modalSizeChange(tab, size);
			});

		});

		function loginCheck(type) {
			var item_num = '${item_num}';
			var loginOk = '${sessionScope.loginOk}';

			if(loginOk != "") {
				if(type == "buy")
					location.href='${root}/buy/select?item_num=' + item_num;
				else
					location.href='${root}/sell/sellSize?item_num=' + item_num;
			} else {

				if(confirm("로그인이 필요한 서비스입니다\n로그인 화면으로 이동하려면 확인을 클릭해주세요")) {
					location.href='${root}/user/loginForm';
				}
			}

		}

		function tabContentChange(type, item_num, size) {
			// alert(type + ", " + size)

			$.ajax({
				url : '/item/getTabContent',
				type : 'GET',
				data : {
					"type" : type,
					"item_num" : item_num,
					"size" : size
				},
				dataType : 'json',
				success : function(res) {
					var tabType = "";
					var s = '';

					if(res.length == 0){
						s += '<div class="p-2 mb-1" style="text-align: center;">';
						s += '<div class="d-flex" style="padding: 5px; height: 20vh; line-height: 25vh;" >';
						s += '<span class="w-100" style="opacity: 0.4; font-size: 1.2em;"><i class="fa-solid fa-chart-line"></i>'

						if(type == "체결 거래") {
							$(".tab-deal").css("display", "none");
							$(".tab-deal-null").css("display", "block");
							tabType = "tab-deal-null"
							s += ' 체결된 거래가 아직 없습니다';
						}
						else if(type == "구매 입찰") {
							$(".tab-buy").css("display", "none");
							$(".tab-buy-null").css("display", "block");
							tabType = "tab-buy-null"
							s += ' 구매 입찰 내역이 아직 없습니다';
						}
						else {
							$(".tab-sell").css("display", "none");
							$(".tab-sell-null").css("display", "block");
							tabType = "tab-sell-null"
							s += ' 판매 입찰 내역이 아직 없습니다';
						}

						s += '</span>';
						s += '</div>';
						s += '</div>';
					} else {

						s += '<div class="p-2 mb-1" style="height: 25vh;">';
						s += '<div class="d-flex" style="padding: 5px; text-align: center; margin-right: 20px">';
						s += '<div class="col-6">';
						s += '<span style="font-size: 0.8em; color: #a0a0a0; margin-right: 20px">사이즈<span>';
						s += '</div>';
						s += '<div class="col-3">';
						s += '<span style="font-size: 0.8em; color: #a0a0a0; margin-right: 35px">';

						if(type == "체결 거래") {
							$(".tab-deal-null").css("display", "none");
							$(".tab-deal").css("display", "block");
							tabType = "tab-deal"
							s += '거래가';
						}
						else if(type == "구매 입찰") {
							$(".tab-buy-null").css("display", "none");
							$(".tab-buy").css("display", "block");
							tabType = "tab-buy"
							s += '구매 희망가';
						}
						else {
							$(".tab-sell-null").css("display", "none");
							$(".tab-sell").css("display", "block");
							tabType = "tab-sell"
							s += '판매 희망가';
						}

						s += '</span>';
						s += '</div>';
						s += '<div class="col-3">';
						s += '<span style="font-size: 0.8em; color: #a0a0a0; margin-left: 30px">';

						if(type == "체결 거래") {
							s += '거래일';
						}
						else {
							s += '수량';
						}

						s += '</span>';
						s += '</div>';
						s += '</div>';

						s += '<hr class="mt-0 mb-0">';

						$.each(res, function(i, dto) {
							console.log(i + ":" +dto.date)
							if (i >= 5) {
								return false; // 반복 종료
							}

							s += '<div class="d-flex" id="size_'+ dto.size +'" style="padding: 5px; text-align: center; margin-right: 20px;">';
							s += '<div class="col-6">';
							s += '<span style="font-size: 0.9em; color: #666; margin-right: 20px">' + dto.size + '</span>';
							s += '</div>';
							s += '<div class="col-4">';
							s += '<span style="font-size: 0.9em; color: #666; float: right; margin-right: 90px">';
							s += dto.price +"원";
							s += '</span>';
							s += '</div>';
							s += '<div class="col-2">';
							s += '<span style="font-size: 0.9em; color: #666; margin-right: 15px">';

							if(type == "체결 거래") {
								s += dto.date;
							} else
								s += dto.count;

							s += '</span>';
							s += '</div>';
							s += '</div>';

						});

						for(var i = res.length; i < 5; i++) {

							s += '<div class="d-flex" style="padding: 5px; text-align: center; margin-right: 20px;">';
							s += '<div class="col-6">';
							s += '<span style="font-size: 0.9em; color: #666; margin-right: 25px">-</span>';
							s += '</div>';
							s += '<div class="col-4">';
							s += '<span style="font-size: 0.9em; color: #666; float: right; margin-right: 120px">-</span>';
							s += '</div>';
							s += '<div class="col-2">';
							s += '<span style="font-size: 0.9em; color: #666; margin-right: 15px">-</span>';
							s += '</div>';
							s += '</div>';

						}

						s += '<div>';
						s += '<button type="button" class="btn btn-outline-detail w-100" style="margin-top: 20px;" data-bs-toggle="modal" data-bs-target="#detailModal">';

						if(type == "체결 거래")
							s += '체결 내역 더보기';
						else
							s += '입찰 내역 더보기';

						s += '</button>';
						s += '</div>';
					}

					$("." + tabType).html(s);

				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error("AJAX 요청 에러:", error);
				}
			});
		}

		function modalSizeChange(tab, size) {
			// alert(tab + ", " + size)

			if(size == "모든 사이즈") {
				count = $("." + tab + ".m_size").length;
			}
			else {
				$("."+ tab + ".m_size").removeClass("d-flex");
				$("."+ tab + ".m_size").css("display", "none");

				count = $("." + tab + ".m_size.m_size_" + size).length;
			}

			if(count == 0) {
				$("."+ tab + ".modal-ori").css("display", "none");
				$("."+ tab + ".modal-scroll").css("overflow-y", "hidden");
				$("."+ tab + ".modal-null").css("display", "block");
			} else {
				if(size == "모든 사이즈") {
					$("."+ tab + ".modal-ori").css("display", "block");
					$("."+ tab + ".m_size").addClass("d-flex");
					$("."+ tab + ".m_size").css("display", "flex");
					$("."+ tab + ".modal-null").css("display", "none");
					$("."+ tab + ".modal-scroll").css("overflow-y", "scroll");
				} else {
					$("."+ tab + ".m_size.m_size_"+size).css("display", "flex");
					$("."+ tab + ".modal-ori").css("display", "block");
					$("."+ tab + ".modal-scroll").css("overflow-y", "scroll");
					$("."+ tab + ".modal-null").css("display", "none");
				}
			}


		}

		function sendPurchaseRecentPriceSizeRequest(item_num, buy_size) {
			if(buy_size == "모든 사이즈")
				buy_size = "all";

			$.ajax({
				url : '/item/getOrderRecentPrice',
				type : 'GET',
				data : {
					"item_num" : item_num,
					"buy_size" : buy_size
				},
				dataType : 'json',
				success : function(res) {

					// alert(res.recentPrice + ", " + res.percentChange)

					if(res.recentPrice != 0) {
						// 숫자 포맷팅 및 업데이트
						const formatter = new Intl.NumberFormat('ko-KR');
						const formattedValue = formatter.format(Number(res.recentPrice));
						$(".ChangeRecentPrice").text(formattedValue);

						if(res.percentChange < 0) {
							$(".ChangeRecentPrice-span").css("color", "#ec0b00");
							$(".ChangeRecentPrice-span").css("opacity", "1");
							$("#ChangeRecentPrice-i").html('<i class="fa fa-caret-down me-1" id="ChangeRecentPrice-i"></i>');
							$(".price-change").text(res.priceChange);
							$(".percent-change").text(res.percentChange);
						} else if(res.percentChange > 0) {
							$(".ChangeRecentPrice-span").css("color", "green");
							$(".ChangeRecentPrice-span").css("opacity", "1");
							$("#ChangeRecentPrice-i").html('<i class="fa fa-caret-up me-1" id="ChangeRecentPrice-i"></i>');
							$(".price-change").text(res.priceChange);
							$(".percent-change").text(res.percentChange);
						} else {
							$(".ChangeRecentPrice-span").css("color", "black");
							$(".ChangeRecentPrice-span").css("opacity", "0.6");
							$("#ChangeRecentPrice-i").html('<i class="me-5" id="ChangeRecentPrice-i"></i>');
							$(".price-change").text(0);
							$(".percent-change").text(0);
						}

						$(".ChangeRecentPrice-span").css("display", "block");

					} else {
						$(".ChangeRecentPrice").text("-");
						$(".ChangeRecentPrice-span").css("display", "none");
					}
				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error("AJAX 요청 에러:", error);
				}
			});
		}

		function handleSizeSelect() {
			var selectElement = document.getElementById("size-select");
			var selectElement2 = document.getElementById("size-select2");
			var selectedValue = selectElement.value;
			var sizeTextElement = document.querySelector(".size-text");

			$(".chart-size").val(selectedValue);

			// 선택된 값을 size-text 요소에 삽입
			sizeTextElement.innerHTML = selectedValue;

			// 선택한 값을 두 번째 select 요소에 옵션으로 추가
			var option = document.createElement("option");
			option.value = selectedValue;
			option.text = selectedValue;
			selectElement2.add(option);

			// 선택한 값을 두 번째 select 요소에서 선택 상태로 설정
			selectElement2.value = selectedValue;

			// 차트 변경
			type = $(".chart-type").val();
			if(type == "")
				type = "체결 거래";

			period = $(".chart-period").val();
			if(period == "")
				period = "전체";

			size = $(".chart-size").val();

			sendPurchaseRecentPriceSizeRequest(item_num, size);
			if(size == "모든 사이즈" || size == "")
				size = "all";

			item_num = $(".item_num").val();
			// alert("handleSizeSelect : " +type + "," +item_num + ","+ period + "," + size);

			sendPurchaseRecentPriceSizeRequest(item_num, size);
			getChartData(type, item_num, period, size);
			tabContentChange(type, item_num, size);
		}

		var myChart1 = null;
		var myChart3 = null;
		var myChart6 = null;
		var myChart12 = null;
		var myChartAll = null;

		function getChartData(type, item_num, period, size) {
			// alert(type + "," +item_num + ","+ period + "," + size);

			$.ajax({
				url : '/item/getChartData',
				type : 'get',
				data : {
					"type" : type,
					"item_num" : item_num,
					"size" : size,
					"period" : period
				},
				dataType : 'json',
				success : function(res) {
					console.log(res);

					if(res.date.length == 0) {
						console.log("데이터 0개");

						$(".price-chart").removeClass("d-flex");
						$(".price-chart").css("display", "none");
					}
					else {

						//$(".price-chart").addClass("d-flex");
						$(".price-chart").css("display", "flex");

						var myChart = null; // 차트 객체를 저장할 변수
						var chart = null; // 차트의 ID를 저장할 변수

						if (period == '1개월') {
							if (myChart1) {
								myChart1.destroy(); // 이전 차트 제거
							}

							chart = 'myChart1';
							myChart = myChart1;
						} else if (period == '3개월') {
							if (myChart3) {
								myChart3.destroy(); // 이전 차트 제거
							}

							chart = 'myChart3';
							myChart = myChart3;
						} else if (period == '6개월') {
							if (myChart6) {
								myChart6.destroy(); // 이전 차트 제거
							}

							chart = 'myChart6';
							myChart = myChart6;
						} else if (period == '1년') {
							if (myChart12) {
								myChart12.destroy(); // 이전 차트 제거
							}

							chart = 'myChart12';
							myChart = myChart12;
						} else {
							if (myChartAll) {
								myChartAll.destroy(); // 이전 차트 제거
							}

							chart = 'myChartAll';
							myChart = myChartAll;
						}

						var monthList = [];
						var monthData = [];

						$.each(res.date, function(i, date) {
							var dateObj = new Date(date);
							var year = dateObj.getFullYear();
							var month = (dateObj.getMonth() + 1).toString().padStart(2, '0');
							var day = dateObj.getDate().toString().padStart(2, '0');
							var formattedDate = year + '/' + month + '/' + day;

							console.log("date[" + i + "]: " + formattedDate);
							monthList.push(formattedDate);

						});

						$.each(res.wish_price, function(i, price) {
							console.log("wish_price[" + i + "]: " + price);
							monthData.push(price);
						});

						if (res.date.length == 1) {
							// 직선을 생성하기 위해 데이터 포인트를 중복해서 추가
							monthList.push(monthList[0]);
							monthData.push(monthData[0]);
						}

						var canvas = document.createElement('canvas');
						canvas.id = chart;
						var ctx = canvas.getContext('2d');

						var existingCanvas = document.getElementById(chart);
						if (existingCanvas) {
							existingCanvas.parentNode.replaceChild(canvas, existingCanvas);
						}

						myChart = new Chart(ctx, {
							type : 'line',
							data : {
								labels : monthList,
								datasets : [ {
									data : monthData,
									borderColor : 'rgba(255, 99, 132, 1)',
									borderWidth : 1,
									pointStyle : false
								} ]
							},

							options : {
								responsive : false,
								scales : {
									x : {
										ticks : {
											maxRotation : 0,
										},
										display : false,
										grid : {
											display : false
										}
									},
									y : {
										position : 'right',// `axis` is determined by the position as `'y'`

										grid : {
											display : false
										}
									}

								},
								responsive : true,
								plugins : {
									legend : {
										display : false
									}

								}
							}
						});
					}

				},
				error : function(xhr, status, error) {
					// 에러 처리
					console.error("AJAX 요청 에러:", error);
				}
			});

		}
	</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>" />
<div class="container mb-5">
	<input type="hidden" class="item_num" value=${item_num }>
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content" style="padding: 1rem; height: 89vh;">
				<div class="row">
					<div class="col-lg-6" style="padding: 0; padding-left: 0.7rem; height: 89vh;">
						<div class="featured-games header-text" style="width: 100%; height: 85vh;">
							<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
								<div class="carousel-indicators" style="margin-bottom: 100px">
									<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0"
											class="active" aria-current="true" aria-label="Slide 1"
									></button>
								</div>
								<div class="carousel-inner">
									<div class="carousel-item active" data-bs-interval="4000" data-bs-pause="hover">
										<img src="/assets/images/${Ddto.item_image }" class="d-block w-100" alt="..."
											 style="position: relative; bottom: 50px"
										>
									</div>

								</div>

							</div>
						</div>
					</div>
					<div class="col-lg-6" style="height: 85vh;">
						<div style="height: 85vh;">
							<div class="item-detail detail-box"
								 style="padding: 2rem; padding-left: 2rem; padding-top: 0.8rem; width: 100%; height: 85vh; overflow-y: scroll;"
							>
								<!-- 상품명 -->
								<div class="heading-section mt-sm-3">
									<div style="margin-bottom: 0.5rem;">
										<span id="brandname" style="font-size: 1.5em; font-weight: 600;">${Ddto.item_brandname }</span>
										<span id="category"
											  style="font-size: 1em; font-weight: 500; margin-left: 1rem; color: #666"
										>|&nbsp;&nbsp;&nbsp;${Ddto.item_category}</span>
									</div>
									<span id="engname" style="font-size: 1.2em; font-weight: 600;">${Ddto.item_engname }</span>
									<br>
									<span id="korname" style="font-size: 1.1em; color: #666;">${Ddto.item_korname }</span>
								</div>
								<hr>
								<!-- 모델 번호, 출시일 ... -->
								<div class="d-flex pe-2">
									<div class="heading-section col-5">
										<div class="row mb-4">
											<span style="font-size: 1.1em; color: #666;">모델 번호</span>
											<span style="font-size: 1.2em; font-weight: 600;">${Ddto.item_modelnum }</span>
										</div>
										<div class="row mb-4">
											<span style="font-size: 1.1em; color: #666;">출시일</span>
											<span style="font-size: 1.2em; font-weight: 500;">${Ddto.item_releaseday} </span>
										</div>
										<div class="row mb-4">
											<span style="font-size: 1.1em; color: #666;">컬러</span>
											<span style="font-size: 1.2em; font-weight: 500;">${Ddto.item_color }</span>
										</div>
										<div class="row">
											<span style="font-size: 1.1em; color: #666;">발매가</span>
											<span style="font-size: 1.2em; font-weight: 500;">${Ddto.item_releaseprice }</span>
										</div>
									</div>
									<div class="col-7">
										<div class="mb-4">
											<button type="button" class="btn btn-detail btn-lg w-100"
													style="width: 290px; height: 7vh; margin-top: 70px; margin-left: 40px"
													onclick="loginCheck('buy')"
											>구매</button>
										</div>
										<div>
											<button type="button" class="btn btn-outline-detail btn-lg w-100"
													style="height: 7vh; width: 290px; margin-left: 40px;"
													onclick="loginCheck('sell')"
											>판매</button>
										</div>
									</div>
								</div>
								<hr>
								<!-- 사이즈 -->
								<div class="d-flex pe-2 mb-4">
									<div class="heading-section col-9">
										<span style="font-size: 1.1em; color: #666;">사이즈</span>
									</div>
									<div class="heading-section col-3">
											<span style="font-size: 1.1em; float: right;">
												<b class="size-text">모든 사이즈</b>
												&nbsp;
												<span class="fa fa-caret-down" data-bs-toggle="modal" data-bs-target="#sizeModal"></span>
											</span>
										<div class="modal" id="sizeModal" tabindex="-1">
											<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">사이즈</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body" style="padding-left: 2.1rem;">
														<div class="d-flex row col-12">
															<!-- 카테고리 별 사이즈 -->
															<c:if test="${Ddto.item_category != 'bag'}">
																<div class="col-4 p-2">

																	<button type="button" class="btn btn-outline-detail btn-lg w-100 sizeselect"
																			style="height: 10vh;"
																	>
																		<span class="size" style="font-size: 0.9rem;">모든 사이즈</span>
																		<br>

																		<c:if test="${minPrice != 0}">
																			<span style="font-size: 0.7rem; color: #ec0b00;"><fmt:formatNumber value="${minPrice}" type="number" /></span>
																		</c:if>

																		<c:if test="${minPrice == 0}">
																			<span style="font-size: 0.7rem; color: black;">구매입찰</span>
																		</c:if>
																	</button>
																</div>

															</c:if>

															<c:choose>
																<c:when test="${Ddto.item_category == 'shoes'}">
																	<c:forEach var="size" begin="220" end="270" step="5">
																		<div class="col-4 p-2">
																			<button type="button" class="btn btn-outline-detail btn-lg w-100 sizeselect"
																					style="height: 10vh;"
																			>
																				<span class="size" style="font-size: 0.9rem; margin-bottom: 1rem;">${size}</span>
																				<br>

																				<c:if test="${priceList.size() != 0}">
																					<c:forEach var="dto" items="${priceList }">
																						<c:if test="${dto.sell_size == size}">
																							<span style="font-size: 0.7rem; color: #ec0b00;"><fmt:formatNumber value="${dto.sell_wishprice}" type="number" /></span>
																						</c:if>

																						<c:if test="${dto.sell_size != size}">
																							<span style="font-size: 0.7rem; color: black;">구매입찰</span>
																						</c:if>
																					</c:forEach>
																				</c:if>

																				<c:if test="${priceList.size() == 0}">
																					<span style="font-size: 0.7rem; color: black;">구매입찰</span>
																				</c:if>
																			</button>
																		</div>
																	</c:forEach>
																</c:when>

																<c:when test="${Ddto.item_category == 'bag'}">
																	<div class="col-4 p-2">
																		<button type="button" class="btn btn-outline-detail btn-lg w-100 sizeselect"
																				style="height: 10vh;"
																		>
																			<span class="size" style="font-size: 0.9rem; margin-bottom: 1rem;">ONE SIZE</span>
																			<br>

																			<c:if test="${priceList.size() != 0}">
																				<c:forEach var="dto" items="${priceList }">
																					<c:if test="${dto.sell_size == size}">
																						<span style="font-size: 0.7rem; color: #ec0b00;"><fmt:formatNumber value="${dto.sell_wishprice}" type="number" /></span>
																					</c:if>

																					<c:if test="${dto.sell_size != size}">
																						<span style="font-size: 0.7rem; color: black;">구매입찰</span>
																					</c:if>
																				</c:forEach>
																			</c:if>

																			<c:if test="${priceList.size() == 0}">
																				<span style="font-size: 0.7rem; color: black;">구매입찰</span>
																			</c:if>
																		</button>
																	</div>
																</c:when>

																<c:otherwise>
																	<c:set var="otherSize">XS,S,M,L,XL,XXL,XXXL</c:set>
																	<c:forEach var="size" items="${otherSize}" varStatus="i">
																		<div class="col-4 p-2">
																			<button type="button" class="btn btn-outline-detail btn-lg w-100 sizeselect"
																					style="height: 10vh;"
																			>
																				<span class="size" style="font-size: 0.9rem; margin-bottom: 1rem;">${size}</span>
																				<br>

																				<c:if test="${priceList.size() != 0}">
																					<c:forEach var="dto" items="${priceList }">
																						<c:if test="${dto.sell_size == size}">
																							<span style="font-size: 0.7rem; color: #ec0b00;"><fmt:formatNumber value="${dto.sell_wishprice}" type="number" /></span>
																						</c:if>

																						<c:if test="${dto.sell_size != size}">
																							<span style="font-size: 0.7rem; color: black;">구매입찰</span>
																						</c:if>
																					</c:forEach>
																				</c:if>

																				<c:if test="${priceList.size() == 0}">
																					<span style="font-size: 0.7rem; color: black;">구매입찰</span>
																				</c:if>
																			</button>
																		</div>
																	</c:forEach>
																</c:otherwise>

															</c:choose>

														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 최근 거래가 -->
								<div class="d-flex pe-2 mb-5">
									<div class="heading-section col-9">
										<span style="font-size: 1.1em; color: #666;">최근 거래가</span>
									</div>

									<div class="heading-section col-3">
											<span style="font-size: 1.1em; float: right;">
												<b class="ChangeRecentPrice">
													<fmt:formatNumber value="" />
												</b>
												<b>원</b>
											</span>
										<span class="ChangeRecentPrice-span" style="font-size: 0.8em; float: right;">
												<i id="ChangeRecentPrice-i"></i>
												<span class="price-change"></span>원 (<span class="percent-change"></span>%)
											</span>

									</div>
								</div>
								<!-- 시세 -->
								<div class="d-flex pe-2 mb-3 price-chart">
									<div class="heading-section col-9">
										<span style="font-size: 1.3em; font-weight: 600;">시세</span>
										<br>
									</div>
									<div class="heading-section col-3">
										<!-- 카테고리 별 사이즈 -->
										<select class="form-select size-select" id="size-select" aria-label="size-select"
												style="border: 0px; font-size: 1em; float: right; color: #666;"
												onchange="handleSizeSelect()"
										>
											<option>모든 사이즈</option>

											<c:choose>
												<c:when test="${Ddto.item_category == 'shoes'}">
													<c:forEach var="size" begin="220" end="270" step="5">
														<option value="${size}">${size}</option>
													</c:forEach>
												</c:when>

												<c:when test="${Ddto.item_category == 'bag'}">
													<option value="ONE SIZE">ONE SIZE</option>
												</c:when>

												<c:otherwise>
													<c:set var="otherSize">XS,S,M,L,XL,XXL,XXXL</c:set>
													<c:forEach var="size" items="${otherSize}" varStatus="i">
														<option value="${size}">${size}</option>
													</c:forEach>
												</c:otherwise>
											</c:choose>

										</select>
									</div>
								</div>
								<!-- 시세 그래프 -->
								<div class="d-flex pe-2 mb-1 price-chart">
									<input type="hidden" class="chart-size" value="">
									<input type="hidden" class="chart-period" value="">
									<input type="hidden" class="chart-type" value="">
									<div class="col-xl-12">
										<div class="nav-align-top mb-4">
											<ul class="nav nav-pills mb-3 nav-fill" role="tablist">
												<li class="nav-item">
													<button type="button" class="btn btn-detail active w-100 chart-tab" role="tab"
															data-bs-toggle="tab" data-bs-target="#onemonth" aria-controls="onemonth"
															aria-selected="true" style="border-radius: 20px 0px 0px 20px"
													>1개월</button>
												</li>
												<li class="nav-item">
													<button type="button" class="btn btn-detail w-100 chart-tab" role="tab" data-bs-toggle="tab"
															data-bs-target="#threemonth" aria-controls="threemonth" aria-selected="false"
															style="border-radius: 0px"
													>3개월</button>
												</li>
												<li class="nav-item">
													<button type="button" class="btn btn-detail w-100 chart-tab" role="tab" data-bs-toggle="tab"
															data-bs-target="#sixmonth" aria-controls="sixmonth" aria-selected="false"
															style="border-radius: 0px"
													>6개월</button>
												</li>
												<li class="nav-item">
													<button type="button" class="btn btn-detail w-100 chart-tab" role="tab" data-bs-toggle="tab"
															data-bs-target="#oneyear" aria-controls="oneyear" aria-selected="false"
															style="border-radius: 0px"
													>1년</button>
												</li>
												<li class="nav-item">
													<button type="button" class="btn btn-detail w-100 chart-tab" role="tab" data-bs-toggle="tab"
															data-bs-target="#all" aria-controls="all" aria-selected="false"
															style="border-radius: 0px 20px 20px 0px"
													>전체</button>
												</li>
											</ul>
											<div class="tab-content">
												<div class="tab-pane fade" id="onemonth" role="tabpanel">
													<div style="width: 550px; margin-left: 0px">
														<canvas id="myChart1" height="100"></canvas>
													</div>

												</div>
												<div class="tab-pane fade" id="threemonth" role="tabpanel">
													<div style="width: 550px; margin-left: 0px">
														<canvas id="myChart3" height="100"></canvas>
													</div>

												</div>
												<div class="tab-pane fade" id="sixmonth" role="tabpanel">
													<div style="width: 550px; margin-left: 0px">
														<canvas id="myChart6" height="100"></canvas>
													</div>

												</div>
												<div class="tab-pane fade" id="oneyear" role="tabpanel">
													<div style="width: 550px; margin-left: 0px">
														<canvas id="myChart12" height="100"></canvas>
													</div>

												</div>
												<div class="tab-pane fade show active" id="all" role="tabpanel">
													<div style="width: 550px; margin-left: 0px">
														<canvas id="myChartAll" height="100"></canvas>
													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 체결 내역 -->
								<div class="d-flex pe-2 mb-5">
									<div class="col-xl-12">
										<div class="nav-align-top mb-4">
											<ul class="nav nav-pills mb-2 nav-fill" role="tablist">
												<li class="nav-item">
													<button type="button" class="btn btn-detail active w-100 chart-btn" role="tab"
															data-bs-toggle="tab" data-bs-target="#deal" aria-controls="deal" aria-selected="true"
															style="border-radius: 20px 0px 0px 20px"
													>체결 거래</button>
												</li>
												<li class="nav-item">
													<button type="button" class="btn btn-detail w-100 chart-btn" role="tab" data-bs-toggle="tab"
															data-bs-target="#sellBid" aria-controls="sellBid" aria-selected="false"
															style="border-radius: 0px"
													>판매 입찰</button>
												</li>
												<li class="nav-item">
													<button type="button" class="btn btn-detail w-100 chart-btn" role="tab" data-bs-toggle="tab"
															data-bs-target="#buyBid" aria-controls="buyBid" aria-selected="false"
															style="border-radius: 0px 20px 20px 0px"
													>구매 입찰</button>
												</li>
											</ul>
											<div class="tab-content">
												<div class="tab-pane fade show active" id="deal" role="tabpanel">
													<div class="tab-deal-null"></div>
													<div class="tab-deal"></div>
												</div>

												<div class="tab-pane fade" id="sellBid" role="tabpanel">
													<div class="tab-sell-null"></div>
													<div class="tab-sell"></div>
												</div>

												<div class="tab-pane fade" id="buyBid" role="tabpanel">
													<div class="tab-buy-null"></div>
													<div class="tab-buy"></div>
												</div>
											</div>

											<div class="modal" id="detailModal" tabindex="-1">
												<input type="hidden" id="modal-tab" value="">
												<input type="hidden" id="modal-size" value="">

												<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">시세</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body" style="padding-left: 2.1rem;">
															<div class="d-flex row col-12 mb-2">
																<div class="p-2" style="flex: 0 0 auto; width: 20%;">
																	<img src="/assets/images/${Ddto.item_image }"
																		 style="height: 8vh; border-radius: 1.3rem;"
																	>
																</div>
																<div class="p-2 mb-3" style="flex: 0 0 auto; width: 89%;">
																	<div class="row">
																			<span style="font-size: 0.7rem;">
																				<b>${Ddto.item_engname }</b>
																			</span>
																	</div>
																	<div class="row mb-2">
																		<span style="font-size: 0.6rem; color: #666">${Ddto.item_korname }</span>
																	</div>
																	<div class="row col-5">

																		<select class="form-select size-select" id="size-select2"
																				aria-label="size-select"
																				style="border: 0px; font-size: 1em; float: right; color: #666;">
																			<option selected>모든 사이즈</option>

																			<c:choose>
																				<c:when test="${Ddto.item_category == 'shoes'}">
																					<c:forEach var="size" begin="220" end="270" step="5">
																						<option value="${size}">${size}</option>
																					</c:forEach>
																				</c:when>

																				<c:when test="${Ddto.item_category == 'bag'}">
																					<option value="ONE SIZE">ONE SIZE</option>
																				</c:when>

																				<c:otherwise>
																					<c:set var="otherSize">XS,S,M,L,XL,XXL,XXXL</c:set>
																					<c:forEach var="size" items="${otherSize}" varStatus="i">
																						<option value="${size}">${size}</option>
																					</c:forEach>
																				</c:otherwise>
																			</c:choose>

																		</select>
																	</div>
																</div>
																<div class="nav-align-top mb-4">
																	<ul class="nav nav-pills mb-2 nav-fill" role="tablist">
																		<li class="nav-item">
																			<button type="button" class="btn btn-detail modal-btn active w-100" role="tab"
																					data-bs-toggle="tab" data-bs-target="#dealModal" aria-controls="deal"
																					aria-selected="true" style="font-size: 0.9rem;"
																			>체결 거래</button>
																		</li>
																		<li class="nav-item">
																			<button type="button" class="btn btn-detail modal-btn w-100" role="tab"
																					data-bs-toggle="tab" data-bs-target="#sellBidModal" aria-controls="sellBid"
																					aria-selected="false" style="font-size: 0.9rem;"
																			>판매 입찰</button>
																		</li>
																		<li class="nav-item">
																			<button type="button" class="btn btn-detail modal-btn w-100" role="tab"
																					data-bs-toggle="tab" data-bs-target="#buyBidModal" aria-controls="buyBid"
																					aria-selected="false" style="font-size: 0.9rem;"
																			>구매 입찰</button>
																		</li>
																	</ul>
																	<div class="tab-content">
																		<div class="tab-pane fade show active deal modal-scroll" id="dealModal" role="tabpanel"  style="overflow-y: scroll;">
																			<div class="p-2 mb-1 deal modal-ori" style="height: 17vh;">
																				<div class="d-flex">
																					<div class="col-6">
																						<span style="font-size: 0.8em; color: #a0a0a0; margin-left: 15px;">사이즈</span>
																					</div>
																					<div class="col-3">
																						<span style="font-size: 0.8em; color: #a0a0a0;">거래가</span>
																					</div>
																					<div class="col-3">
																						<span style="font-size: 0.8em; color: #a0a0a0;">거래일</span>
																					</div>
																				</div>
																				<hr class="mt-0 mb-0">

																				<c:forEach items="${getOrderData }" var="p">
																					<div class="d-flex deal m_size m_size_${p.size }">
																						<div class="col-6">
																							<span style="font-size: 0.9em; color: #666; margin-left: 15px;">${p.size }</span>
																						</div>
																						<div class="col-3">
																								<span style="font-size: 0.9em; color: #666;">
																									<fmt:formatNumber value="${p.wish_price }" />원
																								</span>
																						</div>
																						<div class="col-3">
																								<span style="font-size: 0.9em; color: #666;">
																									<script type="text/javascript">
																							          var dateTimeString = '${p.order_date }';
																									  var dateTime = new Date(dateTimeString);
																									  var year = dateTime.getFullYear();
																									  var month = (dateTime.getMonth() + 1).toString().padStart(2, '0');
																									  var day = dateTime.getDate().toString().padStart(2, '0');

																									  var formattedDate = year + '/' + month + '/' + day;
																									  document.write(formattedDate);
																							        </script>
																								</span>
																						</div>
																					</div>
																				</c:forEach>

																			</div>

																			<div class="p-2 mb-1 deal modal-null" style="text-align: center; height: 17vh; display: none;">
																				<div class="d-flex" style="padding: 5px;" >
																					<span class="w-100" style="opacity: 0.4; font-size: 1.1em; line-height: 17vh;"><i class="fa-solid fa-chart-line"></i> 체결된 거래가 아직 없습니다</span>
																				</div>
																			</div>

																		</div>
																		<div class="tab-pane fade sellBid modal-scroll" id="sellBidModal" role="tabpanel" style="overflow-y: scroll;">
																			<div class="p-2 mb-1 sellBid modal-ori" style="height: 17vh;">
																				<div class="d-flex">
																					<div class="col-6">
																						<span style="font-size: 0.8em; color: #a0a0a0; margin-left: 15px;">사이즈</span>
																					</div>
																					<div class="col-4">
																						<span style="font-size: 0.8em; color: #a0a0a0;">판매 희망가</span>
																					</div>
																					<div class="col-2">
																						<span style="font-size: 0.8em; color: #a0a0a0;">수량</span>
																					</div>
																				</div>

																				<hr class="mt-0 mb-0">

																				<c:forEach items="${groupedSellData }" var="s">
																					<div class="d-flex sellBid m_size m_size_${s.sell_size }">
																						<div class="col-6">
																							<span style="font-size: 0.9em; color: #666; margin-left: 15px;">${s.sell_size }</span>
																						</div>
																						<div class="col-3">
																								<span style="font-size: 0.9em; color: #666;">
																									<fmt:formatNumber value="${s.sell_wishprice }" />원
																								</span>
																						</div>
																						<div class="col-3" style="text-align: center;">
																							<span style="font-size: 0.9em; color: #666;">${s.count }</span>
																						</div>
																					</div>
																				</c:forEach>

																			</div>

																			<div class="p-2 mb-1 sellBid modal-null" style="text-align: center; height: 17vh; display: none;">
																				<div class="d-flex" style="padding: 5px;" >
																					<span class="w-100" style="opacity: 0.4; font-size: 1.1em; line-height: 17vh;"><i class="fa-solid fa-chart-line"></i> 판매 입찰 내역이 아직 없습니다</span>
																				</div>
																			</div>

																		</div>
																		<div class="tab-pane fade buyBid modal-scroll" id="buyBidModal" role="tabpanel" style="overflow-y: scroll;">
																			<div class="p-2 mb-1 buyBid modal-ori" style="height: 17vh;">
																				<div class="d-flex">
																					<div class="col-6">
																						<span style="font-size: 0.8em; color: #a0a0a0; margin-left: 15px;">사이즈</span>
																					</div>
																					<div class="col-4">
																						<span style="font-size: 0.8em; color: #a0a0a0;">구매 희망가</span>
																					</div>
																					<div class="col-2">
																						<span style="font-size: 0.8em; color: #a0a0a0;">수량</span>
																					</div>
																				</div>
																				<hr class="mt-0 mb-0">

																				<c:forEach items="${groupedBuyData }" var="g">
																					<div class="d-flex buyBid m_size m_size_${g.buy_size }">
																						<div class="col-6">
																							<span style="font-size: 0.9em; color: #666; margin-left: 15px;">${g.buy_size }</span>
																						</div>
																						<div class="col-3">
																								<span style="font-size: 0.9em; color: #666;">
																									<fmt:formatNumber value="${g.buy_wishprice }" />원
																								</span>
																						</div>
																						<div class="col-3" style="text-align: center;">
																							<span style="font-size: 0.9em; color: #666;">${g.count }</span>
																						</div>
																					</div>
																				</c:forEach>

																			</div>

																			<div class="p-2 mb-1 buyBid modal-null" style="text-align: center; height: 17vh; display: none;">
																				<div class="d-flex" style="padding: 5px;" >
																					<span class="w-100" style="opacity: 0.4; font-size: 1.1em; line-height: 17vh;"><i class="fa-solid fa-chart-line"></i> 구매 입찰 내역이 아직 없습니다</span>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<!-- 배송 정보 -->
								<div class="d-flex pe-2 mt-4 mb-4">
									<div class="heading-section col-12">
										<div class="row mb-1">
											<span style="font-size: 0.9em; color: #666;">배송 정보</span>
										</div>
										<div class="d-flex mb-2">
											<div class="col-1">
												<img src="/assets/img/fast-delivery.png">
											</div>
											<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>빠른배송</b>
														5,000원
													</span>
												<br>
												<span style="font-size: 0.8rem; color: #666;">지금 결제시</span>
												<c:set var="now" value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 1)%>" />
												<fmt:formatDate var="sysYear" value="${now}" pattern="MM월 dd일(E)" />
												<span style="font-size: 0.8rem; color: #8fcabb;">
														<c:out value="${sysYear}" />
														까지 도착예정
													</span>
											</div>
										</div>
										<div class="d-flex">
											<div class="col-1">
												<img src="/assets/img/original-delivery.png">
											</div>
											<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>일반배송</b>
														3,000원
													</span>
												<br>
												<span style="font-size: 0.8rem; color: #666;">검수 후 배송 ・ 5-7일 내 도착 예정</span>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<!-- 구매 전 확인 -->
								<div class="d-flex pe-2 mt-4 mb-4">
									<div class="heading-section col-12">
										<div class="row">
											<span class="mb-2" style="font-size: 1.3em; font-weight: 600;">구매 전 꼭 확인해주세요!</span>
										</div>
										<div class="accordion accordion-flush" id="accordionFlushExample">
											<div class="accordion-item">
													<span class="accordion-header" id="flush-headingOne">
														<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
																data-bs-target="#flush-collapseOne" aria-expanded="false"
																aria-controls="flush-collapseOne" style="font-size: 1rem; padding-left: 0;"
														>배송 기간 안내</button>
													</span>
												<div id="flush-collapseOne" class="accordion-collapse collapse"
													 aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample"
												>
													<div class="accordion-body">
															<span style="font-size: 0.8rem; color: #666;">
																<b>TREASURE는 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다. 배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는
																	속도에 따라 차이가 있습니다.</b>
																<br>
																<br>
																[빠른배송 구매]
																<br>
																<br>
																- 판매자가 보관 신청한 상품 중 검수에 합격한 상품을 TREASURE의 전용 창고에 보관합니다. 보관 상품에 한하여 바로 구매와 95점 구매가
																가능합니다.
																<br>
																<br>
																- 오늘(오후 11:59까지) 결제하면 내일 바로 출고되어 빠른 배송이 가능합니다. (연휴 및 공휴일, 천재지변, 택배사 사유 등 예외적으로 출고일이
																변경될 수 있습니다.
																<br>
																<br>
																[일반 구매]
																<br>
																<br>
																- 거래가 체결된 시점부터 48시간(일요일•공휴일 제외) 내에 판매자가 상품을 발송해야 하며, 통상적으로 발송 후 1-2일 내에 TREASURE
																검수센터에 도착합니다.
																<br>
																<br>
																- 검수센터에 도착한 상품은 입고 완료 후 3영업일 이내에 검수를 진행합니다. 검수 합격시 배송을 준비합니다.
																<br>
																* 상품 종류 및 상태에 따라 검수 소요 시간은 상이할 수 있으며, 구매의사 확인에 해당할 경우 구매자와 상담 진행으로 인해 지연이 발생할 수
																있습니다.
																<br>
																<br>
																- 검수센터 출고는 매 영업일에 진행하고 있으며, 출고 마감시간은 오후 5시입니다. 출고 마감시간 이후 검수 완료건은 운송장번호는 입력되지만 다음
																영업일에 출고됩니다.
															</span>
													</div>
												</div>
											</div>
											<div class="accordion-item">
												<h2 class="accordion-header" id="flush-headingTwo">
													<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
															data-bs-target="#flush-collapseTwo" aria-expanded="false"
															aria-controls="flush-collapseTwo" style="font-size: 1rem; padding-left: 0;"
													>검수 안내</button>
												</h2>
												<div id="flush-collapseTwo" class="accordion-collapse collapse"
													 aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample"
												>
													<div class="accordion-body">
															<span style="font-size: 0.8rem; color: #666;">
																<b>판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.</b>
																<br>
																<br>
																- 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다.
																<br>
																- 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다.
																<br>
																<br>
																<b>검수 결과는 불합격•검수 보류•합격의 세가지 상태로 결과가 변경됩니다.</b>
																<br>
																<br>
																* 검수 합격: TREASURE 검수택(Tag)이 부착되어 배송을 준비함
																<br>
																* 검수 보류: 앱에서 사진으로 상품의 상태 확인 및 구매 여부를 선택. (24시간 이후 자동 검수 합격)
																<br>
																* 검수 불합격: 즉시 거래가 취소되고 구매하신 금액을 환불 처리함.(환불 수단은 결제 수단과 동일)
															</span>
													</div>
												</div>
											</div>
											<div class="accordion-item">
												<h2 class="accordion-header" id="flush-headingThree">
													<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
															data-bs-target="#flush-collapseThree" aria-expanded="false"
															aria-controls="flush-collapseThree" style="font-size: 1rem; padding-left: 0;"
													>구매 환불/취소/교환 안내</button>
												</h2>
												<div id="flush-collapseThree" class="accordion-collapse collapse"
													 aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample"
												>
													<div class="accordion-body">
															<span style="font-size: 0.8rem; color: #666;">
																<b>TREASURE은 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.</b>
																<br>
																<br>
																- 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 상품을 원하지 않으시는 경우 언제든지 TREASURE에서 재판매를 하실 수 있습니다.
																<br>
																- 상품 수령 후, 이상이 있는 경우 TREASURE 고객센터로 문의해주시기 바랍니다.
															</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<!-- 정품 -->
								<div class="d-flex pe-2 mt-4 mb-4">
									<div class="heading-section col-12">
										<div class="d-flex mb-2">
											<div class="col-1">
												<img src="/assets/img/img-guide-item-01.svg">
											</div>
											<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>100% 정품 보증</b>
													</span>
												<br>
												<span style="font-size: 0.8rem; color: #666;">TREASURE에서 검수한 상품이 정품이 아닐 경우, 구매가의
														3배를 보상합니다.</span>
											</div>
										</div>
										<div class="d-flex">
											<div class="col-1">
												<img src="/assets/img/img-guide-item-02.svg">
											</div>
											<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>엄격한 다중 검수</b>
													</span>
												<br>
												<span style="font-size: 0.8rem; color: #666;">모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의
														체계적인 시스템을 거쳐 검수를 진행합니다.</span>
											</div>
										</div>
										<div class="d-flex">
											<div class="col-1">
												<img src="/assets/img/img-guide-item-03.svg">
											</div>
											<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>정품 인증 패키지</b>
													</span>
												<br>
												<span style="font-size: 0.8rem; color: #666;">검수에 합격한 경우에 한하여 TREASURE의 정품 인증
														패키지가 포함된 상품이 배송됩니다.</span>
											</div>
										</div>
									</div>
								</div>
								<hr>
								<!-- 책임 -->
								<div class="d-flex pe-2 mt-4 mb-4">
										<span style="font-size: 0.7rem; color: #666;">TREASURE(주)는 통신판매 중개자로서 통신판매의 당사자가
											아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 이용약관 및 정책, 기타 거래 체결
											과정에서 고지하는 내용 등에 따라 검수하고 보증하는 내용에 대한 책임은 TREASURE(주)에 있습니다.</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="mb-5 mt-5">
	<div class="d-flex">
		<div class="col-11 align-self-center">
				<span class="fs-4">
					<b>${Ddto.item_brandname }</b>의 다른 상품
				</span>
		</div>
		<div class="col-1 align-self-center">
				<span class="fs-5" style="float: right;" onclick="location.href='/item/itemlist'">
					더보기
					<a class="fa fa-chevron-right fs-5 ms-2" href="/item/itemlist"></a>
				</span>
		</div>
	</div>
	<div class="mt-4 mb-lg-5" style="height: 35vh;">
		<c:forEach items="${list }" var="a">
			<c:if
					test="${a.item_brandname==Ddto.item_brandname && a.item_category==Ddto.item_category && a.item_num!=Ddto.item_num}"
			>
				<a href='/item/detail?item_num=${a.item_num }'>
					<img alt="" src="/assets/images/${a.item_image }"
						 style="border: 1px solid rgba(34, 34, 34, 0.1); border-radius: 10px; height: 250px; width: 250px; margin-right: 5px;"
					>
				</a>
			</c:if>
		</c:forEach>
	</div>
	<hr>
	<div class="d-flex mt-5">
		<div class="col-12 align-self-center">
				<span class="fs-4">
					<b>스타일</b>
				</span>
		</div>
	</div>
	<div class="mt-4 mb-lg-5" style="height: 89vh;">
		<a href=''>
			<img alt="" src="/assets/images/8.png"
				 style="border: 1px solid gray; border-radius: 10px; height: 200px; width: 212px;"
			>
		</a>
	</div>
	<div class="col-lg-12 text-center">
		<button type="button" class="btn btn-outline-detail" style="width: 10%; height: 5vh;">더보기</button>
	</div>
</div>
<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/js/isotope.min.js"></script>
<script src="../assets/js/owl-carousel.js"></script>
<script src="../assets/js/tabs.js"></script>
<script src="../assets/js/popup.js"></script>
<script src="../assets/js/custom.js"></script>
</body>
</html>