<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet"
>
<title></title>
<style type="text/css">
#title {
	width: 100%;
}

#logoimg {
	margin-top: 20px;
	margin-left: 30px;
	width: 400px;
}

#menulist {
	margin-top: 28.5px;
	margin-left: 40px; font-size : 18px;
	float: left;
	font-size: 18px;
}

#infostate {
	position: absolute;
	right:-1.5px;
	margin-right: 40px;
	top: 37.5px;
}

#searchinput {
	float: right;
	margin-top: 12.5px;
	margin-right: 8.5px;
	font-size: 10.5pt
}

li {
	float: left;
	list-style: none;
}

ul {
	list-style: none;
}

input {
	background-color: #dfebda;
	height: 46px;
	border-radius: 23px;
	border: none;
	color: #666;
	font-size: 10px;
	padding: 0px 15px 0px 45px;
}

a {
	color: black;
	text-decoration: none !important;
}

a:hover {
	color: #747f55;
}
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<div class="header">
		<div id="title">
			<div id="logoimg">
				<a href="#">
					<img src="../assets/images/mainlogo.png" style="width: 200px;">
				</a>
			</div>
			<div id="menulist">
				<ul class="tul">
					<li style="margin-right: 40px;">
						<a href="#">
							<b>Home</b>
						</a>
					</li>
					<li style="margin-right: 40px;">
						<a href="#">Style</a>
					</li>
					<li style="margin-right: 40px;">
						<a href="/item/detail">Sangsae</a>
					</li>
					<li style="margin-right: 40px;">
						<a href="/style/styleDetail">Style</a>
					</li>
					<li style="margin-right: 40px;">
						<a href="/sell/sellSize">Shop</a>
					</li>
					<li style="margin-right: 40px;">
						<a href="/user/myPage">My</a>
					</li>
				</ul>
			</div>
			<div id="infostate">
				<c:set var="loginOk" value="${sessionScope.loginOk}"></c:set>
				<c:if test="${empty loginOk}">
					<a href="/user/loginForm">로그인</a>
				</c:if>
				<c:if test="${not empty loginOk}">
					<a href="/user/logout">로그아웃</a>
				</c:if>
				&nbsp;
				<a href="#">고객센터</a>
			</div>
			<div id="searchinput">
				<img alt="" src="../assets/images/searchicon.png"
					style="width: 24.5px; z-index: 3; margin-left: 11px; position: absolute; margin-top: 10px;"
				>
				<input type="text" placeholder="상품 검색" onkeypress="handle" style="z-index: 4; width: 244px;">
			</div>
		</div>
	</div>
</body>
</html>