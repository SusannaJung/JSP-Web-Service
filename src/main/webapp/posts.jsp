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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
    <title>Registration List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="./assets/css/sticky-footer-navbar.css" rel="stylesheet">
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
<jsp:include page="navbar.jsp" />
<main role="main" class="container">
<div>
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
    <c:forEach items="${list}" var="u" varStatus="status">
        <tr>
            <td>${fn: length(list)-status.index}</td>
            <td>
                <c:choose>
                    <c:when test="${not empty u.getPhoto()}">
                        <img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" alt="..." width="100px" height="100px" class="img-thumbnail">
                    </c:when>
                    <c:otherwise>
                        <img src="./assets/images/defaultImage.png" alt="..." width="100px" height="100px" class="img-thumbnail">
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${u.getFirstName()}</td>
            <td>${u.getLastName()}</td>
            <td>${u.getBirthday()}</td>
            <td>${u.getGender()}</td>
            <td>${u.getEmail()}</td>
            <td>${u.getPhone()}</td>
            <td>${u.getInformation()}</td>
            <td>${u.getUserType()}</td>
            <td><a href="editpostform.jsp?id=${u.getId()}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
            </svg></a></td>
            <td><a href="javascript:delete_ok('${u.getId()}')"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
            </svg></a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>
