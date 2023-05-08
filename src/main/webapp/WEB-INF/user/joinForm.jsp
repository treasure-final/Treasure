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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<title>Treasure</title>

<style type="text/css">
@font-face {
	font-family: "GmarketSansMedium";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-weight: normal;
}

div.main {
	font-family: "GmarketSansMedium";
	font-size: 13px;
	padding: 0;
	margin: 0;
	border: none;
	color: black;
}

.join-wrapper {
	width: 480px;
	height: 800px;
	padding: 40px;
	box-sizing: border-box;
	justify-content: center;
	margin: auto;
	margin-top: 20px;
}

.join-wrapper>h2 {
	font-size: 25px;
	margin-bottom: 20px;
	text-align: center;
	margin-top: 30px;
	margin-bottom: 50px;
}


#join-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#join-form>input::placeholder {
	color: #D2D2D2;
}

#join-form>input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #999999;
	margin-top: 20px;
}

.agree>input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #747f55;
	position: relative;
	margin-right: 5px;
}

input[id="agree1"]:checked+label::after, input[id="agree2"]:checked+label::after
	{
	content: '✔';
	color: #747f55;
	font-size: 15px;
	width: 20px;
	height: 20px;
	text-align: center;
	position: absolute;
	left: 0;
	top: 0;
}

.agree {
	margin-bottom: 3px;
	display: flex;
	align-items: center;
}

#join-button {
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
	width: 100%;
	text-align: center;
	margin-bottom: 50px;
	border: 1px solid #747f55;
}

#join-button:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}


.addrnumber {
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

.addrsearch {
	font-size: 11px;
	color: #fff;
	background-color: #747f55;
	border-radius: 25px;
	font-weight: 300;
	transition: all 0.3s;
	position: absolute;
	overflow: hidden;
	margin: auto;
	width: 80px;
	height: 35px;
	text-align: center;
	margin-bottom: 10px;
}

.addrsearch:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

.kakaoaddr>input {
	width: 100%;
	height: 48px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
	padding: 0 10px;
}

.kakaoaddr>input::placeholder {
	color: #D2D2D2;
}

.agreemore {
	font-size: 12px;
	background-color: #fff;
	color: gray;
}

.agreebutton {
	font-size: 15px;
	background-color: #fff;
	border: 1px solid #fff;
}

.agreecontent {
	font-size: 12px;
}
</style>

</head>
<body>
	<div class="join-wrapper">
	<h2><i>회원가입</i></h2>
	
	<form action="joinInsert" method="post" id="join-form">
		이메일 주소
		<input type="email" name="user_email" id="user_email" placeholder="로그인시 사용 할 이메일 입력해주세요" required="required" autofocus="autofocus" onkeyup="keyevent()">
		<span class="emailok" style="width: 60px; color: #747f55;"></span><br><br>
		
		비밀번호
        <input type="password" name="user_pass" id="user_pass" placeholder="특수문자와 대문자를 포함한 8자리 이상 16자리 이하" required="required">
        
        비밀번호 확인
        <input type="password" id="user_pass2" placeholder="다시 한 번 입력해주세요" required="required">
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
		    <input type="text" id="sample6_postcode" placeholder="우편번호" class="formbold-form-input addrnumber" style="width: 330px;" required>
		    <input type="button" class="formbold-btn btn-s addrsearch" onclick="sample6_execDaumPostcode()" value="주소검색"><br>
	        </div>
		<input type="text" id="sample6_address" name="addr1" placeholder="주소" class="formbold-form-input" readonly="readonly" >
		<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" class="formbold-form-input">
		<input type="text" id="sample6_extraAddress" name="addr3" placeholder="참고항목" class="formbold-form-input"  readonly="readonly" >
      	</div><br>
        
        <div class="agree">
       <input type="checkbox" required="required" id="agree1"><label for="agree1"></label><div class="agree-info">개인정보 활용 동의 (필수)</div>&nbsp;<input type="button" class="agreemore" data-toggle="modal" data-target="#agreeModal" value="더보기">
        </div><br>
        <div class="agree">
        <input type="checkbox" id="agree2"><label for="agree2"></label><div class="agree-adv">광고성 정보 수신 동의 (선택)</div>
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
		      }else if(!validatePassword()){
		    	  event.preventDefault();
		    	    alert("비밀번호는 8자리 이상 16자리 이하이며, 영어 대소문자와 숫자, 특수문자가 모두 포함되어야 합니다.");
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
	
	function validatePassword() {
		  var password = document.getElementById("user_pass").value;
		  var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,16}$/;
		  return passwordPattern.test(password);
	}
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

