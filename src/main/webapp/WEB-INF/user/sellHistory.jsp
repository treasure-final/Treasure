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
            src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff") format("woff");
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
	width: 1300px;
	margin-bottom: 300px;
}

.container {
	width: 82%;	
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
	margin-left: 10px;
}

.sell-header {

	font-size: 13px;
	display: flex;
	margin-left: 10px;
	padding: 10px;
	/* background-color: yellow; */
	padding: 10px;
	opacity: 0.7;
}

.sell-content {
	width: 900px;
	font-size: 13px;
	display: flex;
	margin-left: 10px;
	/* background-color: #FAFAFA; */
	border: 1px solid rgba(34, 34, 34, .05);
	box-shadow: 0 2px 6px rgba(0, 0, 0, .12);
	border-radius: 20px;
	padding: 10px;
	margin-bottom: 25px;
	justify-content: center;
	align-items: center;
	cursor: pointer;
}

.sell-content:hover {
	border: 1px solid  rgba(34,34,34,.2);
	background-color: #FAFAFA;
}

.sell-content-no {
	width: 900px;
	font-size: 13px;
	display: flex;
	margin-left: 10px;
	background-color: rgba(34,34,34,.1);
	border: 1px solid rgba(34, 34, 34, .05);
	box-shadow: 0 2px 6px rgba(0, 0, 0, .12);
	border-radius: 20px;
	padding: 10px;
	margin-bottom: 25px;
	justify-content: center;
	align-items: center;
	opacity: 0.7;
}


.sellImg {
	width: 100px;
	height: 100px;
	border-radius: 15px;
}

.sellDescription {
	width: 500px;
	display: flex;
	flex-direction: column;
	margin-left: 10px;
	font-size: 13px;
	margin-top: 15px;
}
        
</style>

<script type="text/javascript">

