<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩 설정
	request.setCharacterEncoding("utf-8");

	//1. form 전송되는 수정할 회원의 정보를 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//2. DB에 수정 반영하고
	MemberDto dto = new MemberDto(num,name,addr);
	boolean isSuccess=MemberDao.getInstance().update(dto);
	//3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<div class="contaniner">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				<strong><%=num %></strong>번 회원의 정보를 수정 했습니다.
				<a href="list.jsp">확인</a>
			</p>
			<%}else{ %>
				<p>
					수정 실패! <a href="updateform.jsp?num=<%=num%>">다시시도</a>
				</p>
			<%} %>
	</div>
</body>
</html>