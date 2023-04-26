<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>대여하기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="row mb-3">
                    <div class="col-lg-12">
                        <h1 class="page-header">책 상세정보</h1>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">책 번호:</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" name="book_id" id="book_id" readonly
                                       value="${book.book_id}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="title" class="col-sm-2 col-form-label">제목 : </label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" name="title" id="title"
                                       value="${book.title}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="author" class="col-sm-2 col-form-label"> 저자 : </label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" name="author" id="author"
                                       value="${book.author}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="published_date" class="col-sm-2 col-form-label">발행일 : </label>
                            <div class="col-sm-10">
                                <input class="form-control" type="date" name="published_date" id="published_date"
                                       value="${book.published_date}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="available_count" class="col-sm-2 col-form-label">대여가능 수 : </label>
                            <div class="col-sm-10">
                                <input class="form-control" type="number" name="available_count"
                                       id="available_count" value="${book.available_count}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <form id="form1" name="form1" method="post">
                                <div class="col-sm-10 offset-sm-2">
                                    <c:if test="${book.available_count>0}">
                                        <button type="button" class="btn btn-primary" id="btnUpdate" onclick="rent()">
                                            대여하기
                                        </button>
                                    </c:if>
                                    <c:if test="${book.available_count == 0}">
                                        <p>대여가능 횟수 없음</p>
                                    </c:if>
                                    <button type="button" class="btn btn-danger" id="btnDelete" onclick="returnBook()" >반납하기</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    let book_id = $("#book_id").val();

    function rent() {
        alert("대여완료")
        document.form1.action="/rental/detail?rent=" + book_id;
        document.form1.submit();
    }
    function returnBook() {
        alert("반납완료");
        document.form1.action="/rental/return?return=" + book_id;
        document.form1.submit();
    }

</script>

</body>
</html>