<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	 	<h1>회원추가양식</h1>
	 	<form action="insert.jsp" method="post">
	 	<label for="name">이름</label> 	
	 	<input type="text" name="name" id="name"/>
	 	
	 	<label for="work">할일</label> 	
	 	<input type="text" name="work" id="work"/>
	 	
	 	<label for="isuue">특이사항</label> 	
	 	<input type="text" name="issue" id="issue"/>
	 	
	 	<label for="date">날짜</label>
	 	<input type="text" name="date" id="date"/>
	 	
	 	<button type="sumit">확인</button>

	 	
	 	</form>
	</div>
</body>
</html>