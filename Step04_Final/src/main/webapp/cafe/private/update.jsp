<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	CafeDto dto=CafeDao.getInstance().getData(num);
	
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = CafeDao.getInstance().update(dto);	
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
			alert("글이 수정되었습니다.");
			location.href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=num%>";
			
		</script>
	<%}else{ %>
		alert("글 수정에 실패하였습니다");
		location.href="${pageContext.request.contextPath }/cafe/private/updateform.jsp?num=<%=num%>";
	<%} %>
</body>
</html>