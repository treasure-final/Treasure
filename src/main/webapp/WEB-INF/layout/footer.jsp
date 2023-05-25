<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet"
>
<title></title>
<style type="text/css">
#footquestion {
	font-size: 13px;
	color: #747f55;
	background-color: #fff;
	padding: 12px 30px;
	border-radius: 25px;
	font-weight: 400;
	text-transform: capitalize;
	letter-spacing: 0.5px;
	transition: all 0.3s;
	position: relative;
	overflow: hidden;
	margin: auto;
	width: 200px;
	text-align: center;
	margin-bottom: 50px;
	border: 1px solid #747f55;
	margin-left: 30px;
}

h6 {
	color: gray;
}
</style>
<link rel="stylesheet" href="assets/css/animate.css">
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<hr>
	<div style="margin-bottom: 110px;">
		<div style="width: 115px; font-size: 13px; display: inline-block; margin-left: 10px; float: left;"
			class="first"
		>
			<ul>
				<li style="line-height: 50px;">
					<a href="#">
						<b>이용안내</b>
					</a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">검수기준</a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">이용정책</a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">커뮤니티</a>
				</li>
			</ul>
		</div>
		<div style="width: 140px; font-size: 13px; display: inline-block; margin-left: 150px;"
			class="second"
		>
			<ul>
				<li style="line-height: 50px;">
					<a href="#">
						<b>고객지원</b>
					</a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">공지사항</a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">서비스 소개</a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">판매자 방문접수</a>
				</li>
			</ul>
		</div>
		<div style="width: 260px;height:100px ;font-size: 13px; display: inline-block; float: right;" class="third">
			<ul>
				<li style="line-height: 50px;">
					<a href="#">
						<b>고객센터 1588-XXXX</b>
					</a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">운영시간 평일 11:00-18:00 </a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">(토,일,공휴일 휴무)</a>
				</li>
				<li style="line-height: 30px;">
					<a href="#">점심시간 평일 13:00 - 14:00</a>
				</li>
				<li style="line-height: 30px; margin-bottom: 20px;">
					<a href="#">1:1 문의하기는 앱에서만 가능합니다.</a>
				</li>
			</ul>
			<button type="button" id="footquestion" onclick="#
">자주묻는 질문</button>
		</div>
	</div>
		<hr>
		<div style="margin-left: 10px; font-size: 13px; margin-top: 30px;">
			<ul>
				<li style="margin-right: 40px;">
					<a href="#">
						<b>회사소개</b>
					</a>
				</li>
				<li style="margin-right: 40px;">
					<a href="#">인사채용</a>
				</li>
				<li style="margin-right: 40px;">
					<a href="#">제휴제안</a>
				</li>
				<li style="margin-right: 40px;">
					<a href="#">이용약관</a>
				</li>
				<li style="margin-right: 40px;">
					<a href="#">개인정보처리방침</a>
				</li>
			</ul>
			<div style="width: 210px; float: right;">
				<a href="#">
					<img src="../assets/images/footerlogo1.png"
						style="width: 30px; height: 30px; margin-left: 50px;"
					>
				</a>
				<a href="#">
					<img src="../assets/images/footerlogo3.png"
						style="width: 30px; height: 30px; margin-left: 12px;"
					>
				</a>
				<a href="#">
					<img src="../assets/images/footerlogo2.png"
						style="width: 30px; height: 30px; margin-left: 12px;"
					>
				</a>
			</div>
			<br>
			<h6 style="font-size: 10px;">트레져 주식회사 · 대표 XXX사업자등록번호 : 570-88-XXXXX 사업자정보확인통신판매업 : 사업장소재지 :
				서울특별시 강남구 테헤란로 132 8층 쌍용교육센터</h6>
			<br>
			<b style="font-size: 12px;">XX은행 채무지급보증 안내</b>
			<div style="font-size: 9px; color: gray;">
				당사는 고객님의 현금 결제 금액에 대해 신한은행과 채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다.
				<br>
				서비스가입 사실 확인 트레져(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다.
				<br>
				본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다.
				<Br>
				단 이용약관 및 정책, 기타 거래 체결 과정에서 고지하는 내용 등에 따라 검수하고 보증하는 내용에 대한 책임은 트레져(주)에 있습니다.
			</div>
		</div>
</body>
</html>