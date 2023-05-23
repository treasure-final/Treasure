<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Treasure</title>
<!-- Bootstrap core CSS -->

<%--    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="application/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
	integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
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
	font-size: 23px;
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
}

.success-wrapper {
	width: 1000px;
	padding: 40px;
	box-sizing: border-box;
	margin-top: 80px !important;
	line-height: 30px;
	/*background-color: #ced4da;*/
	margin: auto;
	position: relative;
}

.success-content {
	width: 900px;
	height: 1020px;
	font-size: 14px;
	border: 1px solid rgba(34, 34, 34, .05);
	box-shadow: 0 2px 6px rgba(0, 0, 0, .12);
	border-radius: 20px;
	padding: 10px;
	margin-top: 20px;
}

.hr {
	border: none;
	height: 1.5px;
	background: black;
	margin: 25px 15px 25px 15px;
	overflow: hidden;
	opacity: 0.1;
}

.item-info{
	display: flex;
	align-items: center;
	margin: 15px;
}

.desscription {
	display: flex;
	flex-direction: column;
	margin-left: 10px;
	font-size: 15px;
	margin-top: 15px;	
}

#buttonProfile {
	display: flex;
	justify-content: center;
	align-items: center;
	
}

.profilebtn {
	font-size: 15px;
	color: black;
	background-color: #fff;
	padding: 15px 25px;
	border-radius: 20px;
	font-weight: 400;
	text-transform: capitalize;
	overflow: hidden;
	margin: auto;
	width: 40%;
	text-align: center;
	margin: 30px 3px 30px 3px;
	border: 1px solid #e3e3e3;
	box-shadow: 0 2px 4px rgba(0, 0, 0, .12);	
}

.profilebtn:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

.sell-price{
	margin-left: 15px;	
}

.return-addr{
	margin-left: 15px;
}

.account-info{
	margin-left: 15px;
}

.inputday{
	margin-left: 15px;
}

</style>
</head>
<body>
	<div class="success-wrapper">
		<div>
			<i id="logo">즉시판매 내역</i>
		</div>
		
		<div class="success-content">
			<div class="item-info">
				<img style="width: 150px; height: 150px; border-radius: 15px;" src="../img/item_image/12.png">
					<div class="desscription">
	                    <div>Nike ACG Storm-Fit ADV Cascade Rains Full Zip Jacket Black - Asia</div>
	                    <div style="opacity: 0.5;">나이키 ACG 스톰핏 ADV 케스케이드 레인 풀 집 자켓 블랙 - 아시아</div>
	                    <div>XL</div>
	                </div>
			</div>
			
			 <div class="hr"></div>
			 
			<div class="sell-price">
				<div style="display: flex;">
				<div style="margin-bottom: 30px;">
					<div style=" font-size: 17px; margin-bottom: 8px;">판매 가격</div>
					<div style=" font-size: 14px; opacity: 0.6;">수수료</div>
					<div style="font-size: 14px; opacity: 0.6;">검수비</div>
				</div>
				
				<div style="margin-bottom: 20px; margin-left: 600px; text-align: right;">
					<div style=" font-size: 17px; margin-bottom: 8px;">5,000,000 원</div>
					<div style=" font-size: 14px; opacity: 0.6;">-3,000 원</div>
					<div style=" font-size: 14px; opacity: 0.6;">-150,000 원</div>
				</div>
				</div>
				
				<div style="display: flex;">
				<div style=" font-size: 18px;">정산 금액</div>
				<div style="font-size: 20px; color: red; font-weight: bold; margin-left: 580px; text-align: right;">3,800,000 원</div>
				</div>			
			</div>
			
			<div class="hr"></div>
			
			<div class="return-addr">
				<div style="font-size: 18px; margin-bottom: 20px;">반송 정보</div>
				
				<div style="display: flex;">
					<div style="font-size: 15px; padding: 5px; opacity: 0.6;">
						<div>받는 분</div>
						<div>연락처</div>
						<div>주소</div>
					</div>
					
					<div style="font-size: 15px; margin-left: 100px; padding: 5px;">
						<div>주하랑</div>
						<div>01052409805</div>
						<div>경기도 성남시 수정구 고등로33 303동 1504호</div>
					</div>
				</div>				
			</div>
			
			<div class="hr"></div>
			
			<div class="account-info">
				<div style="font-size: 18px; margin-bottom: 15px;">정산 계좌 정보</div>			
				<div style="display: flex;">
					<div style="font-size: 15px; padding: 5px; opacity: 0.6;">
						<div>은행</div>
						<div>계좌번호</div>
					</div>
					
					<div style="font-size: 15px; margin-left: 100px; padding: 5px;">
							<div>카카오뱅크</div>
							<div>1234567890205</div>
					</div>			
				</div>
			</div>
			
			<div class="hr"></div>

			<div class="account-info">
				<div style="font-size: 18px; margin-bottom: 15px;">패널티 결제 정보</div>			
				<div style="display: flex;">
					<div style="font-size: 15px; padding: 5px; opacity: 0.6;">
						<div>은행</div>
						<div>카드번호</div>
					</div>
					
					<div style="font-size: 15px; margin-left: 100px; padding: 5px;">
							<div>카카오뱅크</div>
							<div>1234567890205</div>
					</div>			
				</div>
			</div>
			
			<div class="hr"></div>
			
			<div class="inputday" style="display: flex;">
				<div style="font-size: 18px; margin-bottom: 15px;">판매 접수일</div>
				<div style="font-size: 15px; margin-left: 83px;">2023/05/23</div>
			</div>

		
		</div>
		
		<div id="buttonProfile">
          <button type="button" id="profile-back" class="profilebtn" onclick="location.href='/user/sellHistory'">판매 목록</button>           
       </div>
		



	</div>
</body>
</html>