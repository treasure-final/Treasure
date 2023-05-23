<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<title></title>
<style type="text/css">
@font-face {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GmarketSansMedium';
}

#wrtiemystyle {
	float: left;
	background-color: green;
}

#wrtiemystyle>a>b {
	cursor: pointer;
}

#sortstyle>a>b {
	cursor: pointer;
}

#sortstyle {
	float: right;
	background-color: yellow;
}

.styleview {
	margin-top: 2%;
	width: 100%;
}

.stylemain {
	border: 1px solid black;
	width: 80%;
	margin: 0 auto;
	height: 2000px;
}

#stylepho {
	width: 220px;
	height: 200px;
	position: relative;
}

#styledata {
	width: 200px;
	height: 180px;
	margin-top: 10%;
	position: absolute;
	margin-left: 10px;
	font-size: 5px;
}

.stylebox {
	margin-top: 45px;
	border: 1px solid green;
	width: 190px;
	height: 250px;
	display: inline-flex;
	margin-right: 45px; /*아이템별 간격  */
	margin-left: 5%;
}
</style>
</head>
<body>
	<div class="styleview">
		<div id="wrtiemystyle">
			<a>
				<b>인기순</b>
			</a>
			<a>
				<b>최신순</b>
			</a>
		</div>
		<div id="sortstyle">
			<a href="/style/writestyleform">
				<b>글쓰기</b>
			</a>
		</div>
		<br>
		<div class="stylemain">
			<c:forEach items="${list }" var="a">
				<div class="stylebox">
					<div id="stylepho" onclick="location.href='/style/detail?board_id=${a.board_id}'">
						<!-- 클릭 이벤트에 scrollToDetail 함수 호출 추가 -->
						<img alt="스타일사진 나오는곳" src="../img/item_image/${a.board_image}"
							style="width: 200px; height: 150px;"
						>
					</div>
					<span id="styledata">
						<img alt="회원프로필사진" src="">
						<br>
						회원닉네임
						<img alt="좋아요표시" src="">
					</span>
				</div>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
		function scrollToDetail(board_id) {
			// 상세 내용을 보여주는 페이지로 이동
			window.location.href = "/style/detail?board_id=" + board_id;
		}
	</script>
</body>
</html>
