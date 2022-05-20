<%@page import="my.dto.MyDto"%>
<%@page import="java.util.List"%>
<%@page import="my.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	int num=0;
	List<MyDto> list=MyDao.getiInstance().getList();
	boolean isSucess = MyDao.getiInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<script>
	function updateBtn(){
		let radio= document.querySelector('[name=radio]:checked');
		if(radio==null){
		alert("수정할 컨텐츠를 체크 하세요")
		return;
		}
		location.href= "updateform.jsp?num="+radio.value;
	}
</script>

</head>

<body>
<a href="insertform.jsp">추가</a> 

<form action="multidel.jsp" method="post" id="multidelete">

<table class="  table table-hover table-bordered border-dark"">

	<thead>
		<tr  class="  bg-primary  text-light bg-opacity-50 table-bordered border-dark">
			<td class="">번호</td>
			<td class="">이름</td>
			<td class="">할일</td>
			<td class="">특이사항</td>
			<td class="">날짜</td>
			<td class="">수정</td>
			<td >삭제</td>
		</tr>
	</thead>
	
	<tbody>
		<%for (MyDto tmp:list){ %>
			<tr >
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getWork() %></td>
				<td><%=tmp.getIssue() %></td>
				<td><%=tmp.getDate() %></td>
				<td><input class="form-check-input" type="radio" name="radio" value="<%=tmp.getNum()%>"/></td>
				<td><input class="form-check-input" type="checkbox" name="check" value="<%=tmp.getNum()%>"/></td>				
			</tr>
		<%} %>
	</tbody>
</table>
<input type="submit" value="체크삭제" /> 
</form> 
<button onclick="updateBtn()">수정</button>


</body>
</html>