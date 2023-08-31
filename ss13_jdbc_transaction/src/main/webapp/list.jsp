<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/30/2023
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <%--    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">--%>
    <link rel="stylesheet" type="text/css" href="/list.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<center>
    <h1 class="tieude"><a href="/users">User Management</a></h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
</center>

<form action="/users?action=search" method="post">
    <p style="text-align: center">
        <td><input type="text" name="country"></td>
        <td><input type="submit" value="Search"></td>
    </p>
</form>
<div align="center">
    <table border="1" cellpadding="5" >
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
        <c:forEach var="user" varStatus="count" items="${listUser}">

            <tr>
                <td><c:out value="${count.count}"/></td>
                <td><a href="/users?action=view&id=${user.getId()}"><c:out value="${user.name}"/></a></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}"><i class="material-icons">edit</i></a>
                    <a href="/users?action=delete&id=${user.id}"><i class="material-icons">delete</i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>--%>
<%--<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap4.min.js"></script>--%>
<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $('#list').DataTable();--%>
<%--    } );--%>
<%--</script>--%>
</body>
</html>
