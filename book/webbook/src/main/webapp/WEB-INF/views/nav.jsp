<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Navigation Bar</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Book Store</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="/book/list">책 리스트</a></li>
        <li><a href="/rental/list">대여</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <% if (session.getAttribute("email") == null) { %>
        <li><a href="/user/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        <% } else { %>
        <li><a href="/user/detail"><span class="glyphicon glyphicon-log-in" ></span>마이페이지</a></li>
        <li><a href="/user/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>

</body>
</html>