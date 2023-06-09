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
	margin-bottom: 15px;
}

.container {
	width: 900px;
	min-height: 55vh;
	padding: 40px;
	box-sizing: border-box;
	margin: 50px auto;
	line-height: 30px;
	background-color: #ffffff;
	font-family: "GmarketSansMedium";
}

#logo {
	font-size: 25px;
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
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
	cursor: pointer;
}

#sell-next {
	font-size: 13px;
	color: #fff;
	background-color: #747f55;
	padding: 18px 30px;
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
	cursor: pointer;
}

#sell-next:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

.container>h2 {
	font-size: 24px;
	color: black;
	margin-bottom: 40px;
	text-align: center;
}

#sell-form>input {
	width: 95%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
	margin-right: 10px;
	text-align: right;
	font-size: 18px;
	font-weight: bold;
}

#sell-form>input::placeholder {
	color: #D2D2D2;
}

.btn-sellType {
	font-size: 14px;
	color: #fff;
	background-color: #ef6253;
	padding: 10px 0;
	border-radius: 25px;
	font-weight: 400;
	text-transform: capitalize;
	letter-spacing: 0.5px;
	transition: all 0.3s;
	position: relative;
	overflow: hidden;
	margin-top: 4px;
	width: 335px;
	text-align: center;
	cursor: pointer;
	font-family: "GmarketSansMedium";
}

.btn-submit:hover {
	background-color: #fff;
	color: #747f55;
	border: 1px solid #747f55;
}

.deadline {
	border: 1px solid darkgray;
	padding: 17px 55px;
	border-radius: 15px;
	margin-right: 7px;
	cursor: pointer;
}

.deadline:hover {
	background-color: #f3f3f3;
}

.btn-submit {
	width: 100%;
	padding: 17px 0;
	border-radius: 15px;
	background-color: #747f55;
	color: #ffffff;
	font-size: 14px;
	cursor: pointer;
}

.price-info {
	float: left;
	width: 49%;
	margin-top: 20px;
	font-size: 16px;
}

.result-bottom {
	border-top: 1px solid #b9b9b9;
	width: 95%;
	height: 10%;
	margin-top: 15px;
	font-size: 14px;
	padding-top: 20px;
	
}

.hr {
	border: none;
	height: 2px;
	background: black;
	margin-bottom: 50px;
}

.item {
    width: 100%;
    margin: auto;
    margin-top: 30px;
    margin-bottom: 30px;
    margin-left: -25px;
    display: flex;
    flex-direction: row;
    align-items: center;
}

.item-photo {
    width: 180px;
    height: 180px;
    object-fit: cover;
    border-radius: 20px;
}

.item-info {
    display: flex;
    flex-direction: column;
    margin-left: -20px;                        
    width: 700px;
}

