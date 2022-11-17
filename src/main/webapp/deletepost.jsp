<%--
  Created by IntelliJ IDEA.
  User: susannajung
  Date: 2022/11/15
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.jspform.dao.BoardDAO, com.example.jspform.bean.BoardVO"%>
<%@ page import="com.example.jspform.common.FileUpload" %>
<%
  String sid = request.getParameter("id");
  if (sid != ""){
    int id = Integer.parseInt(sid);
    BoardDAO boardDAO = new BoardDAO();
    BoardVO u = new BoardVO();

    //업로드한 이미지 파일 삭제
    String filename = boardDAO.getPhotoFilename(id);
    if(filename != null){
      FileUpload.deleteFile(request, filename);
    }
    u.setId(id);
    boardDAO.deleteBoard(u);
  }
  response.sendRedirect("posts.jsp");
%>