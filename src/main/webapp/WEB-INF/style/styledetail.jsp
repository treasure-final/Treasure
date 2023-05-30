<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet"
>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
	integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"
/>
<style type="text/css">
@font-face {
	font-family: "GmarketSansMedium";
	src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff") format("woff");
	font-weight: normal;
	font-style: normal;
}

div.main {
	font-family: "GmarketSansMedium";
	font-size: 13px;
	padding: 0;
	margin: 0;
	border: none;
	color: black;
}

* {
	font-family: "GmarketSansMedium";
	box-sizing: border-box
}

body {
	font-family: Verdana, sans-serif;
	margin: 0
}

.mySlides {
	display: none
}

div>img {
	vertical-align: middle;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding-right: 510px;
	padding-left: 10px;
	margin-top: -22px;
	color: black;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

.active, .dot:hover {
	background-color: white
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	animation-name: fade;
	animation-duration: 1.5s;
}

@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}

.like {
	width: 40%;
	text-align: left;
	margin-left: 450px
}

.sangpumtag {
	border: 1px solid black;
	width: 40%;
	height: 120px;
	text-align: left;
	margin-left: 450px
}

#content {
	height: 100%;
}

div.all {
	max-width: 50%;
	max-height: 100%;
	border-radius: 10px;
}
/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
}

.post {
	width: 33%;
	border-radius: 10px;
	margin-top: 100px;
	margin-left: 500px;
}

.time {
	vertical-align: bottom;
	font-weight: normal;
	font-size: 10px
}

.time {
	vertical-align: bottom;
	font-weight: normal;
}

.comment, .board_content, form {
	margin-left: 500px;
	margin-top: 10px;
}

.board_like {
	margin-left: 500px;
	margin-top: 10px;
}

.commentspace {
	margin-left: 500px;
}

.nickname {
	vertical-align: top;
}

.styletable {
	text-align: left;
}

.commentform {
	width: 50%;
}

#comment_submit, #nologinwrite {
	width: 5%;
	background-color: white;
	padding: 0px;
}

.table_comment_content {
	font-weight: normal;
	text-align: left;
	width: 500px
}

.table_comment_nickname {
	font-weight: bold;
	text-align: left;
	width: 100px
}

.table_comment_writeday {
	text-align: left;
	font-weight: normal;
	color: gray;
}

.table_comment_update {
	text-align: right;
	width: 60px
}

.table_comment_delete {
	text-align: right;
	width: 60px
}

.span_comment_divall {
	display: table;
}

