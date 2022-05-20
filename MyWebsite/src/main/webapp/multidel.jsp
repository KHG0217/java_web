<%@page import="my.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf=8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String[] ck =request.getParameterValues("check");
	
	MyDao dao= MyDao.getiInstance();
	int res = dao.multiDelete(ck);
	
	if(res==ck.length){%>
		<script type="text/javascript">
			alert("체크된 정보 모두 삭제 성공")
			location.href="list.jsp";
		</script>
		<%}else if(ck.length==0){ %>
		<script type="text/javascript">
			alert("체크된 정보 모두 삭제 실패")
			location.href="list.jsp";
		</script>
		
		<%} %>		


</body>
</html>