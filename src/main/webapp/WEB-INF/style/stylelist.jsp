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
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GmarketSansMedium';
}

#wrtiemystyle {
	float: left;
	height: 
	10px;
	margin-top: 35px;
}

#wrtiemystyle>a>b {
	cursor: pointer;
}

#sortstyle>a>b {
	cursor: pointer;
}

#sortstyle {
	float: right;
	margin-top: 35px;
	height: 10px;
}

.stylemain {
	border: 0px solid black;
	width: 1200px;
	height: 2000px;
	margin-top: 30px;
}

#stylepho {
	width: 220px;
	height: 200px;
	position: relative;
}

#styledata {
	width: 230px;;
	height: 100px;
	margin-top: 300px;
	position: absolute;
	font-size: 5px;
	border: 0px solid blue;
}

.stylebox {
	margin-top: 45px;
	border: 0px solid green;
	width: 230px;
	height: 400px;
	display: inline-flex;
	margin-right: 30px; /*아이템별 간격  */
	margin-top: 45px;
	margin-left: 34px;
	margin-bottom: 70px;
}

#profile-img {
	width: 20px;
	height: 20px;
}

#stylecontent {
	margin-bottom: 100px;
}

#profile {
	width: 230px;
	height: 30px;
	border: 0px solid gold;
	margin-top: 10px;
	margin-left: 3px;
}

#stylecontent a {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 230px;
	height: 20px;
	display: inline-block;
}

a {
	cursor: pointer;
}
}
</style>


</head>

<body>
	<c:set var="loginOk" value="${sessionScope.loginOk}"></c:set>

	<div>
		<div id="wrtiemystyle">
			<a href="#"><b>인기순</b></a> <a href="/style/stylelist"><b>최신순</b></a>
		</div>

		<div id="sortstyle">

			<c:if test="${not empty loginOk}">
				<a href="/style/writestyleform">글쓰기</a>
			</c:if>

			<c:if test="${empty loginOk}">
				<a id="nologinwrite">글쓰기</a>
			</c:if>
		</div>
	</div>

	<br>

	<div class="stylemain">
		<c:forEach var="b" items="${list }" varStatus="i">

			<div class="stylebox">

				<div id="stylepho">
					<img alt="" src="../img/${b.board_image } "
						onclick="location.href='#'"
						style="width: 230px; height: 300px; border-radius: 10%; cursor: pointer;">
				</div>

				<div id="styledata">
					<div id="profile">
				<c:if test="${b.myphoto==null }"><img src="../../img/profile.png" id="profile-img"></c:if>
           		<c:if test="${b.myphoto!=null }"><img src="../../save/${b.myphoto }" id="profile-img"></c:if>
						
						
						<a href="#" ><b style="width: 20px; cursor: pointer;  height: 5px; margin-left: 8px;"> ${b.name}</b></a>
						
						<img alt=" " src="../img/style_image/heart.png" onclick="#"
							style="float: right; width: 15px; margin-right: 15px; margin-top: 5px; color: gray; cursor: pointer;">
					</div>

					<div id="stylecontent">
						<a>${b.board_subject } </a> <br> <a>${b.board_content }</a> <br>
					</div>
						
				</div>








			</div>




		</c:forEach>
	</div>





	<script type="text/javascript">
   document.getElementById("nologinwrite").addEventListener("click", function() {
      alert("로그인 후 이용 가능합니다");
      window.location.href = "/user/loginForm";
   });
</script>

</body>

</html>