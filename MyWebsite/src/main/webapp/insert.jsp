<%@page import="my.dao.MyDao"%>
<%@page import="my.dto.MyDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name =request.getParameter("name");
	String work =request.getParameter("work");
	String issue =request.getParameter("issue");
	
	MyDto dto= new MyDto();
	dto.setName(name);
	dto.setWork(work);
	dto.setIssue(issue);
	
	boolean isSuccess=MyDao.getiInstance().insert(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<script>
		alert("<%=name%>의 할일이 추가되었습니다.")	
		location.href="list.jsp";
	</script>
								
		<%}else{ %>
			<strong>실패!</strong>
		<a href="${pageContext.request.contextPath}/insertform.jsp">다시시도</a>
		<%} %>
	</div>

</body>
</html>