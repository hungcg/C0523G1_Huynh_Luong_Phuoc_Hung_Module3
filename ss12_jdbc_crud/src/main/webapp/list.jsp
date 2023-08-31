<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/30/2023
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
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
            background: darkslategrey;
            color: black;
            border-collapse: collapse;
        }
        td{
            background: chocolate;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
    <link href="https://fonts.googleapis.
  com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>User Management Application</title>
</head>
<body>
    <h1><a href="/users">User Management</a></h1>
    <h2>
        <a href="/users?action=create" >Add New User</a>
    </h2>
    <form method="post" action="/users?action=sort">
        <input type="submit" value="sort by name">
    </form>
    <form method="post" action="/users?action=search">
        <input type="text" name="country">
        <input type="submit" value="search">
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
                <td>
                    <a  href="/users?action=edit&id=${user.id}"><i
                            class="material-icons">edit</i>Edit</a>
                    <a style="position: relative ;left: 20px"  href="/users?action=delete&id=${user.id}"><i
                            style="color:brown; " class="material-icons">delete</i>Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</script>
</html>