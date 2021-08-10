<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/regstyle.css">
    <title>О нас</title>
</head>
<body>
<div class="topnav">
    <img class="logo" src="${contextPath}/resources/css/images/logo1.png">
    <a href="home">Главная</a>
    <a href="news">Новости</a>
    <a href="contacts">Контакты</a>
    <a class="active" href="about">О нас</a>
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
    <h1 class="center-text">
        Мебель Для Дома — Ижевская сеть мебельных магазинов.
        <br>
        Каждый день мы делаем всё, чтобы покупка мебели не утомляла и
        <br>
        вписывалась в ваш бюджет.
    </h1>
    <img class="img-about" src="${contextPath}/resources/css/images/kitchen22.jpg" >
    <h1 class="center-text">
        Мы гарантируем адекватные цены на мебель, высокое качество материалов,
        <br>
        широкую линейку стилей от классики до лофта и
        <br>
        удобство покупки без лишней траты времени. Мебель Для Дома
        <br>
        — это ультимативное место покупки мебели.
        <br>
        <br>
        Если вы планируете обновить интерьер и ищете место покупки мебели,
        <br>
        то первое что должно прийти вам в голову — Мебель Для Дома.
        <br>
        Без разницы где вы делаете покупку: в наших розничных магазинах
        <br>
        или на сайте ­— вы убедитесь, что Мебель Для Дома действительно первый.
    </h1>
    <img class="img-about" src="${contextPath}/resources/css/images/kitchen1.jpg">
    <h1 class="center-text">
        Собственное производство позволяет нам открыто заявить, что мы
        <br>
        отвечаем за каждый предмет мебели, который ушёл с нашего конвеера.
        <br>
        Мы сами конструируем модели мебели, ориентируясь на запросы клиента.
        <br>
        Ведь тренды на мебель меняются достаточно динамично.
        <br>
        Мы делаем всё, чтобы проконтролировать качество производства на каждом
        <br>
        этапе. Брак не может попасть в наши магазины.
    </h1>
    <img class="img-about" src="${contextPath}/resources/css/images/closet.jpg">
    <h1 class="center-text">
        Мы заключаем официальные договора и даем гарантию на мебель. Найти и
        <br>
        заказать необходимую мебель по индивидуальным параметрам легко, не выходя
        <br>
        из дома, с помощью нашего интернет магазина! Компания всегда развивается
        <br>
        и улучшает свой сервис, мы работаем с отзывами клиентов и всегда идем к
        <br>
        вам на встречу. У нас существует накопительная система скидок для
        <br>
        постоянных клиентов, необходимо лишь зарегистрироваться в личном кабинете
        <br>
        и накапливать баллы при покупке. Всегда рады обратной связи!
    </h1>
</div>

</body>
</html>