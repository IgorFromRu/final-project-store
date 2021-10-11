<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/regstyle.css">
    <script src="${contextPath}/resources/js/regLogForm.js"></script>
    <title>Регистрация</title>
</head>
<body>
<div class="topnav">
    <img class="logo" src="${contextPath}/resources/css/images/logo1.png">
    <a href="home">Главная</a>
    <a href="news">Новости</a>
    <a href="contacts">Контакты</a>
    <a href="about">О нас</a>
    <a class="reg" href="registration">Регистрация</a>
</div>

<div class="regForm">
    <h1>Вход на сайт</h1>
    <div class="inp">
        <form method="POST" action="/login" name="logForm" onsubmit="return loginForm()">
            <span id='message'></span>
            <div c:if test="${param.error}">
                Неправильный логин или пароль
            </div>
            <input class="pass" type="text" maxlength="25" size="40" placeholder="Username" name="username" autofocus="true">
            <input class="pass" type="password" maxlength="25" size="40" placeholder="Password" name="password">
            <input class="btn" type="submit" value="Войти">
        </form>
    </div>
</div>

</body>
</html>