<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<style>
    *{
        padding: 0;
        margin: 0;
        border: none;
    }

    body{
        font-size: 14px;
        font-family: 'Roboto', sans-serif;
    }

    .login-wrapper{
        width: 400px;
        height: 350px;
        padding: 40px;
        box-sizing: border-box;
        margin-left: 35%;
        margin-top: 5%
    }

    .login-wrapper > h2{
        font-size: 24px;
        color: black;
        margin-bottom: 40px;
        text-align: center;
    }

    #login-form > input{
        width: 100%;
        height: 48px;
        padding: 0 10px;
        box-sizing: border-box;
        margin-bottom: 16px;
        border-radius: 6px;
        background-color: #F8F8F8;
    }

    #login-form > input::placeholder{
        color: #D2D2D2;
    }

    #login-form > input[type="submit"]{
        color: #fff;
        font-size: 16px;
        background-color: #999999;
        margin-top: 20px;
    }

    #login-form > input[type="checkbox"]{
        display: none;
    }

    #login-form > label{
        color: #babbbc;
    }

    #login-form input[type="checkbox"] + label{
        cursor: pointer;
        padding-left: 26px;
        background-repeat: no-repeat;
        background-size: contain;
    }

    #login-form input[type="checkbox"]:checked + label{
        background-repeat: no-repeat;
        background-size: contain;
    }
</style>
</head>
<body>
<div class="login-wrapper">
    <h2>TREASURE</h2>
    <form method="post" action="loginInsert" id="login-form">
        이메일 주소
        <input type="text" name="email" placeholder="Email" value="${sessionScope.saveOk==null?"":sessionScope.loginEmail }">

        비밀번호
        <input type="password" name="password" placeholder="Password">
        <label for="remember-check">
            <input type="checkbox" id="remember-check" name="saveOk"
                   name="${sessionScope.saveOk==null?"":"checked"}">아이디 저장하기
        </label>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>