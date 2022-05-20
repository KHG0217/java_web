<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//java service()메소드역역
	request.setCharacterEncoding("utf-8");
	String msg=request.getParameter("msg");
	
	//System.out.println("msg:"+msg);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>send.jsp</title>
</head>
<body>
	<p>오잉 이게 뭐지?</p>
	<p><%=msg %></p>
</body>
</html>