.item-info > li {
    list-style: none;
    font-size: 14px;
    margin-bottom: -3px;
    font-size: 15px;
   
}
</style>
<script>
	$(function() {
		var totalPrice;
		
		sellNowPrice = '${sellNowPrice }';
		
		if(sellNowPrice == 0) {
			$("#result-immediate").hide();
			$("#result-bid").show();
			$("#sell-immediate").attr("disabled", "disabled");
			$("#sell-immediate").css("background-color", "#e3e3e3").css("color", "black");
			
		} else {
			$("#sell-bid").css("background-color", "#e3e3e3").css("color", "black");
			$("#result-bid").hide();
			
			calculatePrice("sell-immediate", $("#immediatePrice").text());
		}	
		
		$("#sell-bid").click(
				function() {
					$("#result-immediate").hide();
					$("#result-bid").show();
					$("#sell-immediate").css("background-color", "#e3e3e3")
							.css("color", "black");
					$("#sell-bid").css("background-color", " #ef6253").css(
							"color", "#fff");
					
					$("#hopePrice").val("");
					$(".sellBid.feeResult").text("-원");
					$(".sellBid.totalPrice").text("-원");
				});
		$("#sell-immediate").click(
				function() {
					$("#result-bid").hide();
					$("#result-immediate").show();
					$("#sell-bid").css("background-color", "#e3e3e3").css(
							"color", "black");
					$("#sell-immediate").css("background-color", " #ef6253")
							.css("color", "#fff");
					
					$(".totalPrice").text("-원");
					
					calculatePrice("sell-immediate", $("#immediatePrice").text());
				});
		$(".deadline").click(function() {

			let day = $(this).text();
			let intDay = $(this).attr("day");

			let today = new Date();

			let year = today.getFullYear();

			let month = today.getMonth() + 1
			let date = today.getDate() + parseInt(intDay);
			let deadDay = year + "/" + month + "/" + date;

			$(".deadline").css("border", "1px solid darkgray");
			$(this).css("border", "1px solid black");
			$("#deadline-day").text(day);
			$("#deadline-date").text(deadDay);
		});

		$("#hopePrice").change(function () {
			var price = $(this).val();
			replacePrice = parseFloat(price.replace(/[^0-9]/g, ''));

			if(replacePrice < 4000) {
				$("#hopePrice").css("border", "2px solid red");
				$("#hopePrice").val("");	
				$("#input-fail").css("display", "block");
				$(".sellBid.feeResult").text("-원");
				$(".sellBid.totalPrice").text("-원");
				
				return;
				
			} else {
				replacePrice = Math.floor(replacePrice / 1000) * 1000; 
				
				$("#hopePrice").css("border", "none");
				$("#input-fail").css("display", "none");
				$("#hopePrice").val(comma(replacePrice));
				
				calculatePrice("sell-bid", price);
			}	

		})
	});

	function inputNumberFormat(obj) {
		obj.value = comma(uncomma(obj.value));
	}

	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	}
		
	function calculatePrice(type, obj) {
		
		if(type == "sell-bid") {
			price = parseFloat(obj.value.replace(/[^0-9]/g, ''));
			
			if(isNaN(price))     
		        return;
			
			if(price < 4000) {
				
				return;
			}
			
		} else if(type == "sell-immediate"){
			price = parseFloat(obj.replace(/[^0-9]/g, ''));
		} else 
			price = price;
		
		var fee = Math.round((price * 0.2) / 1000) * 1000;
		totalPrice = (price - (fee + 3000));
		
		$(".feeResult").text(comma(fee) + "원");
		$(".totalPrice").text(comma(totalPrice) + "원");
		$("#totalPrice_").val(totalPrice);	 
	}

	window.onclick = function change() {
		price = uncomma($("#hopePrice").val());
	
		if(price < 4000) {
			$(".sellBid.feeResult").text("-원");
			$(".sellBid.totalPrice").text("-원");
		} else {
			calculatePrice("sell-bid", price);		
		} 
	}
