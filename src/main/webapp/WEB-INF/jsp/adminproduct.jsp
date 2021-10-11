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

<div class="addForm">
    <form method="POST" action="/adminproduct/addproduct" modelAttribute="productForm" enctype="multipart/form-data">
        <h3>Добавить продукт</h3>
        <input type="text" maxlength="25" size="40" placeholder="Название" name="name" autofocus="true">
        <input  type="text" maxlength="25" size="40" placeholder="Цена" name="price" autofocus="true">
        <input  type="text" maxlength="25" size="40" placeholder="Тип" name="type" autofocus="true">
        <textarea name="description" placeholder="Описание товара" cols="30" rows="4"></textarea>
        <input type="file" name="file">
        <input  type="submit" value="Отправить">
    </form>
</div>
<div class="info-block">
    <td>${productNameError}</td>
    <div>
        <table width="100%">
            <thead>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Type</th>
            <th>Price</th>
            </thead>
            <c:forEach items="${allProducts}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td><div style="word-wrap: break-word;">${product.description}</div></td>
                    <td> ${type.nameType}</td>
                    <td>${product.price}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/adminproduct" method="post">
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
