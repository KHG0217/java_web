<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	List<CafeDto> list=CafeDao.getInstance().getList();
	
	//한 페이지에 몇개씩 표시
	final int page_row_count=3;
	//하단 페이지를 몇개씩 표시
	final int page_display_count=3;
	
	//보여줄 페이지의 번호를 1로 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어보기
	String strPageNum=request.getParameter("pageNum");
	//페이지 번호가 파라미터로 넘어 왔다면
	if(strPageNum != null){
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//계산식
	//보여줄 페이지의 시작 RowNum
	int startRowNum=1+(pageNum-1)*page_row_count;
	//보여줄 페이지의 끝 RowNum
	int endRowNum=pageNum*page_row_count;
	
	//하단 시작 페이지 번호
	int startPageNum = 1 + ((pageNum-1)/page_display_count)*page_display_count;
	
	//하단 끝 페이지 번호
	int endPageNum = startPageNum+page_display_count-1;
	
	//전체 글의 갯수
	//int totalRow=
	
	//페이지 갯수 구하기
	
	//
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>글 목록 입니다.</h1>
		<table class="table table- stripted ">
			<thead class="table-primary">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>

			<tbody>
				<%for(CafeDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter()%></td>
						<td>
							<a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a>							
						</td>
						<td><%=tmp.getViewCount()%></td>
						<td><%=tmp.getRegdate()%></td>
					</tr>
				
				<%} %>
			</tbody>
		</table>
		
		<a href="${pageContext.request.contextPath}/cafe/private/insertform.jsp">새글 작성</a>
	</div>
	
	<nav>
		<ul class="pagination">
			<%if(startPageNum != 1){ %>
				<li class="page-item">
				<a href="list.jsp?pageNum=<%=startPageNum-1%>">Prev</a>
				</li>
			<%} %>
		</ul>
	</nav>
</body>
</html>