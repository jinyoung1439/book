<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>책 생성하기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $("#btnWrite").click(function(){
        location.href="book/create";

    });
</script>

<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">도서관리</h1>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <a href="/book/create" class="btn btn-primary btn-md pull-right">
                        <i class="fa fa-edit fa-fw"></i> 도서 작성
                    </a>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">도서 리스트</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>책 번호</th>
                                <th>제목</th>
                                <th>저자</th>
                                <th>발행일</th>
                                <th>대여가능 수</th>
                                <th>최초등록일</th>
                                <th>업데이트날짜</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="row" items="${list}">
                                <tr>
                                    <td>${row.book_id}</td>
                                    <td><a href="/book/detail?book_id=${row.book_id}">${row.title}</a></td>
                                    <td>${row.author}</td>
                                    <td>${row.published_date}</td>
                                    <td>${row.available_count}</td>
                                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${row.create_date}"/></td>
                                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${row.update_date}" /></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<script src="/resources/js/common/layout.js"></script>--%>
</body>
</html>