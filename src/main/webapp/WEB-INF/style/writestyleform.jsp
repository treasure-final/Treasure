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

.writeform {
	width: 50%;
	margin: 0 auto; border : 1px solid black;
	margin-top: 2%;
	height: 800px;

}

#btns {
	margin: 0 auto;
	width: 200px;
	border: 0px solid black;
	text-align: center;
	margin-top: 10%;

}
#stylecontent{
margin: 0 auto;
width: 200px;
border: 0px solid black;
text-align: center;
margin-top: 5%;

}
#stylecontent>button{ font-size: 13px;
   color: #747f55;
   background-color: #fff;
   padding: 12px 30px;
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


#btns>button{ font-size: 13px;
   color: #747f55;
   background-color: #fff;
   padding: 12px 30px;
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
			border: 1px solid gray;
			width: 300px;
			height: 400px;
	 		margin-left: 30%;
	 		border-radius: 10%;

		}
#viewimg{
width: 100%;

}

#subject{

}
</style>

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

</head>

<body>
	<form action="insert" method="post">
		<div class="writeform">

			<div style="margin: 0 auto; width: 200px;   text-align: center;">
				<h2 style="width: 200px;">스타일 올리기</h2><br>
			</div>

			<div id="viewimg">
			<img id="showimg">
			</div>
			<div id="stylecontent">


				<input type="file" id="mystyle" name="mystyle" required="required" style="display: none;">
				<button type="button" id="btnphoto" class="btn btn-success">사진선택</button>


			 <br>

			<input  type="text" name="subject" class="form-control"
				required="required" placeholder="제목입력하세요"><br>
			</div>

			<div id="btns">
				<button type="submit">등록</button>
				<button type="button" onclick="location.href='stylelist'">스타일 목록</button>
			</div>


		</div>
	</form>





</body>

</html>