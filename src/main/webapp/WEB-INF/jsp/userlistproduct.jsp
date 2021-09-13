<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/regstyle.css">
    <title>Админ</title>
</head>
<body>
<div class="topnav">
    <img class="logo" src="${contextPath}/resources/css/images/logo1.png">
    <a href="home">Главная</a>
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
    <sec:authorize access="isAuthenticated()">
    <a class="active reg" href="userlistproduct">Корзина</a>
    </sec:authorize>
</div>

<div class="info-block">
    <div>
        <table>
            <thead>
            <th>Name</th>
            <th>Price</th>
            </thead>
            <c:forEach items="${allProductsOfUser}" var="product">
                <tr>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/deleteproduct" method="post">
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>