<%@page import="my.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String name=MyDao.getiInstance().getData(num).getName();
	boolean isSuccess = MyDao.getiInstance().delete(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/delete</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("<%=name%>의 할일이 삭제되었습니다.")	
		location.href="list.jsp";
	</script>
	
<%}else{ %>
		<script>
		alert("<%=name%>의 할일 삭제실패!")
		location.href="list.jsp";
	</script>
<%} %>
</body>
</html>