$(function(){
	
	
	$(document).on("click", ".sellBid", function() {
		
		var sell_num=$(this).attr("sell_num");
		
		  location.href = "/user/sellSuccess?sell_num="+sell_num;
		});
	
	
	$(document).on("click", ".sellNow", function() {
		
		var sellnow_num=$(this).attr("sellnow_num");
		
		  location.href = "/user/sellNowSuccess?sellnow_num="+sellnow_num;
		});

});
</script>

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
                <div onclick="location.href='/user/sellHistory'" style="color: #747f55;">판매 내역</div>
                <div class="subsub-menu notready">보관 판매</div>
                <div class="subsub-menu notready">관심 상품</div>
            </div>
        </div>
        <div id="side-bottom">
            <div class="sub-title">내 정보</div>
            <div class="sub-menu">
                <div class="subsub-menu" onclick="location.href='/user/myProfile'"><b>프로필 정보</b></div>
                <div class="subsub-menu notready">주소록</div>
                <div class="subsub-menu notready">결제 정보</div>
                <div class="subsub-menu notready">판매 정산 계좌</div>
                <div class="subsub-menu notready">현금영수증 정보</div>
                <div class="subsub-menu notready">포인트</div>
            </div>
        </div>
    </div>

    <div class="container">
    <h2 id="logo"><i>판매 내역</i></h2>
    <div style="margin-bottom: 30px;"></div>
    
    
	    <div class="sell-header">
	    	<div style="width: 600px;">총 ${sellTotalCount }개</div>
	    	<div style="width:80px;">타입</div>
	    	<div style="width:80px;">상태</div>
	    	<div style="width:170px; margin-left: 15px;">접수일</div>
	    </div>
	    
	    <div style="margin-top: 30px;"></div>
	    
	<section id="sellHistorySection">    	    
	<c:forEach items="${list}" var="sellTotalDto">
            <c:if test="${sellTotalDto.sell_num == null && sellTotalDto.sellnow_num != null && sellTotalDto.sellNowDto.test_result eq '불합격' }">
    		<div class="sell-content-no"> 
	        	<div style="width: 600px; display: flex; font-size: 15px;">
	                <img class="sellImg" src="../img/item_image/${sellTotalDto.itemDto.item_image}">
	                <div class="sellDescription">
	                    <div>${sellTotalDto.itemDto.item_engname}</div>
	                    <div>${sellTotalDto.itemDto.item_korname}</div>
	                    <div>${sellTotalDto.buyBidDto.buy_size}</div>
	                </div>
				</div>             
	                <div style="width: 100px;">즉시</div>
	                <div style="width: 100px;">${sellTotalDto.sellNowDto.sell_status}</div>
	                <div style="width: 150px; margin-left: 15px;"><fmt:formatDate value="${sellTotalDto.sellNowDto.sellnow_inputday}" pattern="yyyy/MM/dd"/></div>              
			</div>
            </c:if>
	           
            <c:if test="${sellTotalDto.sell_num == null && sellTotalDto.sellnow_num != null && sellTotalDto.sellNowDto.test_result eq '합격' }">
	 		<div class="sell-content sellNow" sellnow_num=${sellTotalDto.sellnow_num }>            
	        	<div style="width: 600px; display: flex; font-size: 15px;">
	                <img class="sellImg" src="../img/item_image/${sellTotalDto.itemDto.item_image}">
	                <div class="sellDescription">
	                    <div>${sellTotalDto.itemDto.item_engname}</div>
	                    <div style="opacity: 0.5;">${sellTotalDto.itemDto.item_korname}</div>
	                    <div>${sellTotalDto.buyBidDto.buy_size}</div>
	                </div>
				</div>             
	                <div style="width: 100px;">즉시</div>
	                <c:if test="${sellTotalDto.sellNowDto.sell_status eq '판매완료'}"><div style="width: 100px; color:#31b46e;">${sellTotalDto.sellNowDto.sell_status}</div></c:if>
	                <c:if test="${sellTotalDto.sellNowDto.sell_status eq '판매대기'}"><div style="width: 100px;">${sellTotalDto.sellNowDto.sell_status}</div></c:if>
	                
	                <div style="width: 150px; margin-left: 15px;"><fmt:formatDate value="${sellTotalDto.sellNowDto.sellnow_inputday}" pattern="yyyy/MM/dd"/></div>              
			</div>                
            </c:if>
            
            <c:if test="${sellTotalDto.sellnow_num == null && sellTotalDto.sell_num != null  && sellTotalDto.sellBidDto.test_result eq '불합격'}">
			<div class="sell-content-no">            
	            <div style="width: 600px; display: flex; font-size: 15px;">
	                <img class="sellImg" src="../img/item_image/${sellTotalDto.itemDto.item_image}">
	                <div class="sellDescription">
	                    <div style="">${sellTotalDto.itemDto.item_engname}</div>
	                    <div>${sellTotalDto.itemDto.item_korname}</div>
	                    <div>${sellTotalDto.sellBidDto.sell_size}</div>
	                </div>
				</div>                
	                <div style="width: 100px;">입찰</div>
	                <div style="width: 100px;">${sellTotalDto.sellBidDto.sell_status}</div>
	                <div style="width: 150px; margin-left: 15px;"><fmt:formatDate value="${sellTotalDto.sellBidDto.sell_inputday}" pattern="yyyy/MM/dd"/></div>                
			</div>                
            </c:if>
            
            <c:if test="${sellTotalDto.sellnow_num == null && sellTotalDto.sell_num != null  && sellTotalDto.sellBidDto.test_result eq '합격'}">
			<div class="sell-content sellBid" sell_num="${sellTotalDto.sell_num }">            
	            <div style="width: 600px; display: flex; font-size: 15px;">
	                <img class="sellImg" src="../img/item_image/${sellTotalDto.itemDto.item_image}">
	                <div class="sellDescription">
	                    <div>${sellTotalDto.itemDto.item_engname}</div>
	                    <div style="opacity: 0.5;">${sellTotalDto.itemDto.item_korname}</div>
	                    <div>${sellTotalDto.sellBidDto.sell_size}</div>
	                </div>
				</div>                
	                <div style="width: 100px;">입찰</div>
	                <c:if test="${sellTotalDto.sellBidDto.sell_status eq '판매완료'}"><div style="width: 100px; color:#31b46e;">${sellTotalDto.sellBidDto.sell_status}</div></c:if>
	                <c:if test="${sellTotalDto.sellBidDto.sell_status eq '판매대기'}"><div style="width: 100px;">${sellTotalDto.sellBidDto.sell_status}</div></c:if>
	                <div style="width: 150px; margin-left: 15px;"><fmt:formatDate value="${sellTotalDto.sellBidDto.sell_inputday}" pattern="yyyy/MM/dd"/></div>                
			</div>                
            </c:if>  
	</c:forEach>
	</section> 
    </div>
    
    
    
