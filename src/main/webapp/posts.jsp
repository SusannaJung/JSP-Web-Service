<%--
  Created by IntelliJ IDEA.
  User: susannajung
  Date: 2022/11/14
  Time: 11:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.jspform.dao.BoardDAO, com.example.jspform.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Registration List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }
    </script>
    <style>
        tr{
            vertical-align: middle;
        }
        td{
            max-width: 150px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
</head>
<body>
<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.setAttribute("list",list);
%>
<div class="container">
    <div class="text-center my-3"><h3>Registration List</h3></div>
    <div class="d-flex justify-content-end mb-3">
        <a href="addpostform.jsp" class="btn btn-primary" role="button" aria-pressed="true">Register Now!</a>
    </div>
<table class="table">
    <thead class="bg-light">
    <tr class="align-middle">
        <th scope="col">#</th>
        <th scope="col">Image</th>
        <th scope="col">First</th>
        <th scope="col">Last</th>
        <th scope="col">Birthday</th>
        <th scope="col">Gender</th>
        <th scope="col">Email</th>
        <th scope="col">Phone</th>
        <th scope="col">Information</th>
        <th scope="col">userType</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.getId()}</td>
            <td><img src="./assets/images/defaultImage.png" alt="" border=1 height=100 width=100></td>
            <td>${u.getFirstName()}</td>
            <td>${u.getLastName()}</td>
            <td>${u.getBirthday()}</td>
            <td>${u.getGender()}</td>
            <td>${u.getEmail()}</td>
            <td>${u.getPhone()}</td>
            <td>${u.getInformation()}</td>
            <td>${u.getUserType()}</td>
            <td><a href="editpostform.jsp?id=${u.getId()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getId()}')">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
