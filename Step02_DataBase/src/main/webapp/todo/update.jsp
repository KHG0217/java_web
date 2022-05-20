<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");

	
	TodoDto dto=new TodoDto(num,content,null);
	boolean isSuccess=TodoDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="contaniner">
		<h1>알림</h1>
		<%if(isSuccess){ %>
		<p>
			<strong><%=num %></strong>번의 할일이 수정 되었습니다.
			<a href="list.jsp">확인</a>
		</p>
		<%}else{ %>
			<p>
				수정실패! <a href="updateform.jsp?num=<%=num%>">다시시도</a>
			</p>
		<%} %>
	</div>
</body>
</html>