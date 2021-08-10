<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/productblocksstyle.css">
    <title>Главная</title>
</head>
<body>
<div class="topnav">
    <img class="logo" src="${contextPath}/resources/css/images/logo1.png">
    <a class="active" href="home">Главная</a>
    <a href="news">Новости</a>
    <a href="contacts">Контакты</a>
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
</div>
<div class="info-block">
    <ul>
        <li>
        <div>
            <img class="img-product" src="${contextPath}/resources/css/images/products/kitchen.jpg" alt="Кухня">
            <small>Описание товара</small>
        </div>
    </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/kitchen1.jpg" alt="Кухня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/kitchen2.jpg" alt="Кухня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/kitchen3.jpg" alt="Кухня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/sleep.jpeg" alt="Спальня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/TV.jpg" alt="Стенка ТВ">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/TV1.jpg" alt="Стенка ТВ">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/TV2.jpg" alt="Стенка ТВ">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/kitchen.jpg" alt="Кухня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/kitchen1.jpg" alt="Кухня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/kitchen2.jpg" alt="Кухня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/kitchen3.jpg" alt="Кухня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/sleep.jpeg" alt="Спальня">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/TV.jpg" alt="Стенка ТВ">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/TV1.jpg" alt="Стенка ТВ">
                <small>Описание товара</small>
            </div>
        </li>
        <li>
            <div>
                <img class="img-product" src="${contextPath}/resources/css/images/products/TV2.jpg" alt="Стенка ТВ">
                <small>Описание товара</small>
            </div>
        </li>
    </ul>
</div>

</body>
</html>