<%--
  Created by IntelliJ IDEA.
  User: susannajung
  Date: 2022/11/15
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.jspform.dao.BoardDAO, com.example.jspform.bean.BoardVO"%>
<%
  String sid = request.getParameter("id");
  if (sid != ""){
    int id = Integer.parseInt(sid);
    BoardVO u = new BoardVO();
    u.setId(id);
    BoardDAO boardDAO = new BoardDAO();
    boardDAO.deleteBoard(u);
  }
  response.sendRedirect("posts.jsp");
%>