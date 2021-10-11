<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/regstyle.css">
    <script src="${contextPath}/resources/js/main.js"></script>
    <title>Регистрация</title>
</head>

<body>

<div class="topnav">
    <img class="logo" src="${contextPath}/resources/css/images/logo1.png">
    <a href="home">Главная</a>
    <a href="news">Новости</a>
    <a href="contacts">Контакты</a>
    <a href="about">О нас</a>
    <a class="reg" href="/login">Войти</a>
</div>

<div class="regForm">
    <h1>Регистрация</h1>
    <div class="inp">
        <form:form method="POST" modelAttribute="userForm">
                <div>
                    ${usernameError}
                </div>
                <div>
                    <form:input class="pass" type="text" path="username" placeholder="Имя"
                             autofocus="true" title="Please provide only a Best Startup Ever corporate e-mail address"></form:input>
                </div>
                <div>
                    <form:input class="pass" type="email" path="email" placeholder="Email"></form:input>
                </div>
                <div>
                    <form:input class="pass" type="date" path="dateOfBirth" placeholder="Дата рождения"></form:input>
                </div>
                <div>
                    <input class="pass" name="password" id="password" type="password"
                                placeholder="Подтвердите пароль" onkeyup='check();'/>
                </div>
                <div>
                    <input class="pass" type="password" name="confirm_password" id="confirm_password"
                                placeholder="Пароль" onkeyup='check();'/>
                    <span id='message'></span>
                <button class="btn" type="submit">Зарегистрироваться</button>
        </form:form>
    </div>
</div>
</body>
</html>