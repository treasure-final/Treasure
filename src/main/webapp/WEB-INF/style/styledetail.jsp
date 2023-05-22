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

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
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
	width: 50%;
	height: 600px;
	border-radius: 10px;
	border: 1px solid black;
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

.profile {
	margin-left: 10px;
	margin-top: 10px;
}

.time {
	margin-left: 10px
}
</style>
</head>
<body>
	<div id="content">
		<c:forEach items="${DetailList }" var="Bdto">
			<div class="post">
				<div class="profile" style="">
					<img src="/save/${Bdto.user_photo }" alt="프로필 사진"
						style="border-radius: 10px; max-width: 20px; max-height: 20px"
					>
					<span class="nickname">${Bdto.user_name }</span>
				</div>
				<p class="time" style="color: gray">
					<fmt:parseDate var="dateFormatter" value="${Bdto.board_writeday}"
						pattern="yyyy-MM-dd'T'HH:mm:ss"
					/>
					<script>
						var formattedDate = new Date("${Bdto.board_writeday}");
						var relativeTime = formatRelativeTime(formattedDate);
						document.write(relativeTime);

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
					</script>
				</p>
			</div>
			<!-- 초기 콘텐츠 -->
			<div class="slideshow-container" style="width: 80%; margin-left: 500px">
				<div class="all">
					<div class="mySlides fade">
						<img src="../assets/images/1.png" style="width: 100%">
					</div>
					<!-- <div class="mySlides fade">
					<img src="../assets/images/2.png" style="width: 100%">
				</div>
				<div class="mySlides fade">
					<img src="../assets/images/3.png" style="width: 100%">
				</div> -->
					<a class="prev" onclick="plusSlides(-1)">❮</a>
					<a class="next" onclick="plusSlides(1)">❯</a>
				</div>
			</div>
			<br>
		</c:forEach>
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
			let dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			/* dots[slideIndex - 1].className += " active"; */
		}
		$(document).ready(function() {
			var page = 1;

			// 스크롤 이벤트 감지
			$('#content').scroll(function() {
				if ($('#content').scrollTop() >= ($('#content')[0].scrollHeight - $('#content').height())) {
					loadMoreData();
				}
			});

			function loadMoreData() {
				page++;

				$.ajax({
					url : '/load-more-data',
					type : 'GET',
					data : {
						page : page
					},
					beforeSend : function() {
						// 로딩 스피너 표시 등의 처리
					},
					success : function(response) {
						// 서버로부터 받은 데이터 처리
						var data = response.data;
						var html = '';

						for (var i = 0; i < data.length; i++) {
							html += '<div class="item">' + data[i] + '</div>';
						}

						$('#content').append(html);
					},
					complete : function() {
						// 로딩 스피너 등의 처리 해제
					}
				});
			}
		});
	</script>
</body>
</html>