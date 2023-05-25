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
button{
	font-size: 13px;
	color: #747f55;
	background-color: #fff;
	padding: 5px;
	border-radius: 25px;
	font-weight: 400;
	text-transform: capitalize;
	letter-spacing: 0.5px;
	transition: all 0.3s;
	position: relative;
	overflow: hidden;
	width: 90px;
	text-align: center;
	border: 1px solid #747f55;
	cursor: pointer;
}
#wrtiemystyle {
	
	width:1200px;
   height: 10px;
   margin-top: 10px;
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
   
}

#stylepho {
   width: 220px;
   height: 200px;
   position: relative;
   
}

#styledata {
   width: 230px;;
   height: 90px;
   margin-top: 295px;
   position: absolute;
   font-size: 5px;
   border: 0px solid blue;
   margin-left: 18px;
}

.stylebox {
   margin-top: 45px;
   border: 0px solid green;
   width: 200px;
   height: 400px;
   display: inline-flex;
   margin-right: 35px; /*아이템별 간격  */
   margin-top: 45px;
   margin-left: 25px;
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

/*좋아요 하트 css  */
.right_area{
float: right;
}

.right_area>a{
  text-decoration:none; color:inherit; cursor: pointer;
}
 .right_area .icon{
    display: flex;
    align-items: center;
    justify-content: center;
    width: calc(100vw * (45 / 1920));
    height: calc(100vw * (45 / 1920));
    border-radius: 50%;
    border: solid 2px #eaeaea;
    background-color: #fff;
}

.icon.heart img{
    width: calc(100vw * (24 / 1920));
    height: calc(100vw * (24 / 1920));
}

.icon.heart.fas{
  color:red
}
.heart{
    transform-origin: center;
}
.heart.active img{
    animation: animateHeart .3s linear forwards;
}

@keyframes animateHeart{
    0%{transform:scale(.2);}
    40%{transform:scale(1.2);}
    100%{transform:scale(1);}
  }
  
  /*좋아요 하트 css 끝  */
  
  
  
   input[type=checkbox] {
            accent-color: #747f55;
        }
}
</style>
<script type="text/javascript">
$(function() {
	//전체 선택하면 체크 박스 전체 선택 
	$("#allcheck").click(function() {
		
		//체크겂 얻기f
		var chk=$(this).is(":checked");
		console.log(chk);
		
		//전체체크값을 아래의 체크에 일괄전달
		//prop :전달
		
		$(".del").prop("checked",chk)
		
	});
	
	$("#btnstyledel").click(function(){
		
		
		var cnt=$(".del:checked").length;
		//alert(cnt);
		
		if(cnt==0){
			alert("먼저 삭제번호를 선택해주세요");
			return;
		}
		
		$(".del:checked").each(function(i,elt){
			//선택한 멤버의 num만 나오는지 확인 
			var num=$(this).attr("num");
			console.log(num);
			
			
			//삭제 ajax
			$.ajax({
				
				type:"get",
				url:"delete",
				dataType:"html",
				data:{"board_id":num},
				success:function(){
					alert("삭제되었습니다");
					location.reload();
				}
			});
		});
	});

});



$(function(){
    var $likeBtn =$('.icon.heart');

        $likeBtn.click(function(){
        $likeBtn.toggleClass('active');

        if($likeBtn.hasClass('active')){          
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
               alt:'찜하기 완료'
                });
          
          
         }else{
            $(this).find('i').removeClass('fas').addClass('far')
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
              alt:"찜하기"
           })
         }
     })
})

</script>



</head>

<body>
   <c:set var="loginOk" value="${sessionScope.loginOk}"></c:set>
	
   <div id="insertsubject" style="width: 1200px; height: 50px; ">
				<h3 style="width: 700px; margin-left: 240px;  text-align: center;">내 스타일</h3>
				</div>
   
   
      <div id="wrtiemystyle">
         <div style="float: right; width: 100px;" >

         		<b style="font-size: 15px; margin-left: 3px;">전체선택</b>
        	 <input type="checkbox" id="allcheck" style="height: 10px; margin-left: 5px;">
        	 <button type="button" id="btnstyledel">삭제</button>
        	 </div>
      </div>

			
	
	


   <br>

   <div class="stylemain">
      <c:forEach var="b" items="${list }" varStatus="i">
      <c:if test="${sessionScope.loginOk!=null and sessionScope.loginEmail==b.myid }">
      
         <div class="stylebox">
         	
			<input type="checkbox" class="del" num=${b.board_id } style="height: 10px; "> <br>
			
            
            <div id="stylepho">
            
               <img alt="" src="../../img/style_image/${b.dimage }"
                  onclick="location.href='#'"
                  style="width: 230px; height: 300px; border-radius:10%; cursor: pointer;">
            </div>

            <div id="styledata">
               <div id="profile">
               
            <c:if test="${b.myphoto==null }"><img src="../../img/profile.png" id="profile-img"></c:if>
                 <c:if test="${b.myphoto!=null }"><img src="../../save/${b.myphoto }" id="profile-img"></c:if>
                 	
                 	
                    <a href="#" ><b style="width: 30px;  height: 20px; cursor: pointer; margin-left: 8px; font-size: 8px; float: left; margin-top: 6px;"> ${b.name}</b></a>
                 
                 
                   <div class="right_area" >
 					 <a href="javascript:;" class="icon heart">
     				<img src="../img/style_image/heart.png" alt="찜하기" style=" width: 15px; ">
 					 </a>
					</div>
                 
                     
               </div>

               <div id="stylecontent">
                  <a>${b.board_subject } </a> <br> <a>${b.board_content }</a> <br> <a>작성날짜: ${b.board_writeday }</a>
               </div>
                  
            </div>








         </div>


	</c:if>
      </c:forEach>
   </div>





  

</body>

</html>