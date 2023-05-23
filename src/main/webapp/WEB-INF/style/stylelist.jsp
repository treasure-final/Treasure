<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
>>>>>>> 4a6b9b8410cce1104f88b0ec4b45414c23028f99
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
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
=======

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
>>>>>>> 4a6b9b8410cce1104f88b0ec4b45414c23028f99
}

#stylepho {
   width: 220px;
   height: 200px;
   position: relative;
}

#styledata {
<<<<<<< HEAD
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
					<div id="stylepho" onclick="scrollToDetail(${a.board_id})">
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
=======
   width: 230px;;
   height: 90px;
   margin-top: 295px;
   position: absolute;
   font-size: 5px;
   border: 0px solid blue;
   margin-left: 3px;
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
   float: left;
   
}

#stylecontent {
   margin-bottom: 120px;
   width: 230px;
   height: 50px;
   border: 0px solid teal;
}

#profile {
   width: 225px;
   height: 25px;
   border: 0px solid gold;
   margin-top: 10px;
   margin-left: 1px;
}
/*몇글자 이상 오바되면 '...으로 생략'  */
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
               <img alt="" src="../../img/style_image/${b.dimage }"
                  onclick="location.href='#'"
                  style="width: 230px; height: 300px; border-radius: 10%; cursor: pointer;">
            </div>

            <div id="styledata">
               <div id="profile">
               
            <c:if test="${b.myphoto==null }"><img src="../../img/profile.png" id="profile-img"></c:if>
                 <c:if test="${b.myphoto!=null }"><img src="../../save/${b.myphoto }" id="profile-img"></c:if>
                 	
                 	
                    <a href="#" ><b style="width: 30px;  height: 20px; cursor: pointer; margin-left: 8px; font-size: 8px; float: left; margin-top: 6px;"> ${b.name}</b></a>
                 
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
>>>>>>> 4a6b9b8410cce1104f88b0ec4b45414c23028f99
