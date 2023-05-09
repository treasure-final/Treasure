<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<title>Treasure</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script type="application/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<style>
@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

*{
	font-family: "GmarketSansMedium";
}

.agree-wrapper {
	width: 800px;
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

input[type="checkbox"]+label {
	width: 25px;
	height: 25px;
	border: 2px solid #747f55;
	position: relative;
	margin-right: 5px;
	float: right;
}

input[id="check1"]:checked+label::after, input[id="check2"]:checked+label::after,
input[id="check3"]:checked+label::after, input[id="check4"]:checked+label::after,
input[id="check5"]:checked+label::after,input[id="check6"]:checked+label::after {
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
}


#agree-back {
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
	width: 45%;
	text-align: center;
	margin-bottom: 50px;
	margin-top: 30px;
	border: 1px solid #747f55;
}

#agree-next {
	font-size: 13px;
	color: #fff;
	background-color: #747f55;
	padding: 12px 30px;
	border-radius: 25px;
	font-weight: 400;
	text-transform: capitalize;
	letter-spacing: 0.5px;
	transition: all 0.3s;
	position: relative;
	overflow: hidden;
	margin: auto;
	width: 45%;
	text-align: center;
	margin-bottom: 50px;
	margin-top: 30px;
	border: 1px solid #747f55;
}

#agree-next:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
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

.item-info>li {
	list-style: none;
	font-size: 14px;
}

.agree-ment {
	margin-top: 30px;
	font-size: 20px;
}

.agree-check {
	width: 100%;
	height: 350px;
	margin: auto;
	margin-top: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	border: 1px solid #D2D2D2;
	justify-content: center;
	align-items: flex-start;
	border-radius: 10px;
}

.agree-check>div {
	display: flex;
	align-items: center;
	padding: 10px;
}

.agree-check>div>span {
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

<script>
	function checkAgreement() {
	    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    for (var i = 0; i < checkboxes.length; i++) {
	        if (!checkboxes[i].checked) {
	            alert("모든 약관에 동의해야 합니다.");
	            return;
	        }
	    }
	    location.href='/sell/sellType';
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
    <div><i id="logo">판매동의</i></div>
     <div class="hr"></div>
    	<div class="item">
    		<img alt="" src="../../img/화면%20캡처%202023-05-04%20140755.png" class="item-photo">   		   		
    		<ul class="item-info">
    			<li>DR0148-102</li>
    			<li>(W) Nike Air Force 1 '07 LX Summit White Gorge Green</li>
    			<li>(W) 나이키 에어포스 1 '07 LX 서밋 화이트 골지 그린</li>
    			<li>240</li>
    		</ul>   		
    	</div>
    	
    	<div class="agree-ment"><b style="font-size: 1.1em; color: #747f55;">판매</b> 전 꼭 확인 해주세요</div>
    		
    	<div class="agree-check" id="agree-check">
    		<div>
    		<span>판매하려는 상품과 일치 합니다</span><input type="checkbox" required="required" id="check1" class="chk" onchange="checkAllAgreements()"><label for="check1"></label>
    		</div>
    		
    		<div>
    		<span>국내/해외에서 발매한 정품 및 새상품 입니다</span><input type="checkbox" required="required" id="check2" class="chk" onchange="checkAllAgreements()"><label for="check2"></label>
    		</div>
    		
    		<div>
    		<span>패키지 상태를 확인하였으며 문제가 없습니다</span><input type="checkbox" required="required" id="check3" class="chk" onchange="checkAllAgreements()"><label for="check3"></label>
    		</div>
    		
    		<div>
    		<span>이중 포장하여 발송 합니다</span><input type="checkbox" required="required" id="check4" class="chk" onchange="checkAllAgreements()"><label for="check4"></label>
    		</div>
    		
    		<div>
    		<span>TREASURE의 이용정책을 확인 하였습니다</span><input type="checkbox" required="required" id="check5" class="chk" onchange="checkAllAgreements()"><label for="check5"></label>
    		</div>
    		
    		<div>
    		<span>위 사항을 모두 숙지 하였으며 전체 동의 합니다</span><input type="checkbox" id="check6" required="required"><label for="check6"></label>
    		</div>
    	</div>
    	 
    	<div style="display: flex;">
    	<button type="button" id="agree-back">뒤로가기</button> 
        <button type="button" id="agree-next" onclick="checkAgreement()">판매 계속하기</button>
        </div>
</div>

<script type="text/javascript">

$("#check6").click(function(){
	
	var allchk=$(this).is(":checked");
	
	$(".chk").prop("checked", allchk);
	
})
</script>
</body>
</html>