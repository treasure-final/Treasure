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
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

*{
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
	height: 1200px;
	padding: 40px;
	box-sizing: border-box;
	margin: 50px auto;
	line-height: 30px;
	background-color: #ffffff;
}

.right-td {
	font-size: 14px;
	padding-left: 20px;
}

.left-td {
	font-size: 14px;
	opacity: 0.7;
}

#required-btn {
	width: 93%;
	border-radius: 15px;
	background-color: #ffffff;
	text-align: left;
	padding: 5px 15px;
	margin: 10px 0;
	border: 1px solid #e3e3e3;
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

select {
	width: 120px;
	height: 53px;
	border-radius: 15px;
	background-color: #ffffff;
	padding: 5px 15px;
	margin: 10px 0;
	border: 1px solid #e3e3e3;
}

.bank-number {
	width: 480px;
	border-radius: 15px;
	background-color: #ffffff;
	text-align: left;
	padding: 5px 15px;
	margin: 10px 0;
	border: 1px solid #e3e3e3;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

.agree-ment {
   margin-top: 30px;
   font-size: 20px; 
}

.agree-check {
   width: 93%;
   height: 250px;
   margin-top: 10px;
   display: flex;
   flex-direction: column;
   border: 1px solid #e3e3e3;
   justify-content: center;
   border-radius: 10px;
}

.agree-check>div {
   display: flex;
   align-items: center;
   padding: 10px 10px;
}

.agree-check>div>span {
   display: flex;
   align-items: center;
   font-size: 15px;
   padding: 3px;
   width: 550px;
   margin-left: 10px;
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

#sell-back {
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

#sell-next {
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

#sell-next:hover {
   background-color: #fff;
   color: #747f55;
   border: 1px solid #747f55;
}
</style>

</head>
<body>
<div class="container">
    <div><i id="logo">판매/정산</i></div>
    <div class="hr"></div>
    <!-- 주소 -->
    <div id="info" style="width: 100%; height: 30%; margin-bottom: 10px; margin-left: 40px;">
        <img src="../../img/화면%20캡처%202023-05-04%20140755.png"
             style="width: 110px; float: left; margin-right: 20px; border-radius: 10px;">
        <div id="left-info"
             style="width: 70%; float: left; height: 40%; margin-right: 20px; margin-bottom: 10px; line-height: 20px; margin-top: 15px">
            <div id="content" style="font-size: 14px;">
                <b style="font-size: 14px">DR0148-102</b><br>
                (W) Nike Air Force 1 '07 LX Summit White Gorge Green
                <div style="opacity: 0.6; font-size: 14px;">(W) 나이키 에어포스 1 '07 LX 서밋 화이트 골지 그린</div>
                ${size }
            </div>
        </div>
        <div id="right-info"
             style="width: 90%; float: left; height: 40%;">
            <span style="font-size: 18px;">반송 주소</span><span style="margin-left: 480px; cursor: pointer; opacity: 0.7; font-size: 14px;">+ 새 주소 추가</span>
            <table>
                <tr>
                    <td class="left-td">받는분</td>
                    <td class="right-td">김영돈</td>
                </tr>
                <tr>
                    <td class="left-td">연락처</td>
                    <td class="right-td">010-2152-9843</td>
                </tr>
                <tr>
                    <td class="left-td">배송 주소</td>
                    <td class="right-td">경기 성남시 분당구 경부고속도로 409 (삼평동) 111</td>
                </tr>
            </table>
            <input type="text" id="required-btn" placeholder="배송 시 요청사항을 입력해주세요">
        </div>
    </div>
    
    <!-- 정산 계좌  -->
    <div style="margin-left: 40px;">
        <div style="border-top: 1px solid #e3e3e3; width: 95%; height: 10%; margin-top: 60px; margin-bottom: 15px;"></div>
        <div style="padding-top: 20px;  font-size: 14px; opacity: 0.4;"></div>
        
        <div style="font-size: 18px;">정산 계좌 정보</div>
        <div>
       		<select name="">
	       		<option value="국민">국민</option>
	       		<option value="농협">농협</option>
	       		<option value="신한">신한</option>
	       		<option value="새마을금고">새마을금고</option>
	       		<option value="카카오뱅크">카카오뱅크</option>
	       		<option value="토스">토스</option>
       		</select>
            <input type="number" class="bank-number" placeholder="- 제외 계좌번호를 입력해주세요" required="required"> 
        </div>   
	
	<!-- 패널티 카드정보  -->       
        <div style="font-size: 18px; margin-top: 30px; ">패널티 결제 정보</div>
        <div>
       		<select name="">
	       		<option value="BC">BC</option>
	       		<option value="현대">현대</option>
	       		<option value="카카오뱅크">카카오뱅크</option>
	       		<option value="농협">농협</option>
	       		<option value="신한">신한</option>
	       		<option value="토스">토스</option>
       		</select>
            <input type="number" class="bank-number" placeholder="신용카드 번호를 입력해주세요" required="required">
        </div>   
    </div>
    	
    	<!-- 동의 -->
    	<div style="margin-left: 40px; margin-bottom: 30px;">
	    	<div style="border-top: 1px solid #e3e3e3; width: 95%; height: 10%; margin-top: 30px; margin-bottom: 15px;"></div>
	        <div style="padding-top: 20px;  font-size: 14px; opacity: 0.4;"></div>
        
    		<div  style="font-size: 18px; margin-bottom: 15px;">이용방침과 최종 정산 금액을 꼭 확인 해주세요</div>
   
	        <div class="agree-check" id="agree-check">
		          <div>
		          <span>접수 후 48시간 이내에 발송하여 송장번호를 기재하겠습니다</span><input type="checkbox" required="required" id="check1" class="chk"><label for="check1"></label>
		          </div>
		          
		          <div>
		          <span>허위정보 작성 및 발송기한 초과시 패널티요금이 결제 됩니다</span><input type="checkbox" required="required" id="check2" class="chk"><label for="check2"></label>
		          </div>
		          
		          <div>
		          <span>접수 내역을 꼼꼼하게 확인했습니다</span><input type="checkbox" required="required" id="check3" class="chk"><label for="check3"></label>
		          </div>
		          
		          <div>
		          <span>위 사항을 모두 확인 하였으며 판매 접수에 최종 동의 합니다</span><input type="checkbox" id="check4" required="required"><label for="check4"></label>
		          </div>
	       </div>
       </div>

    <!-- 최종 정산 정보  -->
    <div style="border-top: 1px solid #e3e3e3; width: 93%; height: 10%; margin:auto; margin-top: 30px; margin-left: 40px; padding-top: 50px">
        <div style="display: flex; margin: auto; ">
	        <div style="font-size: 18px;">최종 정산 금액</div>
	        <div style="color: red; margin-left: 460px; font-size: 18px"><b>173,500원</b></div>
        </div>
        
        <div style="display: flex; margin-top: 15px;">
	       <button type="button" id="sell-back">뒤로가기</button> 
	       <button type="button" id="sell-next" onclick="#">판매 접수</button>
    	</div>    
    </div>
    
    
        
</div>

<script type="text/javascript">

$("#check4").click(function(){
   
   var allchk=$(this).is(":checked");
   
   $(".chk").prop("checked", allchk);
   
});

$(".chk").click(function() {
	if($('input:checkbox[class=chk]:checked').length===3) {
		$("input[type='checkbox']").prop("checked", true);
		$('.chk').prop("checked",true);
		} else {
		$("#check4").prop("checked", false);
	}
});

//일단은 걍 뒤로가기
$("#sell-back").click(function(){
	history.back();
});
</script>
</body>
</html>