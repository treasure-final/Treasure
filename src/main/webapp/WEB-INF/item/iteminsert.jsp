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
<title>Treasure</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
	integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"
/>
<script type="text/javascript">
	window.onload = function() {
		today = new Date();
		today = today.toISOString().slice(0, 10);
		bir = document.getElementById("today");
		bir.value = today;
	}
</script>
<!-- Additional CSS Files -->
<style type="text/css">
@font-face {
	font-family: "GmarketSansMedium";
	src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff") format("woff");
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: "GmarketSansMedium";
}

div.all {
	margin-top: 100px;
	width: 70%;
	height: 70%;
	margin-left: 200px;
}

th>input[type=text] {
	width: 100%;
	text-align: center;
	padding: 0px;
}

th>input[type=file] {
	width: 400px;
	height: 400px;
	text-align: center;
	vertical-align: middle;
	padding: 0px;
}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"
>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="all">
		<table class="table table-bordered" style="width: 100%">
			<tr>
				<th rowspan="9" style="width: 50%; height: 50%">
					<label for="file">
						<span class="glyphicon glyphicon-upload" style="font-size: 60pt; position: relative; top: 200px;left: 230px"></span>
					</label>
					<input type="file" id="file" name="file" style="display: none;">
				</th>
			</tr>
			<tr>
				<th>브랜드명</th>
				<th>
					<input type="text" class="">
				</th>
			</tr>
			<tr>
				<th>카테고리</th>
				<th>
					<input type="text" class="">
				</th>
			</tr>
			<tr>
				<th>한글명</th>
				<th>
					<input type="text" class="">
				</th>
			</tr>
			<tr>
				<th>영어</th>
				<th>
					<input type="text" class="">
				</th>
			</tr>
			<tr>
				<th>모델번호</th>
				<th>
					<input type="text" class="">
				</th>
			</tr>
			<tr>
				<th>출시일</th>
				<th>
					<input type="date" id="today" style="width: 100%; text-align: center; padding-right: 30px">
				</th>
			</tr>
			<tr>
				<th>컬러</th>
				<th>
					<input type="text" class="">
				</th>
			</tr>
			<tr>
				<th>발매가</th>
				<th>
					<input type="text" class="">
				</th>
			</tr>
		</table>
	</div>
</body>
</html>