<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//1.파일목록을 얻어와서
 	List<FileDto> list= FileDao.getInstance().getList();
 	//2.응답하기
	
 	//세션 영역의 id를 읽어와 본다
	String id=(String)session.getAttribute("id");

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>자료실 목록 입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>크기</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(FileDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a></td>
					<td><%=tmp.getFileSize() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
					<%if(tmp.getWriter().equals(id)){ %>
						<a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
					<%} %>
					
				</tr>
			
			<%} %>
			</tbody>
		</table>
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하러 가기</a>
	</div>
</body>
</html>