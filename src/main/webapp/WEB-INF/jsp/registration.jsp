<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/regstyle.css">
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
                <form:input class="pass" type="text" path="username" placeholder="Логин"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
                    ${usernameError}
            </div>
            <div>
                <form:input class="pass" type="text" path="firstName" placeholder="Имя"></form:input>
            </div>
            <div>
                <form:input class="pass" type="date" path="dateOfBirth" placeholder="Дата рождения"></form:input>
            </div>
            <div>
                <form:input class="pass" type="password" path="password" placeholder="Пароль"></form:input>
            </div>
            <div>
                <form:input class="pass" type="password" path="passwordConfirm"
                            placeholder="Подтвердите пароль"></form:input>
            </div>
            <button class="btn" type="submit">Зарегистрироваться</button>
        </form:form>
    </div>
</div>
</body>
</html>