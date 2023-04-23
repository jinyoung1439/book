<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/style.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function() {
    var originalTitle = $("#title").val();
    var originalAuthor = $("#author").val();
    var originalPublished_date = $("#published_date").val();
    var originalAvailable_count = $("#available_count").val();
    $("#btnUpdate").click(function(){
      var currentTitle = $("#title").val();
      var currentAuthor = $("#author").val();
      var currentPublished_date = $("#published_date").val();
      var currentAvailable_count = $("#available_count").val();
      if (currentTitle !== originalTitle || currentAuthor !== originalAuthor
              || currentPublished_date !== originalPublished_date
              || currentAvailable_count !== originalAvailable_count) {
        document.form1.action="/book/update";
        document.form1.submit();
      }
    });
    $("#btnDelete").click(function(){
      if(confirm("공지를 삭제하시겠습니까?")){
        document.form1.action="/book/delete";
        document.form1.submit();
      }
    });
  });
</script>

<body>
<%--<%@ include file="/WEB-INF/views/common/layout.jsp" %>--%>
<div class="page-wrapper">
  <div class="container-fluid">
    <div class="col-lg-8">
      <div class="col-lg-12">
        <h1 class="page-header">책 상세내역</h1>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">상세 수정 </div>
        <div class="panel-body">
          <form id="form1" name="form1" method="post">
            <div class="form-control mb-3"> 책 번호 :
              <input type="hidden" name="book_id" value="${dto.book_id}"/>${dto.book_id}</div>
            <div class="form-control col-lg-3">
              제목 : <input name="title" id="title" value="${dto.title}">
            </div>
            <div class="form-control">
              저자 :<input  name="author" id="author" value="${dto.author}">
            </div>
            <div> 발행일 :
            <input type="date" name="published_date" id="published_date" value="${dto.published_date}">
            </div>
            <div> 대여가능 수 :
              <input type="number" name="available_count" id="available_count" value="${dto.available_count}">
            </div>
              <div style="width:700px; text-align:center;">
              <button type="button" id="btnUpdate">수정</button>
              <button type="button" id="btnDelete">삭제</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<%--<script src="/resources/js/common/layout.js"></script>--%>
</body>
</html>