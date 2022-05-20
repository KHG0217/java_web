<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String content=request.getParameter("todo");
	
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	
	TodoDao dao=TodoDao.getInstance();
	boolean isSuccess=dao.insert(dto);
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
		<p>
			새로운 <strong><%=content %></strong> 일이 추가되었습니다.
			<a href="list.jsp">확인</a>
		</p>
		<%}else{ %>
			<p>
				추가 실패!
				<a href="insertfrom.jsp">다시시도</a>
			</p>
			<%} %>
	</div>
</body>
</html>