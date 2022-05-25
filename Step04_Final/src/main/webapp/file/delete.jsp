<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.삭제할 파일 번호를 읽어온다
	int num =Integer.parseInt(request.getParameter("num"));
	//2.해당 파일의 정보를 DB에서 읽어온다.
	FileDto dao=FileDao.getInstance().getData(num);
	//3. 파일 시스템에서 삭제한다.(weabapp/upload 폴더에서 해당 파일을 삭제)
	String realPath=application.getRealPath("/upload");
	File file=new File(realPath+"\\"+dao.getSaveFileName());
	file.delete();
	//4. DB에서도 해당 파일의 정보를 삭제 한다.
	boolean isSuccess = FileDao.getInstance().delete(num);
	//5. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(isSuccess){ %>
	<p>
		<%=dao.getNum() %>의 파일을 삭제하였습니다!
		<a href="${pageContext.request.contextPath}/file/list.jsp">list로 가기</a>
		경로확인:<%=realPath %>
		이름확인:<%=dao.getSaveFileName() %>
	</p>
<%}else{ %>
	<%=dao.getNum() %>의 파일 삭제를 실패하였습니다.
	<a href="${pageContext.request.contextPath}/file/list.jsp">다시시도</a>
<%} %>

</body>
</html>