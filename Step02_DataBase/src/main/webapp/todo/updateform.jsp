<%@page import="java.time.LocalDate"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int num=Integer.parseInt(request.getParameter("num"));
	TodoDto dto=TodoDao.getInstance().getData(num);
	
	Object now=LocalDate.now();
	String a=String.valueOf(now);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<h1>할일 정보</h1>
	<form action="update.jsp" method="post">
	<input type="hidden" name="num" value="<%=num %>" />
	<div>
		<label for="num">번호</label>
		<input type="text" id="num" value="<%=num %>" disabled/>
	</div>
	
	<div>
		<label for="content">할일</label>
		<input type="text" name="content" id="content" value="<%=dto.getContent()%>" />
	</div>
	
	<div>
		<label for="regdate">시간</label>
		<input type="text" id="regdate" value="<%=a%>"disabled />
	</div>
	<button type="submit">수정확인</button>
	<button type="reset">취소</button>
	
	</form>
</div>
</body>
</html>