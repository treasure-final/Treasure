<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;890;900&display=swap"
	rel="stylesheet"
>
<title>Treasure</title>
<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Additional CSS Files -->
<link rel="stylesheet" href="../assets/css/fontawesome.css">
<link rel="stylesheet" href="../assets/css/template.css">
<link rel="stylesheet" href="../assets/css/owl.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- <link rel="stylesheet" href="../assets/css/detail.css"> -->
<!--chart.js  -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"
></script>
<style>
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
}

.btn-detail-border:hover {
	border-color: #747f55;
	background-color: #747f55;
	color: #fff;
}

.btn-detail {
	--bs-btn-color: #fff;
	--bs-btn-bg: #747f55;
	--bs-btn-border-color: #747f55;
	--bs-btn-hover-color: #747f55;
	--bs-btn-hover-bg: #fff;
	--bs-btn-hover-border-color: #747f55;
	--bs-btn-focus-shadow-rgb: 49, 132, 253;
	--bs-btn-active-color: #fff;
	--bs-btn-active-bg: #747f55;
	--bs-btn-active-border-color: #747f55;
	--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	--bs-btn-disabled-color: #fff;
	--bs-btn-disabled-bg: #747f55;
	--bs-btn-disabled-border-color: #747f55;
	border-radius: 25px;
}

.btn-outline-detail {
	--bs-btn-color: #747f55;
	--bs-btn-border-color: #747f55;
	--bs-btn-hover-color: #fff;
	--bs-btn-hover-bg: #747f55;
	--bs-btn-hover-border-color: #747f55;
	--bs-btn-focus-shadow-rgb: 13, 110, 253;
	--bs-btn-active-color: #fff;
	--bs-btn-active-bg: #747f55;
	--bs-btn-active-border-color: #747f55;
	--bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
	--bs-btn-disabled-color: #747f55;
	--bs-btn-disabled-bg: transparent;
	--bs-btn-disabled-border-color: #747f55;
	--bs-gradient: none;
	border-radius: 25px;
}

.detail-box {
	-ms-overflow-style: none;
	/* IE and Edge */
	scrollbar-width: none;
	/* Firefox */
}

.detail-box::-webkit-scrollbar {
	display: none;
	/* Chrome, Safari, Opera*/
}

