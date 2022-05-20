<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/logout.jsp</title>
</head>
<body>
<%
	String nick=(String)session.getAttribute("nick");

	//세션 영역에 "nick"이라는 키값으로 저장된값 삭제하기
	session.removeAttribute("nick");
	//session.invalidate(); //세션 초기화도 가능
%>
	<p><strong><%=nick %></strong></p>님 로그아웃 되었습니다.
	<a href="${pageContext.request.contextPath}/">인덱스로 가기</a>
	
</body>
</html>