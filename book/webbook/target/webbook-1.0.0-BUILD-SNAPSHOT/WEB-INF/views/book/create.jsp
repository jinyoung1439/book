<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>책 등록하기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#btnSave").click(function(){
		document.form1.submit();

	});
</script>

<body>
<%--<%@ include file="/WEB-INF/views/common/layout.jsp" %>--%>
<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row justify-content-center"><!-- 게시판 중앙 정렬 -->
			<div class="col-lg-8"><!-- 게시판 넓이 -->
				<div class="card shadow mb-4"><!-- 카드형 디자인 적용 -->
					<div class="card-header py-3"><!-- 카드 헤더 -->
						<h1 class="m-0 font-weight-bold text-primary">책 등록</h1>
					</div>
					<div class="card-body"><!-- 카드 본문 -->
						<form id="form1" name="form1" method="post" action="/book/insert">
							<div class="form-group">
								<label for="title">제목</label>
								<input class="form-control" name="title" id="title" placeholder="제목을 입력하세요.">
							</div>
							<div class="form-group">
								<label for="author">저자</label>
								<input class="form-control" name="author" id="author" placeholder="저자를 입력하세요.">
							</div>
							<div class="form-group">
								<label for="published_date">발행일자</label>
								<input class="form-control" type="date" name="published_date" id="published_date">
							</div>
							<div class="form-group">
								<label for="available_count">대여가능 수</label>
								<input class="form-control" type="number" minlength="0" name="available_count" id="available_count">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">등록하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%--<script src="/resources/js/common/layout.js"></script>--%>
</body>
</html>