.item-detail {
	border-radius: 23px;
	background-color: #fff;
	padding: 30px;
}
</style>
</head>
<body>
	<div class="container mb-5">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content" style="padding: 1rem; height: 89vh;">
					<div class="row">
						<div class="col-lg-6" style="padding: 0; padding-left: 0.7rem; height: 89vh;">
							<div class="featured-games header-text" style="width: 100%; height: 85vh;">
								<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
									<div class="carousel-indicators" style="margin-bottom: 100px">
										<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0"
											class="active" aria-current="true" aria-label="Slide 1"
										></button>
										<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
											aria-label="Slide 2"
										></button>
										<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
											aria-label="Slide 3"
										></button>
									</div>
									<div class="carousel-inner">
										<div class="carousel-item active" data-bs-interval="4000" data-bs-pause="hover">
											<img src="/assets/images/1.png" class="d-block w-100" alt="..."
												style="position: relative; bottom: 50px"
											>
										</div>
										<div class="carousel-item" data-bs-interval="4000" data-bs-pause="hover">
											<img src="/assets/images/1.png" class="d-block w-100" alt="..."
												style="position: relative; bottom: 50px"
											>
											<div class="carousel-caption d-none d-md-block"></div>
										</div>
										<div class="carousel-item" data-bs-interval="4000" data-bs-pause="hover">
											<img src="/assets/images/1.png" class="d-block w-100" alt="..."
												style="position: relative; bottom: 50px"
											>
											<div class="carousel-caption d-none d-md-block"></div>
										</div>
									</div>
									<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
										data-bs-slide="prev"
									>
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
										data-bs-slide="next"
									>
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</div>
						</div>
						<div class="col-lg-6" style="height: 85vh;">
							<div style="height: 85vh;">
								<div class="item-detail detail-box"
									style="padding: 2rem; padding-left: 2rem; padding-top: 0.8rem; width: 100%; height: 85vh; overflow-y: scroll;"
								>
									<!-- 상품명 -->
									<div class="heading-section mt-sm-3">
										<div style="margin-bottom: 0.5rem;">
											<span style="font-size: 1.5em; font-weight: 600;">Nike</span>
											<span style="font-size: 1em; font-weight: 500; margin-left: 1rem; color: #666">|&nbsp;&nbsp;&nbsp;카테고리</span>
										</div>
										<span style="font-size: 1.2em; font-weight: 600;">Nike x Peaceminusone Kwondo 1
											Black and White</span>
										<br>
										<span style="font-size: 1.1em; color: #666;">나이키 x 피스마이너스원 퀀도1 블랙 앤 화이트</span>
									</div>
									<hr>
									<!-- 모델 번호, 출시일 ... -->
									<div class="d-flex pe-2">
										<div class="heading-section col-5">
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
										<div class="col-7">
											<div class="mb-4">

												<button type="button" class="btn btn-detail btn-lg w-100"
													style="height: 7vh; margin-top: 90px" onclick="location.href='/buy/select'"

												>구매</button>
											</div>
											<div>
																				
												<button type="button" class="btn btn-outline-detail btn-lg w-100" style="height: 7vh;"
													onclick="location.href='/sell/sellSize'"
												>판매</button>
											</div>
										</div>
									</div>
									<hr>
									<!-- 사이즈 -->
									<div class="d-flex pe-2 mb-4">
										<div class="heading-section col-9">
											<span style="font-size: 1.1em; color: #666;">사이즈</span>
										</div>
										<div class="heading-section col-3">
											<span style="font-size: 1.1em; float: right;">
												<b>모든 사이즈</b>
												&nbsp;
												<span class="fa fa-caret-down" data-bs-toggle="modal" data-bs-target="#sizeModal"></span>
											</span>
											<div class="modal" id="sizeModal" tabindex="-1">
												<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">사이즈</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body" style="padding-left: 2.1rem;">
															<div class="d-flex row col-12">
																<!-- 카테고리 별 사이즈 -->
																<div class="col-4 p-2">
																	<button type="button" class="btn btn-outline-detail btn-lg w-100"
																		style="height: 10vh;"
																	>
																		<span style="font-size: 0.9rem;">모든 사이즈</span>
																		<br>
																		<span style="font-size: 0.7rem;">가격</span>
																	</button>
																</div>
																<c:forEach var="size" begin="220" end="320" step="5">
																	<div class="col-4 p-2">
																		<button id="sizeselect" type="button" class="btn btn-outline-detail btn-lg w-100"
																			style="height: 10vh;"
																		>
																			<span style="font-size: 0.9rem; margin-bottom: 1rem;">${size}</span>
																			<br>
																			<span style="font-size: 0.7rem;">가격</span>
																		</button>
																	</div>
																</c:forEach>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 최근 거래가 -->
									<div class="d-flex pe-2 mb-5">
										<div class="heading-section col-9">
											<span style="font-size: 1.1em; color: #666;">최근 거래가</span>
										</div>
										<div class="heading-section col-3">
											<span style="font-size: 1.1em; float: right;">
												<b>224,000</b>
												<b>원</b>
											</span>
											<span style="font-size: 0.8em; float: right; color: green">
												<i class="fa fa-caret-down me-1"></i>
												<span>3,000</span>
												원 (
												<span>-1.3</span>
												%)
											</span>
										</div>
									</div>
									<!-- 시세 -->
									<div class="d-flex pe-2 mb-3">
										<div class="heading-section col-9">
											<span style="font-size: 1.3em; font-weight: 600;">시세</span>
											<br>
										</div>
										<div class="heading-section col-3">
											<!-- 카테고리 별 사이즈 -->
											<select class="form-select" id="exampleFormControlSelect1"
												aria-label="Default select example"
												style="border: 0px; font-size: 1em; float: right; color: #666;"
											>
												<option selected>모든 사이즈</option>
												<c:forEach var="size" begin="220" end="320" step="5">
													<option value="${size}">${size}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<!-- 시세 그래프 -->
									<div class="d-flex pe-2 mb-1">
										<div class="col-xl-12">
											<div class="nav-align-top mb-4">
												<ul class="nav nav-pills mb-3 nav-fill" role="tablist">
													<li class="nav-item">
														<button type="button" class="btn btn-detail active w-100" role="tab"
															data-bs-toggle="tab" data-bs-target="#onemonth" aria-controls="onemonth"
															aria-selected="true" style="border-radius: 20px 0px 0px 20px"
														>1개월</button>
													</li>
													<li class="nav-item">
														<button type="button" class="btn btn-detail w-100" role="tab" data-bs-toggle="tab"
															data-bs-target="#threemonth" aria-controls="threemonth" aria-selected="false"
															style="border-radius: 0px"
														>3개월</button>
													</li>
													<li class="nav-item">
														<button type="button" class="btn btn-detail w-100" role="tab" data-bs-toggle="tab"
															data-bs-target="#sixmonth" aria-controls="sixmonth" aria-selected="false"
															style="border-radius: 0px"
														>6개월</button>
													</li>
													<li class="nav-item">
														<button type="button" class="btn btn-detail w-100" role="tab" data-bs-toggle="tab"
															data-bs-target="#oneyear" aria-controls="oneyear" aria-selected="false"
															style="border-radius: 0px"
														>1년</button>
													</li>
													<li class="nav-item">
														<button type="button" class="btn btn-detail w-100" role="tab" data-bs-toggle="tab"
															data-bs-target="#all" aria-controls="all" aria-selected="false"
															style="border-radius: 0px 20px 20px 0px"
														>전체</button>
													</li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane fade show active" id="onemonth" role="tabpanel">
														<div style="width: 100%; height: 200px; margin-left: 100px">
															<canvas id="myChart1"></canvas>
														</div>
														<script>
															function addZero(i) {
																var rtn = i + 100;
																return rtn.toString().replace("1", "/");
															}
															var monthList = [];
															var monthData = [];
															var today = new Date();
															for (var i = 30; i >= 0; i--) {
																var dt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - i);
																var year = dt.getFullYear();
																var mon = addZero(dt.getMonth() + 1);
																var day = addZero(dt.getDate());
																var format = year + mon + day;
																monthList.push(format);
																monthData.push(Math.floor(Math.random() * 300000));
															}

															const ctx = document.getElementById('myChart1').getContext('2d');
															const myChart = new Chart(ctx, {
																type : 'line',
																data : {
																	labels : monthList,
																	datasets : [ {
																		data : monthData,
																		borderColor : 'rgba(255, 99, 132, 1)',
																		borderWidth : 1,
																		pointStyle : false
																	} ]
																},

																options : {
																	scales : {
																		x : {
																			ticks : {
																				maxRotation : 0,
																			},
																			display : false,
																			grid : {
																				display : false
																			}
																		},
																		y : {
																			position : 'right',// `axis` is determined by the position as `'y'`

																			grid : {
																				display : false
																			}
																		}

																	},
																	responsive : true,
																	plugins : {
																		legend : {
																			display : false
																		}

																	}
																}
															});
														</script>
													</div>
													<div class="tab-pane fade" id="threemonth" role="tabpanel">
														<div>
															<canvas id="myChart3"></canvas>
														</div>
														<script>
															function addZero(i) {
																var rtn = i + 100;
																return rtn.toString().replace("1", "/");
															}
															var monthList = [];
															var monthData = [];
															var today = new Date();
															for (var i = 90; i >= 0; i--) {
																var dt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - i);
																var year = dt.getFullYear();
																var mon = addZero(dt.getMonth() + 1);
																var day = addZero(dt.getDate());
																var format = year + mon + day;
																monthList.push(format);
																monthData.push(Math.floor(Math.random() * 300000));
															}

															const ctx3 = document.getElementById('myChart3').getContext('2d');
															const myChart3 = new Chart(ctx3, {
																type : 'line',
																data : {
																	labels : monthList,
																	datasets : [ {
																		data : monthData,
																		borderColor : 'rgba(255, 99, 132, 1)',
																		borderWidth : 1,
																		pointStyle : false
																	} ]
																},

																options : {
																	scales : {
																		x : {
																			ticks : {
																				maxRotation : 0,
																			},
																			display : false,
																			grid : {
																				display : false
																			}
																		},
																		y : {
																			position : 'right',// `axis` is determined by the position as `'y'`

																			grid : {
																				display : false
																			}
																		}

																	},
																	responsive : true,
																	plugins : {
																		legend : {
																			display : false
																		}

																	}
																}
															});
														</script>
													</div>
													<div class="tab-pane fade" id="sixmonth" role="tabpanel">
														<div>
															<canvas id="myChart6"></canvas>
														</div>
														<script>
															function addZero(i) {
																var rtn = i + 100;
																return rtn.toString().replace("1", "/");
															}
															var monthList = [];
															var monthData = [];
															var today = new Date();
															for (var i = 189; i >= 0; i--) {
																var dt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - i);
																var year = dt.getFullYear();
																var mon = addZero(dt.getMonth() + 1);
																var day = addZero(dt.getDate());
																var format = year + mon + day;
																monthList.push(format);
																monthData.push(Math.floor(Math.random() * 300000));
															}

															const ctx6 = document.getElementById('myChart6').getContext('2d');
															const myChart6 = new Chart(ctx6, {
																type : 'line',
																data : {
																	labels : monthList,
																	datasets : [ {
																		data : monthData,
																		borderColor : 'rgba(255, 99, 132, 1)',
																		borderWidth : 1,
																		pointStyle : false
																	} ]
																},

																options : {
																	scales : {
																		x : {
																			ticks : {
																				maxRotation : 0,
																			},
																			display : false,
																			grid : {
																				display : false
																			}
																		},
																		y : {
																			position : 'right',// `axis` is determined by the position as `'y'`

																			grid : {
																				display : false
																			}
																		}

																	},
																	responsive : true,
																	plugins : {
																		legend : {
																			display : false
																		}

																	}
																}
															});
														</script>
													</div>
													<div class="tab-pane fade" id="oneyear" role="tabpanel">
														<div>
															<canvas id="myChart12"></canvas>
														</div>
														<script>
															function addZero(i) {
																var rtn = i + 100;
																return rtn.toString().replace("1", "/");
															}
															var monthList = [];
															var monthData = [];
															var today = new Date();
															for (var i = 365; i >= 0; i--) {
																var dt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - i);
																var year = dt.getFullYear();
																var mon = addZero(dt.getMonth() + 1);
																var day = addZero(dt.getDate());
																var format = year + mon + day;
																monthList.push(format);
																monthData.push(Math.floor(Math.random() * 300000));
															}

															const ctx12 = document.getElementById('myChart12').getContext('2d');
															const myChart12 = new Chart(ctx12, {
																type : 'line',
																data : {
																	labels : monthList,
																	datasets : [ {
																		data : monthData,
																		borderColor : 'rgba(255, 99, 132, 1)',
																		borderWidth : 1,
																		pointStyle : false
																	} ]
																},

																options : {
																	scales : {
																		x : {
																			ticks : {
																				maxRotation : 0,
																			},
																			display : false,
																			grid : {
																				display : false
																			}
																		},
																		y : {
																			position : 'right',// `axis` is determined by the position as `'y'`

																			grid : {
																				display : false
																			}
																		}

																	},
																	responsive : true,
																	plugins : {
																		legend : {
																			display : false
																		}

																	}
																}
															});
														</script>
													</div>
													<div class="tab-pane fade" id="all" role="tabpanel">
														<div>
															<canvas id="myChartAll"></canvas>
														</div>
														<script>
															function addZero(i) {
																var rtn = i + 100;
																return rtn.toString().replace("1", "/");
															}
															var monthList = [];
															var monthData = [];
															var today = new Date();
															for (var i = 365; i >= 0; i--) {
																var dt = new Date(today.getFullYear(), today.getMonth(), today.getDate() - i);
																var year = dt.getFullYear();
																var mon = addZero(dt.getMonth() + 1);
																var day = addZero(dt.getDate());
																var format = year + mon + day;
																monthList.push(format);
																monthData.push(Math.floor(Math.random() * 300000));
															}

															const ctxAll = document.getElementById('myChartAll').getContext('2d');
															const myChartAll = new Chart(ctxAll, {
																type : 'line',
																data : {
																	labels : monthList,
																	datasets : [ {
																		data : monthData,
																		borderColor : 'rgba(255, 99, 132, 1)',
																		borderWidth : 1,
																		pointStyle : false
																	} ]
																},

																options : {
																	scales : {
																		x : {
																			ticks : {
																				maxRotation : 0,
																			},
																			display : false,
																			grid : {
																				display : false
																			}
																		},
																		y : {
																			position : 'right',// `axis` is determined by the position as `'y'`

																			grid : {
																				display : false
																			}
																		}

																	},
																	responsive : true,
																	plugins : {
																		legend : {
																			display : false
																		}

																	}
																}
															});
														</script>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 체결 내역 -->
									<div class="d-flex pe-2 mb-3">
										<div class="col-xl-12">
											<div class="nav-align-top mb-4">
												<ul class="nav nav-pills mb-2 nav-fill" role="tablist">
													<li class="nav-item">
														<button type="button" class="btn btn-detail active w-100" role="tab"
															data-bs-toggle="tab" data-bs-target="#deal" aria-controls="deal" aria-selected="true"
															style="border-radius: 20px 0px 0px 20px"
														>체결 거래</button>
													</li>
													<li class="nav-item">
														<button type="button" class="btn btn-detail w-100" role="tab" data-bs-toggle="tab"
															data-bs-target="#sellBid" aria-controls="sellBid" aria-selected="false"
															style="border-radius: 0px"
														>판매 입찰</button>
													</li>
													<li class="nav-item">
														<button type="button" class="btn btn-detail w-100" role="tab" data-bs-toggle="tab"
															data-bs-target="#buyBid" aria-controls="buyBid" aria-selected="false"
															style="border-radius: 0px 20px 20px 0px"
														>구매 입찰</button>
													</li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane fade show active" id="deal" role="tabpanel">
														<div class="p-2 mb-1" style="height: 17vh;">
															<div class="d-flex">
																<div class="col-6">
																	<span style="font-size: 0.8em; color: #a0a0a0;">사이즈</span>
																</div>
																<div class="col-3">
																	<span style="font-size: 0.8em; color: #a0a0a0;">거래가</span>
																</div>
																<div class="col-3">
																	<span style="font-size: 0.8em; color: #a0a0a0;">거래일</span>
																</div>
															</div>
															<hr class="mt-0 mb-0">
															<div class="d-flex">
																<div class="col-6">
																	<span style="font-size: 0.9em; color: #666;">265</span>
																</div>
																<div class="col-3">
																	<span style="font-size: 0.9em; color: #666;">174,000원</span>
																</div>
																<div class="col-3">
																	<span style="font-size: 0.9em; color: #666;">23/05/02</span>
																</div>
															</div>
														</div>
														<div>
															<button type="button" class="btn btn-outline-detail w-100" data-bs-toggle="modal"
																data-bs-target="#detailModal"
															>체결 내역 더보기</button>
														</div>
													</div>
													<div class="tab-pane fade" id="sellBid" role="tabpanel">
														<div class="p-2 mb-1" style="height: 17vh;">
															<div class="d-flex">
																<div class="col-6">
																	<span style="font-size: 0.8em; color: #a0a0a0;">사이즈</span>
																</div>
																<div class="col-4">
																	<span style="font-size: 0.8em; color: #a0a0a0;">판매 희망가</span>
																</div>
																<div class="col-2">
																	<span style="font-size: 0.8em; color: #a0a0a0;">수량</span>
																</div>
															</div>
															<hr class="mt-0 mb-0">
															<div class="d-flex">
																<div class="col-6">
																	<span style="font-size: 0.9em; color: #666;">255</span>
																</div>
																<div class="col-4">
																	<span style="font-size: 0.9em; color: #666;">154,000원</span>
																</div>
																<div class="col-2">
																	<span style="font-size: 0.9em; color: #666;">1</span>
																</div>
															</div>
														</div>
														<div>
															<button type="button" class="btn btn-outline-detail w-100" data-bs-toggle="modal"
																data-bs-target="#detailModal"
															>입찰 내역 더보기</button>
														</div>
													</div>
													<div class="tab-pane fade" id="buyBid" role="tabpanel">
														<div class="p-2 mb-1" style="height: 17vh;">
															<div class="d-flex">
																<div class="col-6">
																	<span style="font-size: 0.8em; color: #a0a0a0;">사이즈</span>
																</div>
																<div class="col-4">
																	<span style="font-size: 0.8em; color: #a0a0a0;">구매 희망가</span>
																</div>
																<div class="col-2">
																	<span style="font-size: 0.8em; color: #a0a0a0;">수량</span>
																</div>
															</div>
															<hr class="mt-0 mb-0">
															<div class="d-flex">
																<div class="col-6">
																	<span style="font-size: 0.9em; color: #666;">265</span>
																</div>
																<div class="col-4">
																	<span style="font-size: 0.9em; color: #666;">153,000원</span>
																</div>
																<div class="col-2">
																	<span style="font-size: 0.9em; color: #666;">1</span>
																</div>
															</div>
														</div>
														<div>
															<button type="button" class="btn btn-outline-detail w-100" data-bs-toggle="modal"
																data-bs-target="#detailModal"
															>입찰 내역 더보기</button>
														</div>
													</div>
												</div>
												<div class="modal" id="detailModal" tabindex="-1">
													<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">시세</h5>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body" style="padding-left: 2.1rem;">
																<div class="d-flex row col-12 mb-2">
																	<div class="p-2" style="flex: 0 0 auto; width: 20%;">
																		<img src="/assets/images/1.png" style="height: 8vh; border-radius: 1.3rem;">
																	</div>
																	<div class="p-2 mb-3" style="flex: 0 0 auto; width: 89%;">
																		<div class="row">
																			<span style="font-size: 0.7rem;">
																				<b>Nike x Peaceminusone Kwondo 1 Black and White</b>
																			</span>
																		</div>
																		<div class="row mb-2">
																			<span style="font-size: 0.6rem; color: #666">나이키 x 피스마이너스원 퀀도1 블랙 앤 화이트</span>
																		</div>
																		<div class="row col-5">
																			<select class="form-select" id="exampleFormControlSelect2"
																				aria-label="Default select example"
																				style="border: 0px; font-size: 1em; float: right; color: #666;"
																			>
																				<option selected>모든 사이즈</option>
																				<c:forEach var="size" begin="220" end="320" step="5">
																					<option value="${size}">${size}</option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																	<div class="nav-align-top mb-4">
																		<ul class="nav nav-pills mb-2 nav-fill" role="tablist">
																			<li class="nav-item">
																				<button type="button" class="btn btn-detail active w-100" role="tab"
																					data-bs-toggle="tab" data-bs-target="#dealModal" aria-controls="deal"
																					aria-selected="true" style="font-size: 0.9rem;"
																				>체결 거래</button>
																			</li>
																			<li class="nav-item">
																				<button type="button" class="btn btn-detail w-100" role="tab"
																					data-bs-toggle="tab" data-bs-target="#sellBidModal" aria-controls="sellBid"
																					aria-selected="false" style="font-size: 0.9rem;"
																				>판매 입찰</button>
																			</li>
																			<li class="nav-item">
																				<button type="button" class="btn btn-detail w-100" role="tab"
																					data-bs-toggle="tab" data-bs-target="#buyBidModal" aria-controls="buyBid"
																					aria-selected="false" style="font-size: 0.9rem;"
																				>구매 입찰</button>
																			</li>
																		</ul>
																		<div class="tab-content" style="overflow-y: scroll;">
																			<div class="tab-pane fade show active" id="dealModal" role="tabpanel">
																				<div class="p-2 mb-1" style="height: 17vh;">
																					<div class="d-flex">
																						<div class="col-6">
																							<span style="font-size: 0.8em; color: #a0a0a0;">사이즈</span>
																						</div>
																						<div class="col-3">
																							<span style="font-size: 0.8em; color: #a0a0a0;">거래가</span>
																						</div>
																						<div class="col-3">
																							<span style="font-size: 0.8em; color: #a0a0a0;">거래일</span>
																						</div>
																					</div>
																					<hr class="mt-0 mb-0">
																					<div class="d-flex">
																						<div class="col-6">
																							<span style="font-size: 0.9em; color: #666;">265</span>
																						</div>
																						<div class="col-3">
																							<span style="font-size: 0.9em; color: #666;">174,000원</span>
																						</div>
																						<div class="col-3">
																							<span style="font-size: 0.9em; color: #666;">23/05/02</span>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="tab-pane fade" id="sellBidModal" role="tabpanel">
																				<div class="p-2 mb-1" style="height: 17vh;">
																					<div class="d-flex">
																						<div class="col-6">
																							<span style="font-size: 0.8em; color: #a0a0a0;">사이즈</span>
																						</div>
																						<div class="col-4">
																							<span style="font-size: 0.8em; color: #a0a0a0;">판매 희망가</span>
																						</div>
																						<div class="col-2">
																							<span style="font-size: 0.8em; color: #a0a0a0;">수량</span>
																						</div>
																					</div>
																					<hr class="mt-0 mb-0">
																					<div class="d-flex">
																						<div class="col-6">
																							<span style="font-size: 0.9em; color: #666;">255</span>
																						</div>
																						<div class="col-4">
																							<span style="font-size: 0.9em; color: #666;">154,000원</span>
																						</div>
																						<div class="col-2">
																							<span style="font-size: 0.9em; color: #666;">1</span>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="tab-pane fade" id="buyBidModal" role="tabpanel">
																				<div class="p-2 mb-1" style="height: 17vh;">
																					<div class="d-flex">
																						<div class="col-6">
																							<span style="font-size: 0.8em; color: #a0a0a0;">사이즈</span>
																						</div>
																						<div class="col-4">
																							<span style="font-size: 0.8em; color: #a0a0a0;">구매 희망가</span>
																						</div>
																						<div class="col-2">
																							<span style="font-size: 0.8em; color: #a0a0a0;">수량</span>
																						</div>
																					</div>
																					<hr class="mt-0 mb-0">
																					<div class="d-flex">
																						<div class="col-6">
																							<span style="font-size: 0.9em; color: #666;">265</span>
																						</div>
																						<div class="col-4">
																							<span style="font-size: 0.9em; color: #666;">153,000원</span>
																						</div>
																						<div class="col-2">
																							<span style="font-size: 0.9em; color: #666;">1</span>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<!-- 배송 정보 -->
									<div class="d-flex pe-2 mt-4 mb-4">
										<div class="heading-section col-12">
											<div class="row mb-1">
												<span style="font-size: 0.9em; color: #666;">배송 정보</span>
											</div>
											<div class="d-flex mb-2">
												<div class="col-1">
													<img src="/assets/img/fast-delivery.png">
												</div>
												<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>빠른배송</b>
														5,000원
													</span>
													<br>
													<span style="font-size: 0.8rem; color: #666;">지금 결제시</span>
													<c:set var="now" value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 1)%>" />
													<fmt:formatDate var="sysYear" value="${now}" pattern="MM월 dd일(E)" />
													<span style="font-size: 0.8rem; color: #8fcabb;">
														<c:out value="${sysYear}" />
														까지 도착예정
													</span>
												</div>
											</div>
											<div class="d-flex">
												<div class="col-1">
													<img src="/assets/img/original-delivery.png">
												</div>
												<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>일반배송</b>
														3,000원
													</span>
													<br>
													<span style="font-size: 0.8rem; color: #666;">검수 후 배송 ・ 5-7일 내 도착 예정</span>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<!-- 구매 전 확인 -->
									<div class="d-flex pe-2 mt-4 mb-4">
										<div class="heading-section col-12">
											<div class="row">
												<span class="mb-2" style="font-size: 1.3em; font-weight: 600;">구매 전 꼭 확인해주세요!</span>
											</div>
											<div class="accordion accordion-flush" id="accordionFlushExample">
												<div class="accordion-item">
													<span class="accordion-header" id="flush-headingOne">
														<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
															data-bs-target="#flush-collapseOne" aria-expanded="false"
															aria-controls="flush-collapseOne" style="font-size: 1rem; padding-left: 0;"
														>배송 기간 안내</button>
													</span>
													<div id="flush-collapseOne" class="accordion-collapse collapse"
														aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample"
													>
														<div class="accordion-body">
															<span style="font-size: 0.8rem; color: #666;">
																<b>TREASURE는 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다. 배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는
																	속도에 따라 차이가 있습니다.</b>
																<br>
																<br>
																[빠른배송 구매]
																<br>
																<br>
																- 판매자가 보관 신청한 상품 중 검수에 합격한 상품을 TREASURE의 전용 창고에 보관합니다. 보관 상품에 한하여 바로 구매와 95점 구매가
																가능합니다.
																<br>
																<br>
																- 오늘(오후 11:59까지) 결제하면 내일 바로 출고되어 빠른 배송이 가능합니다. (연휴 및 공휴일, 천재지변, 택배사 사유 등 예외적으로 출고일이
																변경될 수 있습니다.
																<br>
																<br>
																[일반 구매]
																<br>
																<br>
																- 거래가 체결된 시점부터 48시간(일요일•공휴일 제외) 내에 판매자가 상품을 발송해야 하며, 통상적으로 발송 후 1-2일 내에 TREASURE
																검수센터에 도착합니다.
																<br>
																<br>
																- 검수센터에 도착한 상품은 입고 완료 후 3영업일 이내에 검수를 진행합니다. 검수 합격시 배송을 준비합니다.
																<br>
																* 상품 종류 및 상태에 따라 검수 소요 시간은 상이할 수 있으며, 구매의사 확인에 해당할 경우 구매자와 상담 진행으로 인해 지연이 발생할 수
																있습니다.
																<br>
																<br>
																- 검수센터 출고는 매 영업일에 진행하고 있으며, 출고 마감시간은 오후 5시입니다. 출고 마감시간 이후 검수 완료건은 운송장번호는 입력되지만 다음
																영업일에 출고됩니다.
															</span>
														</div>
													</div>
												</div>
												<div class="accordion-item">
													<h2 class="accordion-header" id="flush-headingTwo">
														<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
															data-bs-target="#flush-collapseTwo" aria-expanded="false"
															aria-controls="flush-collapseTwo" style="font-size: 1rem; padding-left: 0;"
														>검수 안내</button>
													</h2>
													<div id="flush-collapseTwo" class="accordion-collapse collapse"
														aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample"
													>
														<div class="accordion-body">
															<span style="font-size: 0.8rem; color: #666;">
																<b>판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.</b>
																<br>
																<br>
																- 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다.
																<br>
																- 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다.
																<br>
																<br>
																<b>검수 결과는 불합격•검수 보류•합격의 세가지 상태로 결과가 변경됩니다.</b>
																<br>
																<br>
																* 검수 합격: TREASURE 검수택(Tag)이 부착되어 배송을 준비함
																<br>
																* 검수 보류: 앱에서 사진으로 상품의 상태 확인 및 구매 여부를 선택. (24시간 이후 자동 검수 합격)
																<br>
																* 검수 불합격: 즉시 거래가 취소되고 구매하신 금액을 환불 처리함.(환불 수단은 결제 수단과 동일)
															</span>
														</div>
													</div>
												</div>
												<div class="accordion-item">
													<h2 class="accordion-header" id="flush-headingThree">
														<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
															data-bs-target="#flush-collapseThree" aria-expanded="false"
															aria-controls="flush-collapseThree" style="font-size: 1rem; padding-left: 0;"
														>구매 환불/취소/교환 안내</button>
													</h2>
													<div id="flush-collapseThree" class="accordion-collapse collapse"
														aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample"
													>
														<div class="accordion-body">
															<span style="font-size: 0.8rem; color: #666;">
																<b>TREASURE은 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.</b>
																<br>
																<br>
																- 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 상품을 원하지 않으시는 경우 언제든지 TREASURE에서 재판매를 하실 수 있습니다.
																<br>
																- 상품 수령 후, 이상이 있는 경우 TREASURE 고객센터로 문의해주시기 바랍니다.
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<!-- 정품 -->
									<div class="d-flex pe-2 mt-4 mb-4">
										<div class="heading-section col-12">
											<div class="d-flex mb-2">
												<div class="col-1">
													<img src="/assets/img/img-guide-item-01.svg">
												</div>
												<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>100% 정품 보증</b>
													</span>
													<br>
													<span style="font-size: 0.8rem; color: #666;">TREASURE에서 검수한 상품이 정품이 아닐 경우, 구매가의
														3배를 보상합니다.</span>
												</div>
											</div>
											<div class="d-flex">
												<div class="col-1">
													<img src="/assets/img/img-guide-item-02.svg">
												</div>
												<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>엄격한 다중 검수</b>
													</span>
													<br>
													<span style="font-size: 0.8rem; color: #666;">모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의
														체계적인 시스템을 거쳐 검수를 진행합니다.</span>
												</div>
											</div>
											<div class="d-flex">
												<div class="col-1">
													<img src="/assets/img/img-guide-item-03.svg">
												</div>
												<div class="col-11 ms-1">
													<span style="font-size: 1rem;">
														<b>정품 인증 패키지</b>
													</span>
													<br>
													<span style="font-size: 0.8rem; color: #666;">검수에 합격한 경우에 한하여 TREASURE의 정품 인증
														패키지가 포함된 상품이 배송됩니다.</span>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<!-- 책임 -->
									<div class="d-flex pe-2 mt-4 mb-4">
										<span style="font-size: 0.7rem; color: #666;">TREASURE(주)는 통신판매 중개자로서 통신판매의 당사자가
											아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 이용약관 및 정책, 기타 거래 체결
											과정에서 고지하는 내용 등에 따라 검수하고 보증하는 내용에 대한 책임은 TREASURE(주)에 있습니다.</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="mb-5 mt-5">
		<div class="d-flex">
			<div class="col-11 align-self-center">
				<span class="fs-4">
					<b>Nike</b>
					의 다른 상품
				</span>
			</div>
			<div class="col-1 align-self-center">
				<span class="fs-5" style="float: right;">
					더보기
					<a class="fa fa-chevron-right fs-5 ms-2" href=""></a>
				</span>
			</div>
		</div>
		<div class="mt-4 mb-lg-5" style="height: 40vh;">
			<a href=''>
				<img alt="" src="/assets/images/2.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/3.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/4.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/5.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/6.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/7.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
		</div>
		<hr>
		<div class="d-flex mt-5">
			<div class="col-12 align-self-center">
				<span class="fs-4">
					<b>스타일 12</b>
				</span>
			</div>
		</div>
		<div class="mt-4 mb-lg-5" style="border: 1px solid gray; height: 89vh;">
			<a href=''>
				<img alt="" src="/assets/images/8.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/9.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/10.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/11.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/12.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
			<a href=''>
				<img alt="" src="/assets/images/13.png"
					style="border: 1px solid gray; height: 200px; width: 212px;"
				>
			</a>
		</div>
		<div class="col-lg-12 text-center">
			<button type="button" class="btn btn-outline-detail" style="width: 10%; height: 5vh;">더보기</button>
		</div>
	</div>
	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/js/isotope.min.js"></script>
	<script src="../assets/js/owl-carousel.js"></script>
	<script src="../assets/js/tabs.js"></script>
	<script src="../assets/js/popup.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>