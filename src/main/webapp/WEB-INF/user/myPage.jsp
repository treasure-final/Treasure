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

div.main {
	font-family: "GmarketSansMedium";
	font-size: 13px;
	padding: 0;
	margin: 0;
	border: none;
}

.wrapper {
	width: 1300px;
	margin-bottom: 100px;
}

.container {
	width: 82%;
	height: 1000px;
	padding: 40px;
	box-sizing: border-box;
	margin-left: 0px;
	margin-top: 30px;
	float: left;
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

#profile-info {
	border: 1px solid #e3e3e3;
	border-radius: 10px;
	height: 150px;
	margin-bottom: 45px;
	display: flex;
}

.list-box {
	height: 80px;
	margin-top: 16px;
	border-radius: 10px;
	margin-bottom: 40px;
	padding-top: 20px;
}

.list-box>div {
	padding: 1% 7%;
	margin-right: 20px;
	margin-left: 20px;
	font-size: 14px;
	opacity: 0.7;
	float: left;
}

.list-box2 {
	height: 80px;
	margin-top: 16px;
	border-radius: 10px;
	margin-bottom: 40px;
	padding-top: 20px;
}

.list-box2>div {
	padding: 1% 7%;
	margin-right: 20px;
	margin-left: 20px;
	font-size: 14px;
	opacity: 0.7;
	float: left;
}

.item-list {
	height: 200px;
	text-align: center;
	line-height: 200px;
	margin-bottom: 40px;
	opacity: 0.5;
}

.image-wrapper {
	width: 110px;
	height: 110px;
	overflow: hidden;
	border-radius: 50%;
	background-color: yellow;
	margin-top: 17px;
	margin-left: 17px;
}

#profile-img {
	height: 100%;
	width: 100%;
	border-radius: 50%;
}

#profile-content {
	margin-left: 20px;
	margin-top: 35px;
	float: left;
	font-size: 12px;
	line-height: 20px;
}

.profile-btn {
	border: 1px solid #e3e3e3;
	background-color: #fff;
	border-radius: 10px;
	width: 100px;
	height: 35px;
	margin-top: 8px;
	padding-left: 14px;
	font-size: 12px;
	color: black;
	cursor: pointer;
}

.profile-btn:hover {
	background-color: #f3f3f3;
}

.box2>div {
	margin-left: 45px;
}
</style>


</head>
<body>
<form action="">
<input type="hidden" name="user_num" value="${user_num }">
<c:set var="loginOk" value="${sessionScope.loginOk}"></c:set>

<div class="wrapper">
    <div class="side">
        <div class="side-title">마이 페이지</div>
        <div id="side-top">
            <div class="sub-title">쇼핑 정보</div>
            <div class="sub-menu">
                <div>구매 내역</div>
                <div>판매 내역</div>
                <div>보관 판매</div>
                <div>관심 상품</div>
            </div>
        </div>
        <div id="side-bottom">
            <div class="sub-title">내 정보</div>
            <div class="sub-menu">
                <div>프로필 정보</div>
                <div>주소록</div>
                <div>결제 정보</div>
                <div>판매 정산 계좌</div>
                <div>현금영수증 정보</div>
                <div>포인트</div>
            </div>
        </div>
    </div>

    <div class="container">
        <div id="profile-info">
            <div class="image-wrapper">
            <c:if test="${dto.user_photo==null }"><img src="../../img/profile.png" id="profile-img"></c:if>
            <c:if test="${dto.user_photo!=null }"><img src="../../save/${dto.user_photo }" id="profile-img"></c:if>
            <!-- 나중에 사진 있을 경우 해당 사진으로 값 넣어주기..일단 최고심으로 대체 admin.jsp가 대체 어딨는지 몰겠움   -->
            </div>
            <div id="profile-content"><b style="font-size: 16px; opacity: 1">${dto.user_name }</b>
                <br><span style="opacity: 0.5">${dto.user_email }</span>
                <br><input type="button" class="profile-btn" value="프로필 수정" align="left" onclick="location.href='/user/myProfile'">
                <input type="button" class="profile-btn" value="내 스타일" align="left" style="width: 80px " onclick="location.href='/style/mystyle'">
            </div>
        </div>f
        <div style="clear: left"></div>
        <span style="font-size: 16px; font-weight: bold">판매 내역</span>
        <div class="list-box" style="background-color: #f2f9f6;">
            <div align="center" style="margin-left: 45px; cursor: pointer;" id="total">전체<br><b style="color: green">0</b></div>
            <div align="center" style="border-left: 2px solid #e3e3e3; margin-left: 45px; cursor: default;">입찰 중<br>0</div>
            <div align="center" style="margin-left: 30px; cursor: default;">진행 중<br>0</div>
            <div align="center" style="margin-left: 30px; cursor: default;">종료<br>0</div>
        </div>

        <span style="font-size: 16px; font-weight: bold">구매 내역</span>
        <div class="list-box box2" style="background-color: rgb(254, 247, 246);">
            <div align="center" style="margin-left: 45px; cursor: pointer;" id="buyTotal">전체<br><b style="color: red">${bidSize+ingSize+endSize}</b></div>
            <div align="center" style="border-left: 2px solid #e3e3e3; cursor: default; ">입찰 중<br>${bidSize}</div>
            <div align="center" style="margin-left: 30px; cursor: default;">진행 중<br>${ingSize}</div>
            <div align="center" style="margin-left: 30px; cursor: default;">종료<br>${endSize}</div>
        </div>
        


    </div>

    <div style="clear: left"></div>
</div>

</form>

<script type="text/javascript">
$("#total").click(function(){
	location.href="/user/sellHistory";
});
$("#buyTotal").click(function(){
    location.href="/user/buyHistory";
});

</script>
</body>
</html>

