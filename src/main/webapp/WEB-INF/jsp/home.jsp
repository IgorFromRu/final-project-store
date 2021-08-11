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
    <sec:authorize access="isAuthenticated()">
    <a class="reg" href="userlistproduct">Корзина</a>
    </sec:authorize>
</div>
<div class="info-block">
    <ul>
        <table>
            <thead>
            <th>Name</th>
            <th>Price</th>
            </thead>
            <c:forEach items="${allProducts}" var="product">
                <tr>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <sec:authorize access="isAuthenticated()">
                        <td>
                            <form action="${pageContext.request.contextPath}/addproduct" method="post">
                                <input type="hidden" name="productId" value="${product.name}"/>
                                <input type="hidden" name="action" value="add"/>
                                <button type="submit">В корзину</button>
                            </form>
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </table>
    </ul>
</div>

</body>
</html>