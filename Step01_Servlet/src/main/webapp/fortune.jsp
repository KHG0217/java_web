<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] fortunes= {
		"동쪽으로 가면 귀인을 만나요",
		"로또를 사면 1등이 될거에요.",
		"먹을 복이 있어요",
		"어째....",
		"저째...."
		
};

Random ran = new Random();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>오늘의운세: <strong><%=fortunes[ran.nextInt(5)] %></strong></p>
</body>
</html>