<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>책 생성하기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%--	<link rel="stylesheet" href="/resources/css/style.css"/>--%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$("#btnSave").click(function(){
		// let category = document.form1.category.value;
		// if(category!="N"){
		// 	alert("공지사항 카테고리는 N입니다")
		// 	document.form1.category.focus();
		// 	return;
		// }
		document.form1.submit();

	});
</script>

<body>
<%--<%@ include file="/WEB-INF/views/common/layout.jsp" %>--%>
<div class="page-wrapper">
	<div class="container-fluid">
		<div class="col-lg-8"><!--게시판 넓이 -->
			<div class="col-lg-12">
				<h1 class="page-header">책 등록</h1>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">작성란 </div>
				<div class="panel-body">
					<form id="form1" name="form1" method="post" action="/book/insert">
<%--						<div>--%>
<%--							<input name="book_id" id="book_id">--%>
<%--						</div>--%>
						<div>
							<input name="title" id="title" size="80" placeholder=" 제목을 입력하세요.">
						</div>
						<div>
							<input name="author" id="author" size="80" placeholder="저자를 입력하세요">
						</div>
						<div>
							<label for="published_date">발행일자</label>
							<input type="date" name="published_date" id="published_date" >
						</div>
						<div>
							<label for="available_count">대여가능 수</label>
							<input type="number" minlength="0" name="available_count" id="available_count">
						</div>
						<div style="width:700px; text-align:center;">
							<button style="button" id="btnSave">등록하기</button>
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