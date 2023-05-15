<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

	<head>
	
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	    rel="stylesheet">
	
	  <title>Treasure</title>
	
	  <!-- Bootstrap core CSS -->
	  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	
	  <!-- Additional CSS Files -->
	  <link rel="stylesheet" href="assets/css/fontawesome.css">
	  <link rel="stylesheet" href="assets/css/template.css">
	  <link rel="stylesheet" href="assets/css/owl.css">
	  <link rel="stylesheet" href="assets/css/animate.css">
	  <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

	<link rel="stylesheet" href="assets/css/detail.css">
</head>

<body>

    <div class="container mb-5">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-content" style="border: 0px solid red; padding: 1rem;">

                    <div class="row">
                        <div class="col-lg-7" style="border: 0px solid blue; padding: 0; padding-left: 0.7rem;">

                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel"
                                style="border: 0px solid purple;">

                                <div class="featured-games header-text" style="border: 0px solid green;  width: 100%;">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="\assets\images\details-02.jpg" class="d-block w-100"
                                                style="border-radius: 3%;" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="\assets\images\details-01.jpg" class="d-block w-100"
                                                style="border-radius: 3%;" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="\assets\images\details-03.jpg" class="d-block w-100"
                                                style="border-radius: 3%;" alt="...">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button"
                                        data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button"
                                        data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>

                            </div>
                        </div>


                        <div class="col-lg-5">
                            <div class="top-streamers detail-box"
                                style="padding: 0; padding-left: 0.8rem; padding-top: 0.8rem; border: 0px solid purple; overflow-y: scroll;">
                                <div class="heading-section mt-sm-3" style="border:0px solid purple;">
                                    <div style="margin-bottom: 0.5rem;">
                                        <span
                                            style="font-size: 1.5em; font-weight: 600; text-decoration: underline; border: 0px solid purple;">Nike</span><br>
                                    </div>
                                    <span style="font-size: 1.2em; font-weight: 600;">Nike x Peaceminusone Kwondo
                                        1
                                        Black and White</span><br>
                                    <span style="font-size: 1.1em; color: #666;">나이키 x 피스마이너스원 퀀도1 블랙 앤 화이트</span>
                                </div>

                                <hr>

                                <div class="d-flex pe-2" style="border: 0px solid purple;">
                                    <div class="heading-section col-5" style="border: 0px solid purple;">
                                        <div class="row mb-4">
                                            <span style="font-size: 1.1em; color: #666;">모델 번호</span>
                                            <span style="font-size: 1.2em; font-weight: 600;">DH2482-101</span>
                                        </div>

                                        <div class="row mb-4">
                                            <span style="font-size: 1.1em; color: #666;">출시일</span>
                                            <span style="font-size: 1.2em; font-weight: 500;">23/04/11</span>
                                        </div>

                                        <div class="row mb-4">
                                            <span style="font-size: 1.1em; color: #666;">컬러</span>
                                            <span style="font-size: 1.2em; font-weight: 500;">WHITE/BLACK</span>
                                        </div>

                                        <div class="row">
                                            <span style="font-size: 1.1em; color: #666;">발매가</span>
                                            <span style="font-size: 1.2em; font-weight: 500;">229,000원</span>
                                        </div>
                                    </div>

                                    <div class="col-7" style="border: 0px solid purple;">
                                        <div class="mb-4">
                                            <button type="button" class="btn btn-detail btn-lg w-100"
                                                style="height: 7vh;">구매</button>
                                        </div>
                                        <div>
                                            <button type="button" class="btn btn-outline-detail btn-lg w-100"
                                                style="height: 7vh;">판매</button>
                                        </div>
                                    </div>
                                </div>

                                <hr>

                                <div class="d-flex pe-2" style="border: 1px solid purple;">
                                    <div class="heading-section col-7" style="border: 1px solid red;">
                                        <span style="font-size: 1.1em; color: #666;">사이즈</span>
                                    </div>
                                    <span style="font-size: 1.1em;;"><b>모든 사이즈</b></span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

            <hr class="mb-5 mt-5">

            <div class="d-flex">
                <div class="col-11 align-self-center" style="border: 0px solid red;">
                    <span class="fs-4"><b>Nike</b>의 다른 상품</span>
                </div>
                <div class="col-1 align-self-center" style="border: 0px solid red;">
                    <span class="fs-5" style="float: right;">더보기<i class=" fa fa-chevron-right fs-5 ms-2"></i></span>
                </div>
            </div>

            <div class="mt-4 mb-lg-5" style="border: 1px solid gray; height: 40vh;"></div>

            <hr>

            <div class="d-flex mt-5">
                <div class="col-12 align-self-center" style="border: 0px solid red;">
                    <span class="fs-4"><b>스타일 12</b></span>
                </div>
            </div>

            <div class="mt-4 mb-lg-5" style="border: 1px solid gray; height: 80vh;"></div>

            <div class="col-lg-12 text-center" style="border: 0px solid red;">
                <button type="button" class="btn btn-outline-detail" style="width: 10%; height: 5vh;">더보기</button>
            </div>
        </div>
    </div>
    
	
	  <!-- Scripts -->
	  <!-- Bootstrap core JavaScript -->
	  <script src="vendor/jquery/jquery.min.js"></script>
	  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	
	  <script src="assets/js/isotope.min.js"></script>
	  <script src="assets/js/owl-carousel.js"></script>
	  <script src="assets/js/tabs.js"></script>
	  <script src="assets/js/popup.js"></script>
	  <script src="assets/js/custom.js"></script>
	
	
	</body>

</html>