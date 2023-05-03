<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<title>Treasure</title>

<style type="text/css">
@font-face {
  font-family: "GmarketSansMedium";

  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}

*{
	padding: 0;
	margin: 0;
	border: none;
}

body {
	font-size: 14px;
	font-family: 'GmarketSansMedium';
}

.join-wrapper{
	width: 500px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
	justify-content: center;
	margin: auto;
}

.join-wrapper>h2{
	font-size: 24px;
	color: black;
	margin-bottom: 20px;
	text-align: center;
	font-weight: bold;
	margin-top: 30%;
}

.join-wrapper>h3{
	font-size: 20px;
	color: black;
	margin-bottom: 20px;
	text-align: center;
}

#join-form>input{
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}


#join-form > input::placeholder{
	color: #D2D2D2;
}

#join-form > input[type="submit"]{
	color: #fff;
	font-size: 16px;
	background-color: #999999;
	margin-top: 20px;
}

.agree > input[type="checkbox"]{
	transform: scale(1.3);
	margin-left: 10px;
}

.agree{
	display: inline-block;
	margin-bottom: 5px;
}

#join-button{
	font-size: 14px;
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
	margin: 0 auto;
	width: 100%;
	text-align: center;
}

#join-button:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.addrsearch{
	font-size: 14px;
	color: #fff;
	background-color: #747f55;
	border-radius: 25px;
	font-weight: 300;
	transition: all 0.3s;
	position: relative;
	overflow: hidden;
	margin: 0 auto;
	width: 100px;;
	height: 40px;
	text-align: center;
}

.addrsearch:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

.kakaoaddr>input{
	width: 100%;
	height: 48px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

</style>



</head>
<body>
	<div class="join-wrapper">
	<h2>TREASURE</h2>
	<h3>회원가입</h3>
	<form action="joinInsert" method="post" id="join-form">
		이메일 주소
		<input type="email" name="user_email" id="user_email" placeholder="로그인시 사용 할 이메일을 입력해주세요" required="required" autofocus="autofocus" onkeyup="keyevent()">
		<span class="emailok" style="width: 60px; color: #747f55;"></span><br><br>
		
		비밀번호
        <input type="password" name="user_pass" id="user_pass" placeholder="비밀번호를 입력해주세요" required="required">
        
        비밀번호 확인
        <input type="password" id="user_pass2" placeholder="비밀번호를 입력해주세요" required="required">
        <span class="passsuccess" style="width: 60px; color: #747f55;"></span><br><br>
        
        닉네임
        <input type="text" name="user_nickname"  id="user_nickname" placeholder="닉네임을 입력해주세요" required="required">
        <span class="nicknameok" style="width: 60px; color: #747f55;"></span><br><br>
        
        이름
        <input type="text" name="user_name" placeholder="이름을 입력해주세요" required="required">
        
        연락처
        <input type="number" name="user_hp" placeholder="-을 제외한 연락처를 입력해주세요" required="required">
        
        생년월일
        <input type="date" name="user_birth" required="required">
        
        <div class="formbold-mb-3 kakaoaddr">
	    <label class="formbold-form-label"> 주소 </label>
	        <div style="align-content: flex-end;">
		    <input type="text" id="sample6_postcode" placeholder="우편번호" class="formbold-form-input" style="width: 300px;" required>
		    <input type="button" class="formbold-btn btn-s addrsearch" onclick="sample6_execDaumPostcode()" value="주소검색"><br>
	        </div>
		<input type="text" id="sample6_address" name="addr1" placeholder="주소" class="formbold-form-input" disabled >
		<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" class="formbold-form-input">
		<input type="text" id="sample6_extraAddress" name="addr3" placeholder="참고항목" class="formbold-form-input" disabled >
      	</div><br>
        
        <div class="agree">
        <label for="agree1">개인정보 활용 동의 (필수)</label><input type="checkbox" required="required" id="agree1">
        </div><br>
        <div class="agree" style="margin-bottom: 30px;">
        <label for="agree2">광고성 정보 수신 동의 (선택)</label><input type="checkbox" id="agree2">
        </div>
        <br>
        <button type="submit" id="join-button">가입하기</button>
	</form>

	</div>
	
<script type="text/javascript">
	$(document).ready(function() {
		  // 폼 제출 이벤트 핸들러 함수
		  $("#join-form").submit(function(event) {
		    // 이메일 중복 체크 결과가 0이 아니면 폼 제출 방지
		    if ($("span.emailok").data("count") !== 0) {
		      event.preventDefault();
		      alert("이메일을 다시 입력해주세요");
		    }else if ($("span.passsuccess").text() !== "비밀번호가 일치 합니다") {
		        event.preventDefault();
		        alert("비밀번호 일치 확인을 해주세요");
		      }else if($("span.nicknameok").data("nickcount")!==0){
		    	  event.preventDefault();
			      alert("닉네임을 다시 입력해주세요");	  
		      }else{
		    	  alert("회원 가입이 완료 되었습니다");
		      }
	  });
	  
	  // 이메일 중복 체크 함수
	  function emailCheck() {
		    var user_email = $("#user_email").val();
		    $.ajax({
		      type: "get",
		      dataType: "json",
		      url: "emailCheck",
		      data: {"user_email": user_email},
		      success: function(res) {
		        var message = res.count == 0 ? "사용 가능한 이메일 입니다." : "사용 불가능한 이메일 입니다.";
		        $("span.emailok").text(message).data("count", res.count);
		        if(user_email==""){
		        	$("span.emailok").text("이메일 중복 확인을 해주세요")
		        }
		      }
		    });
	  };
	  
	  //닉네임 중복 체크 함수
	  function nickNameCheck() {
		  var user_nickname = $("#user_nickname").val();
		  $.ajax({
			  type:"get",
			  dataType:"json",
			  url:"nickNameCheck",
			  data:{"user_nickname":user_nickname},
			  success:function(res){
				  var nickmessage=res.nickcount==0?"사용 가능한 닉네임 입니다.":"사용 불가능한 닉네임 입니다.";
				  $("span.nicknameok").text(nickmessage).data("nickcount",res.nickcount);
				  if(user_nickname==""){
					  $("span.nicknameok").text("닉네임 중복 확인을 해주세요")
				  }
			  }
			  
		  });
		
	};
	  
	  // 이메일 중복 체크 이벤트 핸들러 함수 등록
	  $("#user_email").on("keydown blur", emailCheck);
	    
	  // 이메일 입력란 클릭 시 이메일 중복 체크 결과 초기화
	  $("#user_email").click(function() {
	    $("span.emailok").text("").data("count", 0);
	  });
	  
	  // 닉네임 중복 체크 이벤트 핸들러 함수 등록
	  $("#user_nickname").on("keydown blur",nickNameCheck);
	  
	  // 닉네임 입력란 클릭 시 닉네임 중복 체크 결과 조회
	  $("#user_nickname").click(function(){
		  $("span.nicknameok").text("").data("nickcount",0);
	  });
	  
	});
	
	//비밀번호 일치확인
	$("#user_pass2").blur(function(){
	    var pass1 = $("#user_pass").val();
	    var pass2 = $("#user_pass2").val();
	    if (pass1 == pass2) {
	        $("span.passsuccess").text("비밀번호가 일치 합니다");
	    } else{
	        $("span.passsuccess").text("비밀번호가 불일치 합니다");
	    }
	    
	    if(pass1==""||pass2==""){
	    	 $("span.passsuccess").text("비밀번호 일치 확인을 해주세요");
	    }
	});
</script>



<!-- 주소api -->
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