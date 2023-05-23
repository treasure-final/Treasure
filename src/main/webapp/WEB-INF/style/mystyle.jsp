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
/* �۲� ����*/
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

profile-img {
	width: 100px;
	height: 100px;
	
}
#top{
text-align: center;
}
.mystyletot{
width: 1200px;
}
</style>


</head>

<body>
	<c:set var="loginOk" value="${sessionScope.loginOk}"></c:set>
	<div class="mystyletot">
		<div id="top">
			<c:if test="${b.myphoto==null }">
				<img src="../../img/profile.png" id="profile-img">
			</c:if>
			<c:if test="${b.myphoto!=null }">
				<img src="../../save/${b.myphoto }" id="profile-img">
			</c:if>
			
			<br>
			<b> ${dto.user_name}</b> 
		</div>


		<div>
			<b>게시글 </b>
		</div>
		
		<div>
		
		
		</div>





	</div>

</body>

</html>