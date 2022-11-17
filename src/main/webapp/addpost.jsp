<%--
  Created by IntelliJ IDEA.
  User: susannajung
  Date: 2022/11/14
  Time: 11:33 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.jspform.dao.BoardDAO"%>
<%@ page import="com.example.jspform.common.FileUpload" %>
<%@ page import="com.example.jspform.bean.BoardVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
  BoardDAO boardDAO = new BoardDAO();
  FileUpload upload = new FileUpload();

  BoardVO u = upload.uploadPhoto(request);

  int i = boardDAO.insertBoard(u);
  String msg = "데이터 추가 성공 !";
  if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
  alert('<%=msg%>');
  location.href='posts.jsp';
</script>