<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        a{
            text-decoration: none;
        }
        table{
            background: cadetblue;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/products?action=create">Create New Product</a>
</p>
<form method="post" action="/products?action=search">
    <input type="text" name="search">
    <input type="submit" value="Search">
</form>
<table border="1" >
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Supplier</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="product" items="${products}" >
        <tr>
            <td>${product.getProductName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>