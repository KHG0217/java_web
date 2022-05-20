<%@page import="java.time.LocalDate"%>
<%@page import="my.dto.MyDto"%>
<%@page import="my.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num =Integer.parseInt(request.getParameter("num"));
	MyDto dto=MyDao.getiInstance().getData(num);
	
	Object now=LocalDate.now();
	String nowDate=String.valueOf(now);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/updateform.jsp</title>
</head>
<body>
	<form action="update.jsp" method="posr">
		<input type="hidden" name="num" value="<%=num %>" />
		<div>
			<label for="num">번호</label>
			<input type="text" id="num" value="<%=num %>" disabled/>		
		</div>
		
		<div>
			<label for="name">이름</label>
			<input type="text" id="name" name="name" value="<%=dto.getName() %>"/>		
		</div>
		
		<div>
			<label for="work">할일</label>
			<input type="text" id="work" name="work" value="<%=dto.getWork() %>"/>		
		</div>
		
		<div>
			<label for="issue">특이사항</label>
			<input type="text" id="issue" name="issue" value="<%=dto.getIssue() %>"/>		
		</div>
		
		<div>
			<label for="date">날짜</label>
			<input type="text" id="date" name="date" value="<%=nowDate %>" disabled/>		
		</div>
		<button type="submit">확인</button>
		<button type="reset">초기화</button>
		<a href="${pageContext.request.contextPath}/list.jsp">취소</a>
		
	</form>
	
</body>
</html>