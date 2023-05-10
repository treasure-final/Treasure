<%@ page import="java.util.List" %>
<%@ page import="boot.mvc.item.ItemDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="boot.mvc.item.ItemService" %>
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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/assets/js/data.js"></script>
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
  margin-top: 5px;
  font-size: 18px;
  float: left;
}

#infostate {
  position: absolute;
  right: 30px;
  margin-right: 40px;
  top: 35px;
}

#searchinput {
  float: right;
  margin-top: 5px;
  margin-right: 40px;
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
  font-size: 14px;
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
<%--<%--%>
<%--	ItemService itemService = new ItemService();--%>
<%--	List<ItemDto> itemKorList=itemService.getItemKorName();--%>
<%--%>--%>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />

	<div class="header">

		<div id="title">
		
		<div id="logoimg">
			<a href="#"> <img src="../assets/images/mainlogo.png"
				style="width: 200px;" >
			</a>
		</div>
		
		<div id="menulist">
				<ul class="tul">
					<li style="margin-right: 40px;"><a href="#"><b>Home</b></a></li>
					<li style="margin-right: 40px;"><a href="#">Style</a></li>
					<li style="margin-right: 40px;"><a href="/sell/sellSize">Shop</a></li>
					<li style="margin-right: 40px;"><a href="#">My</a></li>
				</ul>
			</div>

			<div id="infostate">
				<a href="/user/loginForm">로그인</a> &nbsp; <a href="#">고객센터</a>
			</div>


			<div id="searchinput" >
			<img alt="" src="../assets/images/searchicon.png" style="width:  25px; z-index: 3; margin-left: 10px; position: absolute; margin-top: 10px;">
				<input type="text" id="search" autocomplete="off" placeholder="상품 검색"  style=" z-index: 4; ">
				<!-- 자동완성 단어 리스트 -->
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(function () {	//화면 로딩후 시작
			$("#search").autocomplete({  //오토 컴플릿트 시작
				source: List,	// source는 data.js파일 내부의 List 배열
				focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌
					return false;
				},
				minLength: 1,// 최소 글자수
				delay: 100,	//autocomplete 딜레이 시간(ms)
				//disabled: true, //자동완성 기능 끄기
			});
		});
	</script>
</body>

</html>