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
    <sec:authorize access="isAuthenticated()">
        <a class="reg" href="/userprofile" >${pageContext.request.userPrincipal.name}</a>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
    <a class="reg" href="userlistproduct">Корзина</a>
    </sec:authorize>
</div>
<div class="info-block">
    <ul>
        <table>
            <thead>
            <th>Фото</th>
            <th>Название</th>
            <th>Описание</th>
            <th>Цена</th>
            </thead>
            <c:forEach items="${allProducts}" var="product">
                <tr>
                    <td><img src="${contextPath}/resources/css/images/products/imgproducts/${product.fileName}" alt="Фото товара"  width='240' height='240'></td>
                    <td>${product.name}</td>
                    <td style="width:100px" >${product.description}</td>
                    <td>${product.price}</td>
                    <sec:authorize access="isAuthenticated()">
                        <td>
                            <form action="${pageContext.request.contextPath}/addproduct" method="post">
                                <input type="hidden" name="productId" value="${product.id}"/>
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