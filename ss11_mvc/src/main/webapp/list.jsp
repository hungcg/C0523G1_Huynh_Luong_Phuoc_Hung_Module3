<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/29/2023
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border-collapse: collapse;
            background: cadetblue;
            box-shadow: black;
        }
    </style>
</head>
<body>
<%--<a href="/product"></a>--%>
<table border="1px">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${productList}" varStatus="count">
        <tr>
            <td><c:out value="${count.count}"/></td>
            <td><c:out value="${p.name}"/></td>
            <td><c:out value="${p.price}"/></td>
            <td><c:out value="${p.description}"/></td>
            <td><c:out value="${p.supplier}"/></td>

        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
