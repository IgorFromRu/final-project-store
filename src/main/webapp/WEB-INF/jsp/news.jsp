<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <title>Новости</title>
</head>
<body>
<div class="topnav">
    <img class="logo" src="${contextPath}/resources/css/images/logo1.png">
    <a href="home">Главная</a>
    <a class="active" href="news">Новости</a>
    <a href="contacts">Контакты</a>
    <a href="about">О нас</a>
    <sec:authorize access="hasRole('ADMIN')">
        <div class="dropdown">
            <button class="dropbtn">Админ
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="admin">Управление пользователями</a>
                <a href="adminproduct">Управление товарами</a>
                <a href="#">еще что-то</a>
            </div>
        </div>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
        <a class="reg" href="registration">Регистрация</a>
        <a class="reg" href="login">Войти</a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <a class="reg" href="/logout">Выйти</a>
    </sec:authorize>
    <a class="reg" href="/userprofile" >${pageContext.request.userPrincipal.name}</a>
    <sec:authorize access="isAuthenticated()">
        <a class="reg" href="userlistproduct">Корзина</a>
    </sec:authorize>
</div>
<div class="info-block">
    <h1 class="center-text">Здесь будут новости, скидки итд.</h1>
</div>

</body>
</html>