.table-all {
	width: 500px;
}
</style>
</head>
<body>
	<c:set var="loginOk" value="${sessionScope.loginOk}" />
	<div id="content">
		<input type="hidden" value="${bdto.board_id }" class="board_id">
		<c:forEach items="${DetailList }" var="Bdto">
			<input type="hidden" value="${Bdto.board_id }" class="board_id">
			<div class="post">
				<div class="profile">
					<table class="styletable">
						<tr>
							<th rowspan="2">
								<img src="/save/${Bdto.user_photo }" alt="프로필 사진"
									style="border-radius: 100px; max-width: 35px; max-height: 35px"
								>
							</th>
							<th width="60px" align="center">
								<span class="nickname">${Bdto.user_name }</span>
							</th>
						</tr>
						<tr>
							<th>
								<span class="time" style="color: gray">
									&nbsp;
									<fmt:parseDate var="dateFormatter" value="${Bdto.board_writeday}"
										pattern="yyyy-MM-dd'T'HH:mm:ss"
									/>
									<script type="text/javascript">
                              function formatRelativeTime(date) {
								  var now = new Date();
								  var diff = Math.floor((now - date) / 1000);

								  if (diff < 60) {
									  return diff + '초 전';
								  } else if (diff < 60 * 60) {
									  var minutes = Math.floor(diff / 60);
									  return minutes + '분 전';
								  } else if (diff < 60 * 60 * 24) {
									  var hours = Math.floor(diff / (60 * 60));
									  return hours + '시간 전';
								  } else {
									  var days = Math.floor(diff / (60 * 60 * 24));
									  return days + '일 전';
								  }
							  }
							  var formattedDate = new Date("${Bdto.board_writeday}");
							  var relativeTime = formatRelativeTime(formattedDate);
							  document.write(relativeTime);
                           </script>
								</span>
							</th>
						</tr>
					</table>
				</div>
			</div>
			<!-- 초기 콘텐츠 -->
			<div class="slideshow-container" style="width: 80%; margin-left: 500px">
				<div class="all">
					<div class="mySlides fade">
						<img src="../../img/style_image/${bdto.board_image }"
							style="width: 100%; height: 100%; border-radius: 10px"
						>
					</div>
					<a class="prev" onclick="plusSlides(-1)">❮</a>
					<a class="next" onclick="plusSlides(1)">❯</a>
				</div>
			</div>
			<div class="container">
				<div class="heart"></div>
			</div>
			<c:if test="${bdto.boardLikeCheck eq 1}">
				<div class="board_like active" board_id="${bdto.board_id}">
					<img src="../img/style_image/redheart.png" alt="찜하기" style="width: 15px;">
				</div>
			</c:if>
			<c:if test="${bdto.boardLikeCheck ne 1}">
				<div class="board_like" board_id="${bdto.board_id}">
					<img alt=" " src="../img/style_image/heart.png"
						style="width: 30px; margin-right: 15px; margin-top: 5px; color: gray; cursor: pointer;"
					>
				</div>
			</c:if>
			<div style="margin-left: 500px; margin-top: 10px">좋아요 몇개</div>
			<div class="board_content">${Bdto.board_content }</div>
			<br>
			<hr width="35%">
			<div class="comment" id="comment_${Bdto.board_id}"></div>
			<div>
				<%--			댓글입력폼--%>
				<form id="comment-form">
					<input id="comment_content${Bdto.board_id}" type="text">
					<c:if test="${not empty loginOk}">
						<button class="comment_submit" type="button" value="${Bdto.board_id}">전송${Bdto.board_id}
						
					</c:if>
					<c:if test="${empty loginOk}">
						<input id="nologinwrite" type="button" value="작성" style="padding: 10px 30px">
					</c:if>
				</form>
				<%--			댓글입력폼--%>
			</div>
		</c:forEach>
		<script type="text/javascript">
		$(document).ready(function() {
			$(".board_id").each(function () {
				var board_id = $(this).val();
				loadComments(board_id);
			});

			//좋아요 부분
			var likeBtn = $('.board_like');

			likeBtn.click(function () {
				if (likeBtn.hasClass('active')) {
					$(this).removeClass('active')
					$(this).find('img').attr({
						'src': '../img/style_image/heart.png',
						// alt:"찜하기"
					});
					var board_id = $(this).attr("board_id");
					$.ajax({
						url: "/style/deleteLike",
						data: {"board_id": board_id},
						type: "get",
						success: function () {
							// alert("찜하기 삭제");
						}
					});

				} else {
					$(this).addClass('active')
					$(this).find('img').attr({
						'src': '../img/style_image/redheart.png',
						// alt:'찜하기 완료'
					})
					var board_id = $(this).attr("board_id");
					$.ajax({
						url: "/style/insertLike",
						data: {"board_id": board_id},
						type: "get",
						success: function () {
							// alert("찜하기 완료");
						}
					});
				}
			});

			function loadComments(board_id) {

				$.ajax({
					url: "/style/comments/" + board_id,
					type: "GET",
					dataType: "json",
					success: function (response) {
						// list<Map>
						var comments = response; // 받은 댓글 목록 데이터
						const json = JSON.stringify(comments);
						var commentHtml = '';

						// 각 댓글 데이터를 순회하며 HTML로 변환하여 commentHtml에 추가
						for (var i = 0; i < comments.length; i++) {
							commentHtml += '<table style="width:500px">';
							commentHtml += '<tr align="left">';
							commentHtml += '<th class="table_comment_nickname" rowspan="2" align="left"><img src="../../save/' + comments[i].user_photo + '" style="border-radius: 100px; ;max-width: 35px; max-height: 35px"></th>';
							commentHtml += '<th class="table_comment_nickname">' + comments[i].user_nickname + '</th>';
							commentHtml += '<th class="table_comment_content" rowspan="2">' + comments[i].comment_content + '</th>';
							commentHtml += '<tr>';
							commentHtml += '<th class="table_comment_writeday"><span>' + formatRelativeTime(new Date(comments[i].comment_writeday)) + '</span></th>';
							commentHtml += '<th class="table_comment_update" rowspan="2"><span><button>수정</button></span></th>';
							commentHtml += '<th class="table_comment_delete" rowspan="2" comment_id="' + json.com + '" onclick="deleteComment()"><span><button>삭제</button></span></th>';
							commentHtml += '</tr>';
							commentHtml += '</tr>';
							commentHtml += '</table>';
						}

						// 댓글 목록 영역에 commentHtml을 추가
						$("#comment_" + board_id).html(commentHtml);
					},
					error: function (request, status, error) {
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
			}
// AJAX를 사용하여 댓글 양식 제출 
$(".comment_submit").click(function () { 
	var board_id =$(this).val(); 
	var content = "#comment_content"+board_id; 
	var comment_content = $(content).val();
	
	$.ajax({ 
		url: "/comment/insert", 
		type: "POST", 
		data: { 
			"board_id": board_id, 
			"comment_content":comment_content }, 
			success: function (res) { 
				// 댓글 제출 후 댓글 섹션 새로고침 및 입력 필드 초기화 $(content).val("");
	location.reload(); }, 
	error: function (request, status, error) { console.log("code:" +
	request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error); } }); }); });
	function deleteComment() { var comment_id=$(this).attr("comment_id"); alert(comment_id); $.ajax({
	url:"/comment/deletecomment", data:{"comment_id":comment_id}, type:"get", 
	success:function() {
	alert("삭제"); } }); }
	</script>
		<!-- 점 -->
		<!-- <div style="text-align: center">
     <span class="dot" onclick="currentSlide(1)"></span>
     <span class="dot" onclick="currentSlide(2)"></span>
     <span class="dot" onclick="currentSlide(3)"></span>
  </div> -->
	</div>
	<script>
	let slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		let i;
		let slides = document.getElementsByClassName("mySlides");
		/* let dots = document.getElementsByClassName("dot"); */
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		/*    for (i = 0; i < dots.length; i++) {
              dots[i].className = dots[i].className.replace(" active", "");
           } */
		slides[slideIndex - 1].style.display = "block";
		/* dots[slideIndex - 1].className += " active"; */

	}
	$('.heart').on('click', function() {
		el = $(this);
		if (el.hasClass('liked') ) {
			el.removeClass('liked');
			return
		} else {
			el.addClass('liking');
			el.one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function (e) {
				el.addClass('liked').removeClass('liking');
			});
		}
	});
	document.getElementById("nologinwrite").addEventListener("click", function() {
		alert("로그인 후 이용 가능합니다");
		window.location.href = "/user/loginForm";
	});
</script>
</body>
</html>