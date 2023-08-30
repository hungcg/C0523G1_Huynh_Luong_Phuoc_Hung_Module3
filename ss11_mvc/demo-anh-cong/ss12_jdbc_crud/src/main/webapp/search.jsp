
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <style>
    a{
      text-decoration: none;
    }
    table{
      border-collapse: collapse;
      background: lightseagreen;
      color: black;
    }
    td{
      background: darkgoldenrod;
    }
    h4{
      background: cornflowerblue;
    }
  </style>
  <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
  <link href="https://fonts.googleapis.
  com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <title>User Management Application</title>
</head>
<body>
<center>
  <h1><a href="/users">User Management</a></h1>
</center>
</form>
<div align="center">
  <table border="1" cellpadding="5" id="list"  style="width:70%">
    <caption><h2>List of Users</h2></caption>
    <thead>
    <tr>
      <th>STT</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${listUser}" varStatus="count">
      <tr>
        <td><c:out value="${count.count}"/></td>
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.country}"/></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</html>
