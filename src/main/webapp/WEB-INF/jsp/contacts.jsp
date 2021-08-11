<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <title>Контакты</title>
</head>
<body>
<div class="topnav">
    <img class="logo" src="${contextPath}/resources/css/images/logo1.png">
    <a href="home">Главная</a>
    <a href="news">Новости</a>
    <a class="active" href="contacts">Контакты</a>
    <a href="about">О нас</a>
    <sec:authorize access="hasRole('ADMIN')">
        <a href="/admin">Админ</a>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
        <a class="reg" href="registration">Регистрация</a>
        <a class="reg" href="login">Войти</a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <a class="reg" href="/logout">Выйти</a>
    </sec:authorize>
    <a class="reg" href="" >${pageContext.request.userPrincipal.name}</a>
    <sec:authorize access="isAuthenticated()">
        <a class="reg" href="userlistproduct">Корзина</a>
    </sec:authorize>
</div>
<div class="info-block">
    <h1 class="center-text">
        ул. Воровского, 130, Ижевск, республика Удмуртия, 426063
        <br>
        Телефон: 8 800 800 80 80
    </h1>
    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d34912.736967812794!2d53.25979373666157!3d56.84515378313149!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x43e13943a01df55d%3A0xb3a7e0b1f31a5a8d!2z0JzQtdCx0LXQu9GMINC00LvRjyDQlNC-0LzQsA!5e0!3m2!1sru!2sru!4v1627041819918!5m2!1sru!2sru"
                width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </iframe>
    </div>
</div>

</body>
</html>