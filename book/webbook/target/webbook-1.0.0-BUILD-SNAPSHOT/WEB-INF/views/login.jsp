<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>로그인</title>
</head>
<body>
<div class="container mt-5">
    <form name="login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">이메일</label>
            <input type="email" class="form-control" name="email" id="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" name="password" id="password" required>
        </div>
        <div class="d-grid gap-2">
            <button type="button" class="btn btn-primary" id="login_chk">로그인</button>
            <button type="button" class="btn btn-primary" onclick="location.href='/user/sign_up'">회원가입</button>
        </div>
        <c:if test="${data == 'error'}">
            <div class="mt-3 text-danger">
                이메일 및 비밀번호가 일치하지 않습니다.
            </div>
        </c:if>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
    $(function () {
        $("#login_chk").click(function () {
            var email = $("#email").val(); // 태그에 입력한 값
            var password = $("#password").val();
            document.login.action = "/user/login_check";
            document.login.submit(); // submit을 이벤트 객체를 통해 변경 가능한것을 보여주는것
        });
    });
</script>
</body>
</html>