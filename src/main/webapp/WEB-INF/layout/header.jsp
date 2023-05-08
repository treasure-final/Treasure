<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title></title>



<style type="text/css">
#title {
	width: 100%;
	text-align: center;
}






li {
	float: left;
	 padding: 0;
  margin: 0;
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
	font-size: 14px;
	padding: 0px 15px 0px 45px;
}
a {
  color: #747f55;
  text-decoration: none !important;
}
a:hover {
color: black;

}

 


 
</style>

</head>

<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />

	<div class="header">


		<div id="title">
			<a href="#"> <img src="assets/images/mainlogo.png"
				style="width: 200px; margin-top: 20px; margin-right: 120px;">
			</a>




			<div style="float: right; width: 200px;" id="login">
				<a href="#">로그인</a> &nbsp; <a href="#" style="margin-right: 20px;">고객센터</a>
			</div>




			<div style="margin-top: 40px; font-size: 20px; float: left;">
				<ul>
					<li style="margin-right: 40px;"><a href="#"><b>Home</b></a></li>
					<li style="margin-right: 40px;"><a href="#">Style</a></li>
					<li style="margin-right: 40px;"><a href="#">Shop</a></li>
					<li style="margin-right: 40px;"><a href="#">My</a></li>
				</ul>
			</div>

			<div style="margin-top: 50px; float: right; width: 60px;  ">
			<img alt="" src="assets/images/searchicon.png" style="width:  25px; z-index: 3; margin-left: 10px; position: absolute; margin-top: 10px;">
				<input type="text" placeholder="상품 검색" onkeypress="handle " style=" z-index: 4; ">
				
			</div>
			



		</div>
	</div>
</body>

</html>