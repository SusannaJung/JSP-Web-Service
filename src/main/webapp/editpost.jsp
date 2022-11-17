<%--
  Created by IntelliJ IDEA.
  User: susannajung
  Date: 2022/11/15
  Time: 12:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.jspform.dao.BoardDAO"%>
<%@ page import="com.example.jspform.common.FileUpload" %>
<%@ page import="com.example.jspform.bean.BoardVO" %>

<% request.setCharacterEncoding("utf-8");

    BoardDAO boardDAO = new BoardDAO();
    FileUpload upload = new FileUpload();
    BoardVO u = upload.uploadPhoto(request);

    int i=boardDAO.updateBoard(u);
    response.sendRedirect("posts.jsp");
%>