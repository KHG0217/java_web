<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDto member=(MemberDto)request.getAttribute("dto");
%>
	<p>번호:<%=member.getNum() %></p>
	<p>이름:<%=member.getName() %></p>
	<p>주소:<%=member.getAddr() %></p>
</body>
</html>