</script>
</head>
<body>
<div class="container">
<input type="hidden" name="item_num" value="${item_num }">
<input type="hidden"id="totalPrice_" value="${totalPrice }">
<div><i id="logo">판매하기</i></div>
 <div class="hr"></div>
    <div id="info" style="width: 100%; height: 60vh; margin-bottom: 10px; margin-left: 40px;">        
        <div class="item">
          <img alt="" src="../img/item_image/${itemDto.item_image }" class="item-photo">                  
          <ul class="item-info">
             <li style="font-weight: bold;">${itemDto.item_modelnum }</li>
             <li>${itemDto.item_engname }</li>
             <li>${itemDto.item_korname }</li>
             <li>${size }</li>
          </ul>
       </div>
       
        <div id="right-info"
             style="border-top: 1px solid #b9b9b9; width: 90%; float: left; height: 40%;">
            <div class="price-info" align="center">
                <div style="opacity: 0.7; font-size: 14px;">즉시 구매가</div>
                169,000
            </div>
            <div class="price-info" align="center" style="border-left: 1px solid #b9b9b9">
                <div style="opacity: 0.7; font-size: 14px;">즉시 판매가</div>
                
                <c:if test="${sellNowPrice == 0}">
                	-원
                </c:if>
                
                <c:if test="${sellNowPrice != 0}">
                	<fmt:formatNumber value="${sellNowPrice }" type="number"/>원
                </c:if>
                
            </div> 
            <div id="typeBtn"
                 style="margin-left: 7px; background-color: #e3e3e3; height: 55px; margin-top: 100px; margin-right: 10px; border-radius: 25px;">
                              
               	<input type="button" value="판매 입찰" class="btn-sellType" id="sell-bid"
                      style="float: left; margin-right: 23px; margin-left: 13px;">
                
                <input type="button" value="즉시 판매" class="btn-sellType" id="sell-immediate" style="float: left;">
            </div>
        </div>
    </div>
    
    <!-- 즉시 판매  -->
    <div id="result-immediate" style="margin-left: 40px">
        <div style="font-size: 13px;">즉시 판매가</div>
        <div align="right" style="font-size: 20px; margin-right: 35px; margin-top: 10px" id="immediatePrice"><fmt:formatNumber value="${sellNowPrice }" type="number"/>원</div>

        <div class="result-content"
             style="border-top: 1px solid #b9b9b9; width: 95%; height: 10%; margin-top: 39px;">
        </div>
           
        <div style="padding-top: 20px; padding-bottom: 10px; font-size: 14px; width: 95%;">
	        <span style="opacity: 0.4;">검수비</span>
	        <span style="float: right;">3,000원</span><br>
	        <span style="opacity: 0.4;">수수료</span>	    
	        <span style="float: right;" class="feeResult">-원</span> 
        </div>
        		
        <div class="result-bottom">
            총 정산금액<span class="totalPrice" style="font-size: 14px; margin-left: 500px; float: right;">-원</span>
            <div style="display: flex;">
            <button type="button" class="sell-back" id="sell-back">뒤로가기</button> 
            <button type="button" id="sell-next" onclick="moveOrderPage('now')">판매 계속하기</button>
            </div>
        </div>
    </div>
	
	<!-- 판매 입찰  -->
    <div id="result-bid" style="margin-left: 40px">   
	    <div style="font-size: 14px; width: 95%;">
	    	<span>판매 희망가</span>
	    	<span id="input-fail" style="float: right; font-size: 13px; color : red; display : none;">4천원 부터 천원단위로 입력 가능합니다</span>
	    </div>

        <div align="right" style="font-size: 20px; margin-right: 35px;" id="sell-form">
            <input type="text" id="hopePrice" placeholder="희망가 입력" onkeyup="inputNumberFormat(this)" onkeydown="if (event.keyCode === 13) { calculatePrice('sell-bid', this); }">원
        </div>

        <div class="result-content"
             style="border-top: 1px solid #b9b9b9; width: 95%; height: 10%; margin-top: 15px;">
        </div>
        <div style="padding-top: 20px; padding-bottom: 10px; font-size: 14px; width: 95%;">
			<span style="opacity: 0.4;">검수비</span>
	        <span style="float: right;">3,000원</span><br>
	        <span style="opacity: 0.4;">수수료</span>	    
	        <span style="float: right;" class="sellBid feeResult">-원</span> 
		</div>
        
        <div style="padding: 30px 0;">
            <p style="font-size: 14px;">입찰 마감기한</p>
            <p style="font-size: 13px;"><span id="deadline-day" style="font-size: 13px"></span>(<span id="deadline-date"
                                                                                                      style="font-size: 13px;"></span>)
                마감</p><br>
             
	            <span class="deadline" day="1">
	                1일
	            </span>
	            <span class="deadline" day="3">
	                3일
	            </span>
	            <span class="deadline" day="7">
	                7일
	            </span>
	            <span class="deadline" day="30">
	                30일
	            </span>
	            <span class="deadline" day="60">
	                60일
	            </span>
            
        </div>
        <div class="result-bottom">
            총 정산금액<span class="sellBid totalPrice" id="totalPrice" style="font-size: 14px; margin-left: 500px; float: right;">-원</span>
            <div style="display: flex;">
            <button type="button" id="sell-back" class="sell-back">뒤로가기</button> 
            <button type="button" id="sell-next" onclick="moveOrderPage('bid')">판매 입찰 계속하기</button>
            </div>
    </div>
</div>

</div>

<script type="text/javascript">
//일단은 걍 뒤로가기
$(".sell-back").click(function(){
	history.back();
	
});


	 function moveOrderPage(type) {
         totalPrice = $("#totalPrice_").val();
         buy_num = '${buy_num}';
         item_num = '${item_num}';
         if(type == "bid") {
	         var hopePrice = uncomma($("#hopePrice").val());
	         var selectedDeadline = $(".deadline.selected");
	         var deadline = parseInt(selectedDeadline.attr("day"));
	         
	         if(hopePrice==null || hopePrice==""){
	             alert("희망가를 입력해주세요");
	             return;
	          }
	         
	         if (isNaN(deadline)) {
	             alert("마감 기한을 선택해주세요.");
	             return;
	         }
	         location.href = '/sell/sellCalculate?type=' + type + '&item_num=${item_num}&size=${size}&hopePrice='+hopePrice+'&deadline='+deadline+"&totalPrice="+totalPrice;
	         
         } else 
        	 location.href = '/sell/sellCalculate?type=' + type + '&item_num=${item_num}&size=${size}&buy_num=' + buy_num + '&totalPrice=' + totalPrice;
         
     }
	 
	 $(".deadline").click(function() {
	        $(".deadline").removeClass("selected");
	        $(this).addClass("selected");
	    });
</script>
</body>
</html>