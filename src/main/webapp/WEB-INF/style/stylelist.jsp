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


    </style>

    <script type="text/javascript">
        $(function(){
            var likeBtn =$('.icon.heart');

            likeBtn.click(function(){
                if(likeBtn.hasClass('active')){
                    $(this).removeClass('active')
                    $(this).find('img').attr({
                        'src': '../img/style_image/heart.png',
                        // alt:"찜하기"
                    });
                    var board_id=$(this).attr("board_id");
                    $.ajax({
                        url:"/style/deleteLike",
                        data:{"board_id":board_id},
                        type:"get",
                        success:function() {
                            // alert("찜하기 삭제");
                        }
                    });

                }else{
                    $(this).addClass('active')
                    $(this).find('img').attr({
                        'src': '../img/style_image/redheart.png',
                        // alt:'찜하기 완료'
                    })
                    var board_id=$(this).attr("board_id");
                    $.ajax({
                        url:"/style/insertLike",
                        data:{"board_id":board_id},
                        type:"get",
                        success:function() {
                            // alert("찜하기 완료");
                        }
                    });

                }
            })
        });


    </script>


</head>

<body>
<c:set var="loginOk" value="${sessionScope.loginOk}"/>

<div>
    <div id="wrtiemystyle" style="margin-left: 70px;">
        <a href="#"><b>인기순</b></a>
        &nbsp;
        <a href="/style/stylelist"><b>최신순</b></a>
    </div>


    <div id="sortstyle" style="margin-right: 200px;">
        <c:if test="${not empty loginOk}">
            <a href="/style/writestyleform"><b>글쓰기</b></a>
        </c:if>

        <c:if test="${empty loginOk}">
            <a id="nologinwrite"><b>글쓰기</b></a>
        </c:if>
        &nbsp;
        <c:if test="${not empty loginOk}">
            <a href="/style/mystyle"><b>내 스타일</b></a>
        </c:if>

        <c:if test="${empty loginOk}">
            <a id="nologinstylewrite"><b>내 스타일</b></a>
        </c:if>
    </div>
</div>

<br>

<div class="stylemain" style="margin-left: 30px;">
    <c:forEach var="b" items="${list }" varStatus="i">
        <div class="stylebox">

            <div id="stylepho">
                <img alt="" src="../../img/style_image/${b.dimage }" onclick="location.href='/style/detail?board_id=${b.user_num}'"
                     style="width: 230px; height: 300px; border-radius: 10%; cursor: pointer;">
            </div>

            <div id="styledata">
                <div id="profile">
                    <c:if test="${b.myphoto eq null }"><img src="../../img/profile.png" id="profile-img"></c:if>
                    <c:if test="${b.myphoto ne null }"><img src="../../save/${b.myphoto }" id="profile-img"></c:if>
                    <a href="#" ><b style="width: 30px;  height: 20px; cursor: pointer; margin-left: 8px; font-size: 8px; float: left; margin-top: 6px;">${b.name}</b></a>

                    <div class="right_area">
                        <c:if test="${b.boardLikeCheck eq 1}">
                            <a class="icon heart active" board_id="${b.board_id}">
                                <img src="../img/style_image/redheart.png" alt="찜하기" style=" width: 15px; ">
                            </a>
                        </c:if>
                        <c:if test="${b.boardLikeCheck ne 1}">
                            <a class="icon heart" board_id="${b.board_id}">
                                <img src="../img/style_image/heart.png" alt="찜하기" style=" width: 15px; ">
                            </a>
                        </c:if>
                    </div>
                        <%--                  <img alt="" src="../img/style_image/${b.board_image}">--%>
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

    document.getElementById("nologinstylewrite").addEventListener("click", function() {
        alert("로그인 후 이용 가능합니다");
        window.location.href = "/user/loginForm";





    });




</script>

</body>

</html>