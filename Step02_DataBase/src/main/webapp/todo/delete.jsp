<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));

	boolean isSuccess=TodoDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>알림</h1>
	<%if(isSuccess){ %>
	<script>
		alert("할일이 삭제되었습니다.")
		location.href="list.jsp";
	</script>
	
	<%}else{ %>
		alert("삭제 실패!")
		location.herf="list.jsp";
	<%} %>
</div>
</body>
</html>