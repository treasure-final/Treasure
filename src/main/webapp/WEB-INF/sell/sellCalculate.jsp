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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"
    />
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
	width: 820px;
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
   cursor: pointer;
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
   cursor: pointer;
}

#sell-back {
   font-size: 15px;
   color: #747f55;
   background-color: #fff;
   padding: 16px 30px;
   border-radius: 25px;
   font-weight: 400;
   text-transform: capitalize;
   letter-spacing: 0.5px;
   transition: all 0.3s;
   position: relative;
   overflow: hidden;
   margin: auto;
   width: 47%;
   text-align: center;
   margin-bottom: 50px;
   margin-top: 30px;
   border: 1px solid #747f55;
   cursor: pointer;
}

#sell-next {
   font-size: 15px;
   color: #fff;
   background-color: #747f55;
   padding: 16px 30px;
   border-radius: 25px;
   font-weight: 400;
   text-transform: capitalize;
   letter-spacing: 0.5px;
   transition: all 0.3s;
   position: relative;
   overflow: hidden;
   margin: auto;
   width: 47%;
   text-align: center;
   margin-bottom: 50px;
   margin-top: 30px;
   border: 1px solid #747f55;
   cursor: pointer;
}

#sell-next:hover {
   background-color: #fff;
   color: #747f55;
   border: 1px solid #747f55;
}

