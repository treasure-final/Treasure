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
            src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff") format("woff");
            font-weight: normal;
            font-style: normal;
        }

        * {
            font-family: "GmarketSansMedium";
            font-size: 10px;
            padding: 0;
            margin: 0;
            border: none;
        }

        .agree-wrapper {
            width: 800px;
            padding: 40px;
            box-sizing: border-box;
            margin-top: 100px !important;
            line-height: 30px;
            margin: auto;
            position: relative;
        }


        #login-form > input:not(#btn-login) {
            width: 100%;
            height: 48px;
            padding: 0 10px;
            box-sizing: border-box;
            margin-bottom: 16px;
            border-radius: 6px;
            background-color: #F8F8F8;
        }

        input[type="checkbox"] {
            display: none;
            float: right;
            
        }

       input[type="checkbox"] + label {
        width: 25px;
        height: 25px;
        border:2px solid #747f55;
        position: relative;
        margin-right: 5px;
        float: right;
		
        }

       input[id="check1"]:checked + label::after,input[id="check2"]:checked + label::after,
       input[id="check3"]:checked + label::after,input[id="check4"]:checked + label::after,input[id="check5"]:checked + label::after{
        content:'✔';
        color: #fff;
        background: #747f55;
        font-size: 20px;
        width: 25px;
        height: 25px;
        text-align: center;
        position: absolute;
        left: 0;
        top: 0;
        float: right;
      }

        #btn-login {
            font-size: 14px;
            color: #fff;
            background-color: #747f55;
            padding: 5px 20px;
            border-radius: 10px;
            font-weight: 400;
            text-transform: capitalize;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            margin-top: 15px;
            width: 100%;
            text-align: center;
        }

        #btn-login:hover {
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
            
        }
        
        .item{
       	 	width: 100%;
        	margin:auto;
        	margin-top: 30px;
        	display: flex;
    		flex-direction: row;
    		align-items: center;
    		
        }
        
        .item-photo{
        	width: 180px;
        	object-fit: cover;	
        }
        
        .item-info{
        	display: flex;
   			flex-direction: column;
    		margin-left: 20px;
        	
        }
        
        .item-info>li{
        	list-style: none;
        	font-size: 18px;	
        }
        
        .agree-ment{
        	 margin-top: 30px;
        	 font-size: 20px;        	 
        }
        
        .agree-check{
        	width: 100%;
       	 	height: 300px;
        	margin:auto;
        	margin-top: 10px;
        	display: flex;
    		flex-direction: column;
    		align-items: center;
    		border: 1px solid #D2D2D2;
    		justify-content: center;
    		align-items: flex-start;
    		
        }
                
        .agree-check>div{
        display: flex;
  		align-items: center;
        padding: 10px;	
        
        }
        
        .agree-check>div>span{
        display: flex;
  		align-items: center;
  		font-size: 15px;
        padding: 3px;
        width: 500px;	
        }
    </style>
</head>
<body>
<div class="agree-wrapper">
    <div><i id="logo">판매동의</i></div>
    	<div class="item">
    		<img alt="" src="../../img/최고심3.jpg" class="item-photo">   		   		
    		<ul class="item-info">
    			<li>품번</li>
    			<li>상품명(영)</li>
    			<li>일단상품명(한)</li>
    			<li>사이즈</li>
    		</ul>   		
    	</div>
    	
    	<div class="agree-ment"><b style="font-size: 1.1em; color: #747f55;">판매</b> 전 꼭 확인 해주세요</div>
    		
    	<div class="agree-check" id="agree-check">
    		<div>
    		<span>판매하려는 상품과 일치 합니다</span><input type="checkbox" required="required" id="check1"><label for="check1"></label>
    		</div>
    		
    		<div>
    		<span>국내/해외에서 발매한 정품 및 새상품 입니다</span><input type="checkbox" required="required" id="check2"><label for="check2"></label>
    		</div>
    		
    		<div>
    		<span>패키지 상태를 확인하였으며 문제가 없습니다</span><input type="checkbox" required="required" id="check3"><label for="check3"></label>
    		</div>
    		
    		<div>
    		<span>이중 포장하여 발송 합니다</span><input type="checkbox" required="required" id="check4"><label for="check4"></label>
    		</div>
    		
    		<div>
    		<span>TREASURE의 이용정책을 확인 하였습니다</span><input type="checkbox" required="required" id="check5"><label for="check5"></label>
    		</div>
    	</div>
    	  
        <!-- <input type="button" value="button" id="btn-login" class=""> -->
    
</div>
</body>
</html>