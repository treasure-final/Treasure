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
	cursor: pointer;
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
	font-size: 14px;
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
}

.sell-content:hover {
	border: 1px solid  rgba(34,34,34,.5);
	background-color: #FAFAFA;
}

.sell-content-no {
	width: 900px;
	font-size: 14px;
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
	font-size: 14px;
	margin-top: 15px;
}
</style>

<script type="text/javascript">

</script>
</head>
<body>
<div class="wrapper">
    <div class="side">
        <div class="side-title">마이 페이지</div>
        <div id="side-top">
            <div class="sub-title">쇼핑 정보</div>
            <div class="sub-menu">
                <div>구매 내역</div>
                <div style="color: #747f55;">판매 내역</div>
                <div>보관 판매</div>
                <div>관심 상품</div>
            </div>
        </div>
        <div id="side-bottom">
            <div class="sub-title">내 정보</div>
            <div class="sub-menu">
                <div><b>프로필 정보</b></div>
                <div>주소록</div>
                <div>결제 정보</div>
                <div>판매 정산 계좌</div>
                <div>현금영수증 정보</div>
                <div>포인트</div>
            </div>
        </div>
    </div>
    


    <div class="container">
    <h2 id="logo"><i>판매 내역</i></h2>
    <div style="margin-bottom: 60px;"></div>
    
    
	    <div class="sell-header">
	    	<div style="width: 600px;">전체 3개</div>
	    	<div style="width:80px;">검수현황</div>
	    	<div style="width:80px;">상태</div>
	    	<div style="width:170px; margin-left: 15px;">접수일</div>
	    </div>
	    
	    <div style="margin-top: 30px;"></div>
	    	    
	<c:forEach items="${list}" var="sellTotalDto">
            <c:if test="${sellTotalDto.sell_num == null && sellTotalDto.sellnow_num != null && sellTotalDto.sellNowDto.test_result eq '불합격' }">
    		<div class="sell-content-no"> 
	        	<div style="width: 600px; display: flex; font-size: 15px;">
	                <img class="sellImg" src="../img/item_image/${sellTotalDto.itemDto.item_image}">
	                <div class="sellDescription">
	                    <div>${sellTotalDto.itemDto.item_engname}</div>
	                    <div>${sellTotalDto.itemDto.item_korname}</div>
	                    <div>${sellTotalDto.itemDto.item_size}</div>
	                </div>
				</div>             
	                <div style="width: 100px;">${sellTotalDto.sellNowDto.test_result}</div>
	                <div style="width: 100px;">${sellTotalDto.sellNowDto.sell_status}</div>
	                <div style="width: 150px; margin-left: 15px;"><fmt:formatDate value="${sellTotalDto.sellNowDto.sellnow_inputday}" pattern="yyyy/MM/dd"/></div>              
			</div>
            </c:if>
	           
            <c:if test="${sellTotalDto.sell_num == null && sellTotalDto.sellnow_num != null && sellTotalDto.sellNowDto.test_result eq '합격' }">
	 		<div class="sell-content">            
	        	<div style="width: 600px; display: flex; font-size: 15px;">
	                <img class="sellImg" src="../img/item_image/${sellTotalDto.itemDto.item_image}">
	                <div class="sellDescription">
	                    <div>${sellTotalDto.itemDto.item_engname}</div>
	                    <div>${sellTotalDto.itemDto.item_korname}</div>
	                    <div>${sellTotalDto.itemDto.item_size}</div>
	                </div>
				</div>             
	                <div style="width: 100px; color: #31b46e;">${sellTotalDto.sellNowDto.test_result}</div>
	                <div style="width: 100px;">${sellTotalDto.sellNowDto.sell_status}</div>
	                <div style="width: 150px; margin-left: 15px;"><fmt:formatDate value="${sellTotalDto.sellNowDto.sellnow_inputday}" pattern="yyyy/MM/dd"/></div>              
			</div>                
            </c:if>
            
            <c:if test="${sellTotalDto.sellnow_num == null && sellTotalDto.sell_num != null  && sellTotalDto.sellBidDto.test_result eq '불합격'}">
			<div class="sell-content-no">            
	            <div style="width: 600px; display: flex; font-size: 15px;">
	                <img class="sellImg" src="../img/item_image/${sellTotalDto.itemDto.item_image}">
	                <div class="sellDescription">
	                    <div>${sellTotalDto.itemDto.item_engname}</div>
	                    <div>${sellTotalDto.itemDto.item_korname}</div>
	                    <div>${sellTotalDto.sellBidDto.sell_size}</div>
	                </div>
				</div>                
	                <div style="width: 100px;">${sellTotalDto.sellBidDto.test_result}</div>
	                <div style="width: 100px;">${sellTotalDto.sellBidDto.sell_status}</div>
	                <div style="width: 150px; margin-left: 15px;"><fmt:formatDate value="${sellTotalDto.sellBidDto.sell_inputday}" pattern="yyyy/MM/dd"/></div>                
			</div>                
            </c:if>
            
            <c:if test="${sellTotalDto.sellnow_num == null && sellTotalDto.sell_num != null  && sellTotalDto.sellBidDto.test_result eq '합격'}">
			<div class="sell-content">            
	            <div style="width: 600px; display: flex; font-size: 15px;">
	                <img class="sellImg" src="../img/item_image/${sellTotalDto.itemDto.item_image}">
	                <div class="sellDescription">
	                    <div>${sellTotalDto.itemDto.item_engname}</div>
	                    <div>${sellTotalDto.itemDto.item_korname}</div>
	                    <div>${sellTotalDto.sellBidDto.sell_size}</div>
	                </div>
				</div>                
	                <div style="width: 100px; color: #31b46e;">${sellTotalDto.sellBidDto.test_result}</div>
	                <div style="width: 100px;">${sellTotalDto.sellBidDto.sell_status}</div>
	                <div style="width: 150px; margin-left: 15px;"><fmt:formatDate value="${sellTotalDto.sellBidDto.sell_inputday}" pattern="yyyy/MM/dd"/></div>                
			</div>                
            </c:if>  
	</c:forEach>
     
    </div>
    
<div style="clear: left"></div>
</div>



</body>
</html>