<!--개인정보 이용약관 모달  -->
<div class="modal fade" id="agreeModal" role="dialog">
		 <div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="margin:auto; width: 600px; height: 650px;">

				<div class="modal-header">
					<h4 class="modal-title">개인정보 활용 동의</h4>
				</div>

				<div class="modal-body" style="padding: 20px;">
					<div class="agreecontent" style="overflow: auto; width: 550px; margin:auto; height: 500px; border: none; outline: none; resize: none; text-align: left;">
					<b>Treasure(주)(이하 회사)는 서비스 제공을 위하여 개인정보를 수집 ・ 이용 및 제공합니다.<br><br>
					회원가입 시점에 이용자로부터 수집하는 개인정보는 아래와 같습니다.</b><br><br>
					1) 회원 가입 시에 이름, 휴대전화번호, 주소, 생년월일, 이메일(로그인ID), 비밀번호를 필수 항목으로 수집하며, 선택항목으로 닉네임, 프로필 사진, 카드 정보, 거래은행 및 계좌번호를 수집합니다.<br><br>
					2) 네이버 및 카카오 아이디로 로그인 시에는 이용자 고유 식별자를 필수 항목으로 수집하고, 이메일 주소, 이름(별명), 프로필 사진을 선택 항목으로 수집합니다.<br><br>
					<b>회사는 원칙적으로 이용자 동의 없이 개인정보를 외부에 제공하지 않습니다.<br><br>
					회사는 수집한 개인정보를 다음과 같은 목적으로만 이용합니다.</b><br><br>
					1) 회원가입 의사의 확인, 이용자 본인확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위해 개인정보를 이용합니다.<br><br>
					2) 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.<br><br>					
					3) 법령 및 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정 도용 및 부정거래방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.<br><br>					
					4) 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.<br><br>					
					5) 이벤트 진행 및 경품 배송, 제세공과금 처리를 위해개인정보를 이용합니다.<br><br>					
					6) 거래처 등록 및 대금 지급을 위해 개인정보를 이용합니다.<br><br>					
					7) 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.<br><br>					
					8) 서비스 이용 기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공과 광고 게재 등에 개인정보를 이용합니다.<br><br>					
					9) 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.<br><br>
					다만, 이용자들이 개인정보 제공에 사전에 동의한 경우, 관련 법령에 의해 개인정보 제출 의무가 발생한 경우에는 개인정보가 제공될 수 있습니다.			
					"Treasure"는 회원님에게 서비스를 제공하는 데에 반드시 필요한 업무 중 일부를 외부 업체에 위탁하고 있습니다.					
					외부 업체에 업무 위탁 시 계약서 등을 통해서 개인정보보호 관련 법규의 준수, 개인정보에 관한 비밀유지, 제3자 제공에 대한 금지, 사고 시의 책임 부담, 위탁 기간, 처리 종료 후의 개인정보의 파기 등을 규정하고, 이를 준수하도록 관리 감독하고 있습니다.<br><br>
					이용자 및 법정대리인은 언제든지 자신의 개인정보를 조회하거나 수정할 수 있으며, 언제든지 계정 삭제를 요청할 수 있습니다.
					이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.
					또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.
					회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보를 아래 "개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="agreebutton" data-dismiss="modal">확인</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>