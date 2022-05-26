<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int num= Integer.parseInt(request.getParameter("num"));
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>글 수정하기</h1>
		<form action="update.jsp?num=<%=num %>" method="post">
			<div class="mb-2">
				<label for="title" class="form-label">수정 제목</label>
				<input type="text" class="form-control" name=title id=title />
			</div>
			
			<div class="mb-2">
				<label for="title" class="form-label">수정 내용</label>
				<textarea class="form-control" name="content" id="content" ></textarea>
			</div>
			<button class="btn btn-primary btn-sm" type="submit">저장</button>
		</form>
	</div>
</body>
</html>