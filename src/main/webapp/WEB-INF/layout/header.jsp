<%@ page import="java.util.List"%>
<%@ page import="boot.mvc.item.ItemDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="boot.mvc.item.ItemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <link
         href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
         rel="stylesheet">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script src="../hangul.js" type="text/javascript"></script>
   <!-- or from CDN -->
   <script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
   <script src="/assets/js/data.js"></script>
   <title></title>
   <style type="text/css">
      #title {
         width: 100%;
      }

      #logoimg {
         margin-top: 20px;
         margin-left: 30px;
         width: 400px;
      }

      #menulist {
         margin-top: 5px;
         font-size: 18px;
         float: left;
      }

      #infostate {
         position: absolute;
         right: 30px;
         margin-right: 40px;
         top: 35px;
      }

      #searchinput {
         float: right;
         margin-top: 5px;
         margin-right: 40px;
      }


      li {
         float: left;
         list-style: none;
      }

      ul {
         list-style: none;
      }

      input {
         background-color: #dfebda;
         height: 46px;
         border-radius: 23px;
         border: none;
         color: #666;
         font-size: 14px;
         padding: 0px 15px 0px 45px;
      }

      a {
         color: black;
         text-decoration: none !important;
      }

      a:hover {
         color: #747f55;
      }

      /* 자동 완성 창 css */
      .ui-autocomplete {
         font-size: 12pt;
         max-height: 300px;
         overflow-y: auto;
         /* prevent horizontal scrollbar */
         overflow-x: hidden;
         height: auto;
         line-height: 24px;
      }
      .ui-menu-item div.ui-state-hover,
      .ui-menu-item div.ui-state-active {
         color: #ffffff;
         text-decoration: none;
         background-color: #747f55;
         border-radius: 0px;
         -webkit-border-radius: 0px;
         -moz-border-radius: 0px;
         background-image: none;
         border:none;
      }
   </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>" />

<div class="header">

   <div id="title">

      <div id="logoimg">
         <a href="/"> <img src="../assets/images/mainlogo.png"
                       style="width: 200px;" >
         </a>
      </div>

      <div id="menulist">
         <ul class="tul">
            <li style="margin-right: 40px;"><a href="/"><b>Home</b></a></li>
            <li style="margin-right: 40px;"><a href="/style/stylelist">Style</a></li>
            <li style="margin-right: 40px;"><a href="/item/itemlist">Shop</a></li>

            <c:if test="${not empty loginOk}">
               <li style="margin-right: 40px;"><a href="/user/myPage">My</a></li>
            </c:if>

            <c:if test="${empty loginOk}">
               <li style="margin-right: 40px;"><a id="noLoginMy">My</a></li>
            </c:if>
         </ul>
      </div>

      <div id="infostate">
         <c:set var="loginOk" value="${sessionScope.loginOk}"></c:set>
         <c:if test="${empty loginOk}">
            <a href="/user/loginForm">로그인</a>
         </c:if>
         <c:if test="${not empty loginOk}">
            <a href="/user/logout">로그아웃</a>
         </c:if>
         &nbsp; <a href="#">고객센터</a>
      </div>
      <div id="searchinput">
      <script>
         var link = document.location.href;
         console.log(link);

         if(link=="http://localhost:8080/" || link=="http://localhost:8080/item/itemlist" || link.indexOf("itemsearch?")) {
            var s="<img alt='' src='../assets/images/searchicon.png' style='width: 25px; z-index: 3; margin-left: 10px; position: absolute; margin-top: 10px;'>";
                  s+="<input type='text' id='search' autocomplete='off' placeholder='상품 검색' style='z-index: 4;'>";
            $("#searchinput").append(s);
         }

            //만약 엔터키를 누르면(=검색하면) 검색 리스트 띄우도록
            $(document).keydown(function(event) {
               if(event.which==13) {
                  //입력한 검색 값을 받아와서
                  var searchText=$("#search").val();
                  if(link=="http://localhost:8080/item/itemlist") {
                     location.href="itemsearch?searchText="+searchText;
                  } else {
                     location.href="/item/itemsearch?searchText="+searchText;
                  }
               }
            })

      </script>
      </div>
   </div>
</div>

<script type="text/javascript">
   document.getElementById("noLoginMy").addEventListener("click", function() {
      alert("로그인 후 이용 가능합니다");
      window.location.href = "/user/loginForm";
   });


</script>

</body>
</html>