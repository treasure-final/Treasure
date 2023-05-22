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



	<title></title>
	<script type="text/javascript">
		$(function(){
			//버튼클릭시 사진불러오는 이벤트 추가
			$("#btnphoto").click(function(){

				$("#mystyle").trigger("click");
			});


			//사진 불러오면 미리보기하기
			$("#mystyle").change(function(){

				if($(this)[0].files[0]){
					var reader=new FileReader();
					reader.onload=function(e){
						$("#showimg").attr("src",e.target.result);
					}
					reader.readAsDataURL($(this)[0].files[0]);
				}
			});


		});

	</script>


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

		button{ font-size: 13px;
			color: #747f55;
			background-color: #fff;
			padding: 12px ;
			border-radius: 25px;
			font-weight: 400;
			text-transform: capitalize;
			letter-spacing: 0.5px;
			transition: all 0.3s;
			position: relative;
			overflow: hidden;
			width: 200px;
			text-align: center;
			border: 1px solid #747f55;
			cursor: pointer;
		}

		#showimg{
			border: 1px solid black;
			width: 230px;
			height: 300px;
		}

		.style-wrapper{
			width: 1000px;
			border: 0px solid black;
			margin-left: 100px;
			height: 600px;


		}
		#profile-img{
			width: 30px;
			height: 30px;
			margin-left: 5px;
			margin-top: 5px;

		}


		#styleinsert
		{
			border: 1px solid black;
			width: 600px;
			height: 500px;
			margin-left: 200px;
		}
		#stlyewrite
		{
			border: 1px solid black;
			float: right;
			width: 250px;
			height:350px;
			margin-right: 20px;

		}
		#insertimg
		{
			border: 0px solid purple;
			width: 230px;
			height:350px;
			float: left;


			margin-left: 40px;
		}
		#insertimg>button
		{
			width: 230px;

			border-radius: 0
		}
		#btns
		{
			border: 0px solid gray;
			width: 600px;
			margin-left: 200px;
			text-align: center;
			margin-top: 20px;
		}
		#stlyewrite>input
		{
			width:235px;
			border-radius: 0;
			text-align: left;
			padding-left: 0px;

		}

		#itemget
		{
			border: 1px solid gold;
			width: 600px;
			height:300px;
			margin-top: 340px;

		}
		#options
		{   float: right;
			width: 100px;
			height:45px;
			border: 1px solid #C4C4C4;
			box-sizing: border-box;
			border-radius: 10px;
			padding: 12px 13px;


			font-weight: 400;
			font-size: 14px;
			line-height: 16px;
		}
		#options:focus{
			border: 1px solid #747f55;
			box-sizing: border-box;
			border-radius: 10px;
			outline: 3px solid white;
			border-radius: 10px;
		}

	</style>



</head>

<body>

	<c:set var="loginOk" value="${sessionScope.loginOk}"></c:set>
	<div class="style-wrapper">
		<form action="insert" method="post" enctype="multipart/form-data" >


			<div id="styleinsert">
				<div id="insertsubject"><h3 style="width: 200px;  margin-left: 240px;">스타일 올리기</h3></div>
				<div id="insertimg">
					<img id="showimg">
					<input type="file" id="mystyle" name="upload" required="required" class="form-control" multiple="multiple" style="display: none;" ><br>
					<button type="button" id="btnphoto" class="btn btn-success ">사진선택</button>

					<input type="hidden" name="user_num" value="${dto.user_num}">
					<%--                <input type="hidden" name="item_num" value="${ }">
                     --%>
				</div>

				<div id="stlyewrite">
					<div style="border-bottom: 1px solid black; ">
						<c:if test="${dto.user_photo==null }"><img src="../../img/profile.png" id="profile-img"></c:if>
						<c:if test="${dto.user_photo!=null }"><img src="../../save/${dto.user_photo }" id="profile-img"></c:if>
						<div style="width: 100px; float: right; margin-top: 12px; margin-right: 100px;"> <b style="font-size: 13px;  ">${dto.user_name}</b> </div>
					</div>



					<input style="border-bottom: 1px solid black;"  type="text" name="board_subject "  class="form-control"
						   required="required" placeholder="제목" autofocus="autofocus">

					<input style="height: 260px;" type="text" name="board_content" class="form-control" required="required" placeholder="내용">
				</div>


				<br>




			</div>


			<div id="btns">
				<button type="button" onclick="location.href='stylelist'">이전</button>
				<button type="submit">등록</button>
			</div>







		</form>
	</div>


</body>

</html>