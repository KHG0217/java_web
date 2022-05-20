<%@page import="my.dto.MyDto"%>
<%@page import="my.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String work=request.getParameter("work");
String issue=request.getParameter("issue");


MyDto dto=new MyDto(num,name,work,issue,null);


boolean isSuccess=MyDao.getiInstance().update(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("<%=name %> 의 정보가 수정되었습니다.")	
		location.href="list.jsp";
	</script>

<%}else{ %>
	<strong><%=name %></strong>의 정보 수정 실패!
	<a href="${pageContext.request.contextPath}/updateform.jsp?num=<%=num%>">다시시도</a>
<%} %>
</body>
</html>