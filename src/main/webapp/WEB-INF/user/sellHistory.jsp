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
	cursor: pointer;
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
	width: 1200px;
}

.sellTable{
	width: 1200px;
	align-content: center;
	border-collapse: collapse;
}

.sellTable td {
  vertical-align: middle;
}

.sellTable td div {
  margin-left: 15px;
}


.sellTable tr {
  height: 150px;
  border-bottom: 1px solid #D2D2D2;
}

.sellImg{
	width: 100px;
	height: 100px;
	border-radius: 15px;
	margin-left: 10px;
	vertical-align: middle;
}

.sellDescription {
  display: flex;
  flex-direction: column;
  margin-left: 10px;
  margin-top: 20px;
  
}

</style>

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
    <div class="hr"></div>
    
    <table class="sellTable">
	    <tr style="height: 30px; text-align: left; opacity: 0.4; font-size: 14px; border-bottom: 0px;">
	    	<th style="width: 700px; font-weight: normal;"><span style="margin-left: 15px;"><i></i></span></th>
	    	<th style="width: 200px; font-weight: normal;"><span style="margin-left: 15px;"><i>판매일</i></span></th>
	    	<th style="width: 150px; font-weight: normal;"><span style="margin-left: 15px;"><i>검수현황</i></span></th>
	    	<th style="width: 150px; font-weight: normal;"><span style="margin-left: 15px;"><i>상태</i></span></th>
	    </tr>
	    
	    <tr>
	    	<td>
		    	<div style="display: flex; font-size: 15px;">
		    		<img class="sellImg" src="../img/item_image/16.png">
		    		<div class="sellDescription">
			    		<div>Arc'teryx Atom LT Hoody Black</div>
			    		<div>아크테릭스 아톰 LT 후디 블랙</div>
			    		<div>XL</div>
		    		</div>
		    	</div>
	    	</td>
	   
	    	<td style="font-size: 16px;"><div>2023.05.17</div> </td>
	   
	    	<td style="font-size: 16px;"><div>합격</div></td>
	         
	    	<td style="font-size: 16px;"><div>판매대기</div></td>
	    </tr>   
	    
	    <tr>
	    	<td>
		    	<div style="display: flex;">
		    		<img class="sellImg" src="../img/item_image/16.png">
		    		<div class="sellDescription">
			    		<div>Arc'teryx Atom LT Hoody Black</div>
			    		<div>아크테릭스 아톰 LT 후디 블랙</div>
			    		<div>XL</div>
		    		</div>
		    	</div>
	    	</td>
	   
	    	<td><div>2023.05.17</div> </td>
	   
	    	<td><div>합격</div></td>
	         
	    	<td><div>판매대기</div></td>
	    </tr>   
	    
	    
    </table>
    
      
     
    </div>

    
<div style="clear: left"></div>
</div>



</body>
</html>
