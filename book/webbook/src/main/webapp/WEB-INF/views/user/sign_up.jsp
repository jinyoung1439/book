<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>
    $(document).ready(function() {
        $('form').submit(function(e) {
            var username = $('#username').val();
            var email = $('#email').val();
            var password = $('#password').val();
            var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

            if (!emailRegex.test(email)) {
                alert('유효한 이메일 주소로 입력해주세요');
                e.preventDefault();
            }

            // 이메일 중복 확인 ajax
            $.ajax({
                url: '/user/email_chk',
                type: 'POST',
                data: { email: email },
                success: function(result) {
                    if (result == "false") {
                        alert('이미 가입된 이메일 주소입니다.');
                        e.preventDefault();
                        return;
                    } else {
                        alert('회원가입이 완료되었습니다.');
                    }
                },
                error: function() {
                    alert('잘못된 정보입니다. 다시 입력해주세요 ');
                    e.preventDefault();
                }
            });
        });
    });
</script>
<body>
<form action="/user/sign_up" method="post" class="mx-auto my-4 col-12 col-md-6">
    <h2 class="text-center mb-4">회원가입</h2>
    <div class="form-group">
        <label for="username">사용자 이름:</label>
        <input type="text" id="username" name="username" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" class="form-control" required>
    </div>
    <div class="text-center">
        <button type="submit" class="btn btn-primary">회원가입</button>
    </div>
</form>

</body>
</html>
