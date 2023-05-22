<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">
    <title>Treasure</title>
    <style>
        #banner {
            margin-top: 50px;
            width: 100%;
            height: 250px;
            background-color: #e3e3e3;
        }

        #container {
            width: 1000px;
            height: 1000px;
            margin-left: 120px;
            border: 2px solid green;
            margin-top: 50px;
        }

        .card-list {
            width: 100%;
            border: 1px solid red;
            height: 300px;
        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>

<div id="banner">

</div>
<div id="container">
    <div class="card-list">

    </div>
</div>
</body>
</html>