<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/28/2023
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h1>Display Customer</h1>
<table border="1px">
  <tr>
    <th>Name</th>
    <th>Birthday</th>
    <th>Address</th>
    <th>Photo</th>
  </tr>
  <c:forEach var="Customer" items="${list}">
    <tr>
      <td>${Customer.name}</td>
      <td>${Customer.birthday}</td>
      <td>${Customer.address}</td>
      <td><img src="${Customer.photo}" alt="" width="100px"></td>
    </tr>
  </c:forEach>
</table>

</body>
</html>
