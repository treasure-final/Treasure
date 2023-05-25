<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="application/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
            charset="utf-8"></script>
</head>
<body>
    <div style="width:1000px; height: 5100px; margin-left: 20%; padding-left: 0px;" id="searchbrand">
        <div>
            <b style=" margin-left: 60px; float: left"> 상품 ${fn:length(searchBrand)} 개</b>
        </div>
        <c:if test="${fn:length(searchBrand) ne 0}">
    <div id="searchBrandList">
        <c:forEach var="searchBrand" items="${searchBrand}" varStatus="i">
            <div class="imgbox">
                <div class="pho">
                    <a href="detail?item_num=${searchBrand.item_num}">
                        <img alt="" src="../img/item_image/${searchBrand.item_image }" style="width: 220px; height: 200px; border-radius: 30px; cursor: pointer;"></a>
                </div>
                <span class="p"><b id="brandcolor" style="color: black; font-size: 2em;">${searchBrand.item_brandname }</b><br>
                  <br>${searchBrand.item_engname }<br><b>${searchBrand.item_korname }</b><br>
               <br>
               <b style="color: black; font-size: 13px;">${searchBrand.item_releaseprice}</b></span>
            </div>
        </c:forEach>
    </div>
    </c:if>
    </div>


</body>
</html>