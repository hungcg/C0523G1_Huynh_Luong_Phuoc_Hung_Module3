<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Search product</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<p>
    <c:if test = "${message} != null">
        <span>${message}</span>
    </c:if>
</p>
<fieldset>
    <legend>Product Information</legend>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Producer</th>

        </tr>
        <c:forEach items='${productList}' var="product">
            <tr>
                <td>${product.getId()}</td>
                <td>${product.getProductName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescription()}</td>
                <td>${product.getProducer()}</td>
            </tr>
        </c:forEach>
    </table>
</fieldset>

</body>
</html>
