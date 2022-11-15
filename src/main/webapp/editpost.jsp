<%--
  Created by IntelliJ IDEA.
  User: susannajung
  Date: 2022/11/15
  Time: 12:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.jspform.dao.BoardDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.jspform.bean.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
    BoardDAO boardDAO = new BoardDAO();
    int i=boardDAO.updateBoard(u);
    response.sendRedirect("posts.jsp");
%>