<div style="clear: left"></div>
</div>

<script type="text/javascript">
		
	var offset=${offset};
	      window.onscroll = function(e) {
	            console.log(window.innerHeight , window.scrollY,document.body.offsetHeight,document.body.scrollHeight)
	            if((window.innerHeight + window.scrollY+1200) >= document.body.scrollHeight) {

	               offset=offset+6;   //데이터의 시작점 limit의 수와 똑같이 더해줘야함

	               $.ajax({
	                 type:"get",
	                 dataType:"json",
	                 url:"/user/sellHistoryScroll",
	                 data:{"offset":offset},
	                 success:function(res){
	                	  
	                    $.each(res,function(i,sellTotalDto){   //res의 담겨있는 list를 이치함수로 받아와 반복문 실행

	                    	let html = '';	                    	
	                    	
	                    	setTimeout(function(){ 
	                        if(sellTotalDto.sell_num == null && sellTotalDto.sellnow_num != null && sellTotalDto.sellNowDto.test_result === '불합격'){
	                            html += '<div class="sell-content-no">';
	                              html += '   <div style="width: 600px; display: flex; font-size: 15px;">';
	                              html += '       <img class="sellImg" src="../img/item_image/' + sellTotalDto.itemDto.item_image + '">';
	                              html += '       <div class="sellDescription">';
	                              html += '           <div>' + sellTotalDto.itemDto.item_engname + '</div>';
	                              html += '           <div>' + sellTotalDto.itemDto.item_korname + '</div>';
	                              html += '           <div>' + sellTotalDto.buyBidDto.buy_size + '</div>';
	                              html += '       </div>';
	                              html += '   </div>';
	                              html += '   <div style="width: 100px;">즉시</div>';
	                              html += '   <div style="width: 100px;">' + sellTotalDto.sellNowDto.sell_status + '</div>';
	                              html += '   <div style="width: 150px; margin-left: 15px;">' + sellTotalDto.sellNowDto.sellnow_inputday + '</div>';
	                              html += '</div>';	                          	                           
	                        };
	                       
	                   if(sellTotalDto.sell_num == null && sellTotalDto.sellnow_num != null && sellTotalDto.sellNowDto.test_result === '합격'){	                      
	                       html += '<div class="sell-content sellNow" sellnow_num='+sellTotalDto.sellnow_num+'>';
	                              html += '   <div style="width: 600px; display: flex; font-size: 15px;">';
	                              html += '       <img class="sellImg" src="../img/item_image/' + sellTotalDto.itemDto.item_image + '">';
	                              html += '       <div class="sellDescription">';
	                              html += '           <div>' + sellTotalDto.itemDto.item_engname + '</div>';
	                              html += '           <div style="opacity: 0.5;">' + sellTotalDto.itemDto.item_korname + '</div>';
	                              html += '           <div>' + sellTotalDto.buyBidDto.buy_size + '</div>';
	                              html += '       </div>';
	                              html += '   </div>';
	                              html += '   <div style="width: 100px;">즉시</div>';
	                              if(sellTotalDto.sellNowDto.sell_status==='판매완료'){
	                            	  html += '   <div style="width: 100px; color: #31b46e;">' + sellTotalDto.sellNowDto.sell_status + '</div>';	                            	  
	                              }else if(sellTotalDto.sellNowDto.sell_status==='판매대기'){
	                              html += '   <div style="width: 100px;">' + sellTotalDto.sellNowDto.sell_status + '</div>';	                            	  
	                              }
	                              html += '   <div style="width: 150px; margin-left: 15px;">' + sellTotalDto.sellNowDto.sellnow_inputday + '</div>';
	                              html += '</div>';                        
	                   };
	                   
	                   if(sellTotalDto.sellnow_num == null && sellTotalDto.sell_num != null  && sellTotalDto.sellBidDto.test_result === '불합격'){
	                      html += '<div class="sell-content-no">';
	                           html += '   <div style="width: 600px; display: flex; font-size: 15px;">';
	                           html += '       <img class="sellImg" src="../img/item_image/' + sellTotalDto.itemDto.item_image + '">';
	                           html += '       <div class="sellDescription">';
	                           html += '           <div>' + sellTotalDto.itemDto.item_engname + '</div>';
	                           html += '           <div>' + sellTotalDto.itemDto.item_korname + '</div>';
	                           html += '           <div>' + sellTotalDto.sellBidDto.sell_size + '</div>';
	                           html += '       </div>';
	                           html += '   </div>';
	                           html += '   <div style="width: 100px;">입찰</div>';
	                           html += '   <div style="width: 100px;">' + sellTotalDto.sellBidDto.sell_status + '</div>';
	                           html += '   <div style="width: 150px; margin-left: 15px;">' + sellTotalDto.sellBidDto.sell_inputday + '</div>';
	                           html += '</div>';                     
	                   };
	                   
	                   if(sellTotalDto.sellnow_num == null && sellTotalDto.sell_num != null  && sellTotalDto.sellBidDto.test_result === '합격'){
	                      	html += '<div class="sell-content sellBid" sell_num='+sellTotalDto.sell_num+'>';
	                           html += '   <div style="width: 600px; display: flex; font-size: 15px;">';
	                           html += '       <img class="sellImg" src="../img/item_image/' + sellTotalDto.itemDto.item_image + '">';
	                           html += '       <div class="sellDescription">';
	                           html += '           <div>' + sellTotalDto.itemDto.item_engname + '</div>';
	                           html += '           <div style="opacity: 0.5;">' + sellTotalDto.itemDto.item_korname + '</div>';
	                           html += '           <div>' + sellTotalDto.sellBidDto.sell_size + '</div>';
	                           html += '       </div>';
	                           html += '   </div>';
	                           html += '   <div style="width: 100px;">입찰</div>';
	                           if(sellTotalDto.sellBidDto.sell_status==='판매완료'){
	                           html += '   <div style="width: 100px; color: #31b46e;">' + sellTotalDto.sellBidDto.sell_status + '</div>';	                        	   
	                           }else if(sellTotalDto.sellBidDto.sell_status==='판매대기'){
	                           html += '   <div style="width: 100px;">' + sellTotalDto.sellBidDto.sell_status + '</div>';	                        	   
	                           }
	                           html += '   <div style="width: 150px; margin-left: 15px;">' + sellTotalDto.sellBidDto.sell_inputday + '</div>';
	                           html += '</div>';	                      
	                   };
	                   
		                   var addContent = document.createElement("div"); 
		                   addContent.innerHTML = html;
		                   document.querySelector('section').appendChild(addContent);
		                   },700);
	                    	
	                    });     
	                 }
	               });	               
	            }
	          };
	        
</script>



</body>
</html>