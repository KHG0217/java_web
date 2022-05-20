<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 깨지지 않도록 설정
	request.setCharacterEncoding("utf-8");

	//1. 폼 전송되는 이름과 주소를 읽어온다.
	//                         input name=""
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//2. DB에 저장한다.
	MemberDto dto= new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.insert(dto);
	//3. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p class="alert alert-success">
				<strong><%=name %></strong>님의 정보를 추가 했습니다.
				<a href="list.jsp" class="alert-link">확인</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				회원추가 실패!
				<a href="insertform.jsp" class="alert-link" >다시시도</a>
			</p>
		<%} %>
	</div>	
</body>
</html>