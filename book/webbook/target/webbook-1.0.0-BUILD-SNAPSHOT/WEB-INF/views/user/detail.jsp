<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        var originalName = $("#username").val();
        var originalPassword = $("#password").val();
        $("#btnUpdate").click(function () {
            var currentName = $("#name").val();
            var currentPassword = $("#password").val();
            if (currentName !== originalName || currentPassword !== originalPassword) {
                document.form1.action = "/user/update";
                document.form1.submit();
            }
        });
        $("#btnDelete").click(function () {
            if (confirm("회원 탈퇴 하시겠습니까?")) {
                document.form1.action = "/user/delete";
                document.form1.submit();
            }
        });
    });
</script>

<body>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="row mb-3">
                    <div class="col-lg-12">
                        <h1 class="page-header">회원 상세정보</h1>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <form id="form1" name="form1" method="post">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">회원 번호:</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" name="user_id" readonly
                                           value="${dto.user_id}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="username" class="col-sm-2 col-form-label">이름 : </label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" name="username" id="username"
                                           value="${dto.username}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 col-form-label">이메일 : </label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" name="email" id="email"
                                           value="${dto.email}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 col-form-label"> 비밀번호 : </label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="text" name="password" id="password"
                                           value="${dto.password}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="create_time" class="col-sm-2 col-form-label">가입일자 :</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="date" name="create_time" id="create_time"
                                           value="${dto.create_time}" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10 offset-sm-2">
                                    <button id="btnUpdate" type="button" class="btn btn-primary">수정</button>
                                    <button id="btnDelete" type="button" class="btn btn-danger">회원탈퇴</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