#addr-btn {
            margin-left: 470px;
            cursor: pointer;
            opacity: 0.7;
            font-size: 14px;
        }

        #addr-modal {
            margin-top: 140px;
            height: 590px;
            border-radius: 25px;
        }

        #addrForm > div {
            line-height: 25px;
        }

        .modal-input {
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 14px;
        }

        .modal-input > input:not(.btn-modal) {
            width: 95%;
            background-color: #ffffff;
            border: none;
            border-radius: 0px;
            border-bottom: 1px solid #e3e3e3;
            padding-left: 0px;
            color: black;
            font-size: 13px;
        }

        .modal-input > input:focus {
            outline: none;
        }

        .btn-modal {
            border-radius: 10px;
            padding: 0px 40px;
            background-color: #ffffff;
            border: 2px solid #dfebda;
            cursor: pointer;
        }

        .btn-modal:hover {
            background-color: #dfebda;
        }

        .addr-search:hover {
            background-color: #ffffff;
            font-weight: bold;
            color: black;
        }
        
        .item {
            margin-left:-20px;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .item-photo {
            width: 150px;
            height: 150px;
            border-radius: 20px;
        }

        .item-info {
            display: flex;
            flex-direction: column;
            margin-left: -10px;                        
        }

        .item-info > li {
            list-style: none;
            font-size: 14px;
            margin-bottom: -3px;
                     
        }
</style>

<script type="text/javascript">
$(function(){
   
   $("#addr-modal").hide();
   
   $("#sell-next").click(function(){
      var type = '${type}';
      
      item_num = '${item_num}';
      name = $("#name").text();
      phone = $("#phone").text();
      addr = $("#addr").text();
      account1 = $("#account1").val();
      account2 = $("#account2").val();
      penaltypay1 = $("#penaltypay1").val();
      penaltypay2 = $("#penaltypay2").val();
      totalPrice = '${totalPrice}';
      size = '${size}';
      buy_num = '${buy_num}';
      sell_num='${sell_num}';
      sellnow_num='${sellnow_num}';
      user_num='${user_num}';

      // 판매 입찰
      if(type == "bid") {
         
         $.ajax({
            type:"post",
            url:"/sell/insertSellBid",
            data:{
               "item_num": item_num, // item_num 값을 포함시킴
                "size": size,
                "totalPrice": totalPrice,
                "hopePrice": "${hopePrice}",
                "deadline": "${deadline}",
                "name": name,
                "phone": phone,
                "addr": addr,
                "account1": account1,
                "account2": account2,
                "penaltypay1": penaltypay1,
                "penaltypay2": penaltypay2   
            },
            success:function(res){
               
               alert(res.loginEmail+"님 판매 접수가 완료 되었습니다");
               location.href="/user/sellSuccess?sell_num="+res.sell_num;
            }
         });
      } 
      // 즉시 판매
      else {
         
         $.ajax({
            type:"post",
            url:"/sell/insertSellNow",
            data:{
               "item_num": item_num, 
               "buy_num" : buy_num,
                "totalPrice": totalPrice,
                "name": name,
                "phone": phone,
                "addr": addr,
                "account1": account1,
                "account2": account2,
                "penaltypay1": penaltypay1,
                "penaltypay2": penaltypay2   
            },
            success:function(res){
               alert(res.loginEmail+"님 판매 접수가 완료 되었습니다");
               location.href="/user/sellNowSuccess?sellnow_num="+res.sellnow_num;
            }, 
            error: function (request, status, error) {
                    console.log("code: " + request.status)
                    console.log("message: " + request.responseText)
                    console.log("error: " + error);
                }
         });
         
      }
      
   });
   
    $(".modal-input > input:not(.btn-modal)").click(function () {
         $(".modal-input > input").css("border-bottom", "1px solid #e3e3e3");
         $(this).css("border-bottom", "2px solid #747f55");
         $(".none-input").css("border-bottom", "1px solid #e3e3e3");
     });

     $("#modal-submit").click(function () {
         let mname = $("#modal-name").val();
         let mphone = $("#modal-phone").val();
         let maddr = $("#sample6_address").val() + " " + $("#sample6_detailAddress").val();

         $("#name").text(mname);
         $("#phone").text(mphone);
         $("#addr").text(maddr);
     });
   
});
</script>

</head>
<body>
<div class="container">
<input type="hidden" id="userNum">
    <div><i id="logo">판매/정산</i></div>
    <div class="hr"></div>
    <!-- 주소 -->
    <div id="info" style="width: 100%; height: 30%; margin-bottom: 10px; margin-left: 40px;">
       
        <div class="item">
          <img alt="" src="../img/item_image/${itemDto.item_image }" class="item-photo">                  
          <ul class="item-info">
             <li style="font-weight: bold;">${itemDto.item_modelnum }</li>
             <li>${itemDto.item_engname }</li>
             <li style="opacity: 0.6">${itemDto.item_korname }</li>
             <li>${size }</li>
          </ul>
        </div>
        <div id="right-info"
             style="width: 90%; float: left; height: 200px; margin-top: 20px;">
            <span style="font-size: 18px;">반송 주소</span>
            <a id="addr-btn" href="#addr-modal" rel="modal:open"> + 새 주소 추가</a>
            <table>
                <tr>
                    <td class="left-td">받는분</td>
                    <td class="right-td" id="name">${userDto.user_name }</td>
                </tr>
                <tr>
                    <td class="left-td">연락처</td>
                    <td class="right-td" id="phone">${userDto.user_hp }</td>
                </tr>
                <tr>
                    <td class="left-td">배송 주소</td>
                    <td class="right-td" id="addr">${userDto.user_addr }</td>
                </tr>
            </table>
            <div style="font-size: 13px; color: red; opacity: 0.7; text-align:center; margin-top: 15px;">검수 불합격시 제품이 반송 될 주소를 등록해주세요</div>
        </div>
    </div>
    
    <!-- 정산 계좌  -->
    <div style="margin-left: 40px;">
        <div style="border-top: 1px solid #e3e3e3; width: 95%; height: 10%; margin-top: 220px; margin-bottom: 15px;"></div>
        <div style="padding-top: 20px;  font-size: 14px; opacity: 0.4;"></div>
        
        <div style="font-size: 18px;">정산 계좌 정보</div>
        <div>
             <select name="account1" id="account1">
                <option value="국민">국민</option>
                <option value="농협">농협</option>
                <option value="신한">신한</option>
                <option value="새마을금고">새마을금고</option>
                <option value="카카오뱅크">카카오뱅크</option>
                <option value="토스">토스</option>
             </select>
            <input type="number"  name="account2" id="account2" class="bank-number" placeholder="- 제외 계좌번호를 입력해주세요" required="required"> 
        </div>   
   
   <!-- 패널티 카드정보  -->       
        <div style="font-size: 18px; margin-top: 30px; ">패널티 결제 정보</div>
        <div>
             <select name="penaltypay1" id="penaltypay1">
                <option value="BC">BC</option>
                <option value="현대">현대</option>
                <option value="카카오뱅크">카카오뱅크</option>
                <option value="농협">농협</option>
                <option value="신한">신한</option>
                <option value="토스">토스</option>
             </select>
            <input type="number" name="penaltypay2" id="penaltypay2" class="bank-number" placeholder="신용카드 번호를 입력해주세요" required="required">
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
           <div style="color: red; margin-left: 460px; font-size: 18px" id="totalPrice"><b><fmt:formatNumber value="${totalPrice }" type="number"/>원</b></div>
        </div>
        
        <div style="display: flex; margin: 15px 5px 15px 5px;">
          <button type="button" id="sell-back">뒤로가기</button> 
          <button type="button" id="sell-next">판매 접수</button>
       </div>    
    </div>         
</div>

<!-- 주소 modal창 -->
<div id="addr-modal">
    <div align="center" style="margin-bottom: 30px; font-weight: bold">새 주소 추가</div>
    <form id="addrForm">
        <div class="modal-input">
            이름<br>
            <input type="text" id="modal-name" placeholder="수령인 이름 입력" required="required">
        </div>
        <div class="modal-input">
            전화번호<br>
            <input type="text" id="modal-phone" placeholder="- 없이 입력" required="required"
                   oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
        </div>
        <input type="hidden" id="sample6_extraAddress">
        <div class="modal-input">
            우편번호<br>
            <input type="text" placeholder="우편 번호를 검색하세요" class="none-input" id="sample6_postcode"
                   readonly="readonly" style="float: left; width: 75%" required="required">
            <input type="button" class="btn-modal addr-search" onclick="sample6_execDaumPostcode()" value="주소 검색"
                   style="float: left; font-size: 12px; padding: 0px 19px; height: 40px; margin-top: 7px;
                            border-radius: 0px; border: none; border-bottom: 1px solid #e3e3e3">
        </div>
        <div style="clear: left; margin-bottom: 20px"></div>
        <div class="modal-input">
            주소<br>
            <input type="text" id="sample6_address" placeholder="우편 번호 입력 시 자동 입력" class="none-input" readonly="readonly">
        </div>
        <div class="modal-input">
            상세 주소<br>
            <input type="text" id="sample6_detailAddress" placeholder="건물, 아파트, 동/호수 입력" required="required">
        </div>
        <div align="center">
            <a href="#" rel="modal:close">
                <input type="button" class="btn-modal" value="취소">
            </a>
            <a href="#" rel="modal:close">
                <input type="button" class="btn-modal" id="modal-submit" value="저장">
            </a>
        </div>
    </form>
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

<script type="text/javascript">
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
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
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
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