<%--
  Created by IntelliJ IDEA.
  User: susannajung
  Date: 2022/11/14
  Time: 10:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.jspform.dao.BoardDAO, com.example.jspform.bean.BoardVO"%>
<html>
<head>
  <meta charset="UTF-8">
  <!-- CSS only -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <title>Form Example</title>
  <style>
    .form-label{
      font-weight: 600 !important;
    }
  </style>
</head>
<body>
<%
  BoardDAO boardDAO = new BoardDAO();
  String id=request.getParameter("id");
  BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%>

<div class="container">
  <div class="text-center my-3"><h3>Edit Registration Form </h3></div>
  <div class="py-5">
    <form action="editpost.jsp" method="post">
      <input type="hidden" name="id" value="<%=u.getId() %>"/>
      <div class="mb-2">
        <label class="form-label" for="form6Example1">Profile Image</label>
        <div class="row">
          <div class="col">
            <div class="form-outline">
              <img src="./assets/images/defaultImage.png" alt="..." width="100px" height="100px" class="img-thumbnail">
            </div>
          </div>
          <div class="col d-flex flex-column justify-content-center">
            <div class="input-group mb-3">
              <div class="custom-file">
                <input type="file" class="custom-file-input" id="inputGroupFile01" name="profile">
                <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
              </div>
            </div>
          </div>

        </div>
      </div>

      <!-- 2 column grid layout with text inputs for the first and last names -->
      <div class="row mb-2">
        <div class="col">
          <div class="form-outline">
            <label class="form-label" for="form6Example1">First name</label>
            <input type="text" id="form6Example1" class="form-control"  name="firstName" value="<%= u.getFirstName()%>"/>
          </div>
        </div>
        <div class="col">
          <div class="form-outline">
            <label class="form-label" for="form6Example2">Last name</label>
            <input type="text" id="form6Example2" class="form-control" name="lastName" value="<%= u.getLastName()%>"/>
          </div>
        </div>
      </div>

      <!-- Radio input -->
      <div class="row mb-2">
        <div class="col">
          <div class="form-outline">
            <label class="form-label" for="form6Example3">Birthday</label>
            <input type="date" id="form6Example3" class="form-control" name="birthday" value="<%= u.getBirthday()%>"/>
          </div>
        </div>
        <div class="col">
          <div class="form-outline form-group">
            <label class="form-label" for="exampleFormControlSelect1">Gender</label>
            <%if(u.getGender().equalsIgnoreCase("Male")){ %>
            <select class="form-control" id="exampleFormControlSelect1" name="gender">
              <option selected="selected">Male</option>
              <option>Female</option>
            </select>
            <% } else if(u.getGender().equalsIgnoreCase("Female")) {%>
            <select class="form-control" id="exampleFormControlSelect1" name="gender" value="<%= u.getGender()%>">
              <option>Male</option>
              <option selected="selected">Female</option>
            </select>
            <% } %>
          </div>
        </div>
      </div>


      <!-- Email input -->
      <div class="form-outline mb-4">
        <label class="form-label" for="form6Example5">Email</label>
        <input type="email" id="form6Example5" class="form-control" name="email" value="<%= u.getEmail()%>"/>
      </div>

      <!-- Number input -->
      <div class="form-outline mb-4">
        <label class="form-label" for="form6Example6">Phone</label>
        <input type="number" id="form6Example6" class="form-control" name="phone" value="<%= u.getPhone()%>"/>
      </div>

      <!-- Message input -->
      <div class="form-outline mb-4">
        <label class="form-label" for="form6Example7">Additional information</label>
        <textarea class="form-control" id="form6Example7" rows="4" name="information"><%= u.getInformation()%></textarea>
      </div>

      <!-- User Type input -->
      <%if(u.getUserType().equalsIgnoreCase("Admin")) { %>
      <div class="form-outline mb-4">
        <label class="form-label" for="exampleFormControlSelect1">User Type</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="userType" id="exampleRadios1-1" value="Admin" checked>
          <label class="form-check-label" for="exampleRadios1-1">
            Admin
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="userType" id="exampleRadios2-1" value="User">
          <label class="form-check-label" for="exampleRadios2-1">
            User
          </label>
        </div>
      </div>

      <% } else if(u.getUserType().equalsIgnoreCase("User")) {%>
      <div class="form-outline mb-4">
        <label class="form-label" for="exampleFormControlSelect1">User Type</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="userType" id="exampleRadios1-2" value="Admin" >
          <label class="form-check-label" for="exampleRadios1-2">
            Admin
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="userType" id="exampleRadios2-2" value="User" checked>
          <label class="form-check-label" for="exampleRadios2-2">
            User
          </label>
        </div>
      </div>

      <% } %>

      <!-- Checkbox -->
      <%if(u.getAccount().equalsIgnoreCase("yes")){ %>
      <div class="form-check d-flex justify-content-center mb-4">
        <div>
          <input class="form-check-input me-2" type="checkbox" value="yes" id="form6Example" name="account" checked required/>
          <label class="form-check-label" for="form6Example8"> Create an account? </label>
        </div>
      </div>
      <% } else {%>
      <div class="form-check d-flex justify-content-center mb-4">
        <div>
          <input class="form-check-input me-2" type="checkbox" value="yes" id="form6Example8" name="account" required/>
          <label class="form-check-label" for="form6Example8"> Create an account? </label>
        </div>
      </div>
      <% } %>

      <!-- Submit button -->
      <div class="d-flex justify-content-between mb-2">
        <div><a href="posts.jsp">Cancel</a></div>
        <div><button type="submit" value="Edit Post" class="btn btn-primary">Edit</button></div>
      </div>
    </form>
  </div>
</div>
</body>
</html>
