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
		/* $(function(){
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


        }); */

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

		button{
			font-size: 13px;
			color: #747f55;
			background-color: #fff;
			padding: 12px;
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


		.style-wrapper {
			width: 1200px;
			margin-top: 30px;
			margin-left: 100px;
		}

		#profile-img {
			width: 30px;
			height: 30px;
			margin-left: 5px;
			margin-top: 5px;
		}

		#styleinsert {

			width: 800px;
			height: 800px;
			margin-left: 200px;

		}

		#stlyewrite {
			border: 1px solid #e3e3e3;
			border-radius:20px;
			float: right;
			width: 280px;
			height: 330px;
			margin-top: 10px;
		}

		#insertimg {
			width: 490px;
			height: 355px;
			float: left;


		}

		#insertimg>button {
			width: 230px;
			border-radius: 0
		}

		#btns{
			border: 0px solid gray;
			width: 800px;
			height: 70px;
			margin-top:430px;
			text-align: center;

		}

		#stlyewrite>input {
			width: 265px;
			border-radius: 0;
			text-align: left;
			padding-left: 0px;
			background-color: white;
		}

		#itemget {
			border: px solid gold;
			width: 600px;
			height: 300px;
			margin-top: 340px;
		}

		#options {
			float: right;
			width: 100px;
			height: 45px;
			border: 1px solid #C4C4C4;
			box-sizing: border-box;
			border-radius: 10px;
			padding: 12px 13px;
			font-weight: 400;
			font-size: 14px;
			line-height: 16px;
		}

		#options:focus {
			border: 1px solid #747f55;
			box-sizing: border-box;
			border-radius: 10px;
			outline: 3px solid white;
			border-radius: 10px;
		}

		#att_zone {
			width: 495px;
			min-height:310px;
			padding: 10px;
			border: 1px solid #e3e3e3;
			border-radius: 20px;
			margin-right: 100px;
			height: 400px;
		}

		#att_zone:empty:before {
			content: attr(data-placeholder);
			color: #999;
			font-size: .9em;
		}


	</style>



</head>

<body>

<c:set var="loginOk" value="${sessionScope.loginOk}"></c:set>
<div class="style-wrapper">
	<form action="insert" method="post" enctype="multipart/form-data">


		<div id="styleinsert">
			<div id="insertsubject" style="width: 800px; height: 50px; ">
				<h3 style="width: 300px; margin-left: 240px;  text-align: center;">스타일 올리기</h3>
			</div>


			<div id="insertimg">
				<input type='file' id='btnAtt' name="upload" multiple='multiple'
					   style="background-color: white; padding: 0; border-radius: 0; height: 30px;"   />
				<div id='att_zone' class="view_img"
					 data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
				<input type="hidden" name="user_num" value="${dto.user_num}">
			</div>
			<br>

			<div id="stlyewrite">
				<div style="border-bottom: 1px solid #e3e3e3;">
					<c:if test="${dto.user_photo==null }">
						<img src="../../img/profile.png" id="profile-img">
					</c:if>
					<c:if test="${dto.user_photo!=null }">
						<img src="../../save/${dto.user_photo }" id="profile-img">
					</c:if>
					<div
							style="width: 100px; float: right; margin-top: 12px; margin-right: 130px;">
						<b style="font-size: 13px;"> ${dto.user_name}</b>
					</div>
				</div>

				<input style="border-bottom: 1px solid #e3e3e3;" type="text"
					   name="board_subject " class="form-control" required="required"
					   placeholder="제목" autofocus="autofocus">
				<input style="height: 330px;"  type="text" name="board_content"
					   class="form-control" required="required" placeholder="내용" >
			</div>


			<br>

			<div id="btns">
				<button type="button" onclick="location.href='stylelist'" style="">이전</button>
				<button type="submit">등록</button>
			</div>



		</div>









	</form>
</div>




<script>
	( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			imageView = function imageView(att_zone, btn){

				var attZone = document.getElementById(att_zone);
				var btnAtt = document.getElementById(btn)
				var sel_files = [];

				// 이미지와 체크 박스를 감싸고 있는 div 속성
				var div_style = 'display:inline-block;position:relative;'
						+ 'width:150px;height:120px;margin:5px;z-index:1';
				// 미리보기 이미지 속성
				var img_style = 'max-width:400px;max-height:400px;z-index:none;margin-left:50px; margin-right:100px';
				// 이미지안에 표시되는 체크박스의 속성
				var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
						+ 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';

				btnAtt.onchange = function(e){
					var files = e.target.files;
					var fileArr = Array.prototype.slice.call(files)
					for(f of fileArr){
						imageLoader(f);
					}
				}


				// 탐색기에서 드래그앤 드롭 사용
				attZone.addEventListener('dragenter', function(e){
					e.preventDefault();
					e.stopPropagation();
				}, false)

				attZone.addEventListener('dragover', function(e){
					e.preventDefault();
					e.stopPropagation();

				}, false)

				attZone.addEventListener('drop', function(e){
					var files = {};
					e.preventDefault();
					e.stopPropagation();
					var dt = e.dataTransfer;
					files = dt.files;
					for(f of files){
						imageLoader(f);
					}

				}, false)



				/*첨부된 이미리즐을 배열에 넣고 미리보기 */
				imageLoader = function(file){
					sel_files.push(file);
					var reader = new FileReader();
					reader.onload = function(ee){
						let img = document.createElement('img')
						img.setAttribute('style', img_style)
						img.src = ee.target.result;
						attZone.appendChild(makeDiv(img, file));
					}

					reader.readAsDataURL(file);
				}

				/*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
				makeDiv = function(img, file){
					var div = document.createElement('div')
					div.setAttribute('style', div_style)

					var btn = document.createElement('input')
					btn.setAttribute('type', 'button')
					btn.setAttribute('value', 'x')
					btn.setAttribute('delFile', file.name);
					btn.setAttribute('style', chk_style);
					btn.onclick = function(ev){
						var ele = ev.srcElement;
						var delFile = ele.getAttribute('delFile');
						for(var i=0 ;i<sel_files.length; i++){
							if(delFile== sel_files[i].name){
								sel_files.splice(i, 1);
							}
						}

						dt = new DataTransfer();
						for(f in sel_files) {
							var file = sel_files[f];
							dt.items.add(file);
						}
						btnAtt.files = dt.files;
						var p = ele.parentNode;
						attZone.removeChild(p)
					}
					div.appendChild(img)
					div.appendChild(btn)
					return div
				}
			}
	)('att_zone', 'btnAtt')


</script>

</body>

</html>