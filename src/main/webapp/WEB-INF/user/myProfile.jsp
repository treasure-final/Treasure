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
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
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
	width: 100%;
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
	font-size: 23px;
	font-weight: bold;
	margin-bottom: 20px;
}

.hr {
	border: none;
	height: 2px;
	background: black;
	margin-bottom: 50px;
	overflow: hidden;
}

.hr2 {
	border: none;
	height: 1px;
	background: #D2D2D2;
	margin: 50px 0 50px 0;
	overflow: hidden;
}

#basicProfile {
	display: flex;
	align-items: center;
	gap: 30px;
}

.image-wrapper {
  width: 140px;
  height: 140px;
  overflow: hidden;
  border-radius: 50%;
}

#profile-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

#basicProfile span {
	font-size: 22px;
}

.photo-btn {
	display: none;
}

input[type="file"]+label {
	font-family: "GmarketSansMedium";
	border: 1px solid #e3e3e3;
	background-color: #fff;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	margin-top: 20px;
	font-size: 12px;
	color: black;
	cursor: pointer;
	display: block;
	text-align: center;
	line-height: 41px;
	align-items: center;
	justify-content: center;
}

input[type="file"]+label:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

.addr-btn{
	font-family: "GmarketSansMedium";
	border: 1px solid #e3e3e3;
	background-color: #fff;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	margin-top: 15px;
	margin-left: 10px;
	font-size: 12px;
	color: black;
	cursor: pointer;
	display: block;
	text-align: center;
	line-height: 35px;
	align-items: center;
	justify-content: center;
	padding-left: 14px;
	padding-top: 3px;
}

.addr-btn:hover{
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

#detailProfile>div {
	display: flex;
	flex-direction: column;
	gap: 5px;
	margin-bottom: 40px;
}

#detailProfile>div>span {
	font-size: 16px;
	font-weight: bold;
}

.profile-input {
	width: 480px;
	border-radius: 15px;
	background-color: #ffffff;
	text-align: left;
	padding: 5px 15px;
	margin: 10px 0;
	border: 1px solid #e3e3e3;
	font-size: 13px;
	height: 40px;
}

.profile-input:focus {
	border-color: #747f55;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

#buttonProfile {
	display: flex;
	align-items: center;
	gap: 15px;
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
	cursor: pointer;

}

.profilebtn:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}
</style>

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
                <div class="subsub-menu" onclick="location.href='/user/buyHistory'">구매 내역</div>
                <div class="subsub-menu" onclick="location.href='/user/sellHistory'">판매 내역</div>
                <div class="subsub-menu notready">보관 판매</div>
                <div class="subsub-menu notready">관심 상품</div>
            </div>
        </div>
        <div id="side-bottom">
            <div class="sub-title">내 정보</div>
            <div class="sub-menu">
                <div class="subsub-menu" onclick="location.href='/user/myProfile'" style="color: #747f55;"><b>프로필 정보</b></div>
                <div class="subsub-menu notready">주소록</div>
                <div class="subsub-menu notready">결제 정보</div>
                <div class="subsub-menu notready">판매 정산 계좌</div>
                <div class="subsub-menu notready">현금영수증 정보</div>
                <div class="subsub-menu notready">포인트</div>
            </div>
        </div>
    </div>
    
<form action="updateProfile" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_num" value="${user_num }">
    <div class="container">
    <h2 id="logo"><i>프로필 정보</i></h2>
    <div class="hr"></div>
    
       <div id="basicProfile">
       		<div class="image-wrapper">	              
               <c:if test="${dto.user_photo==null }"><img src="../../img/profile.png" id="profile-img"></c:if>
               <c:if test="${dto.user_photo!=null }"><img src="../../save/${dto.user_photo }" id="profile-img"></c:if>                   
            </div>  
               <div style="display: flex; flex-direction: column; gap: 5px;">
                  <span>${dto.user_name }</span>
                  <span style="font-size: 18px; opacity: 0.5;">${dto.user_email }</span>
                  <input type="file" class="photo-btn" id="photo-btn" name="upload" onchange="readURL(this);"><label for="photo-btn" >사진 수정</label>
               </div>                         
       </div>
       
    <div class="hr2"></div>
    
       <div id="detailProfile">      
          <div>
             <span>닉네임</span>
             <input type="text" class="profile-input" value="${dto.user_nickname }" name="user_nickname">   
          </div>
          
          <div>
             <span>생년월일</span>
             <input type="date" class="profile-input" value="${dto.user_birth }" name="user_birth">   
          </div>
          
         <div style="align-content: flex-end; display: flex;">
             <span>주소</span>
             <input type="text" class="profile-input" value="${dto.user_addr }" name="user_addr">
          </div>
          
          <div class="formbold-mb-3">
          <span>주소</span>
	        <div style="align-content: flex-end; display: flex;">
		    <input type="text" id="sample6_postcode" placeholder="우편번호" class="formbold-form-input profile-input" style="width: 250px;" required>
		    <input type="button" class="formbold-btn btn-s addr-btn" onclick="sample6_execDaumPostcode()" value="주소검색">
	        </div>
		<input type="text" id="sample6_address" name="addr1" value="${dto.user_addr }" class="formbold-form-input profile-input">
		<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" class="formbold-form-inpu profile-input">
		<input type="text" id="sample6_extraAddress" name="addr3" placeholder="참고항목" class="formbold-form-input profile-input" style="display: none;">
      	</div>

          <div>
             <span>연락처</span>
             <input type="number" class="profile-input" value="${dto.user_hp }" name="user_hp">   
          </div>
          
                                                        
       </div>
       
       <div id="buttonProfile">
          <button type="button" id="profile-back" class="profilebtn">뒤로가기</button>
          <button type="submit" id="profile-update" class="profilebtn">수정하기</button>           
       </div>
    </div>
</form>
    
<div style="clear: left"></div>
</div>

<script type="text/javascript">

$(function() {
    $("#photo-btn").click(function() {
       $("#photo-view").trigger("click");
    })
 })

 function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function(e) {
          
          $("#profile-img").attr("src", e.target.result);
          
       }
       reader.readAsDataURL(input.files[0]);
    }
 };
 
 $("#profile-back").click(function(){
		history.back();
	});

</script>

<script type="text/javascript">
 function sample6_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
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
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
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
