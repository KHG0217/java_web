<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style>
	.navbar-brand{
		transition: transform 0.4s ease-out;
	}
	
	.navbar-brand:hover{
		transform: rotate(-10deg) scale(1.1);
	}
</style>
</head>
<body>
	<%--
		포함 시킬 jsp 페이지의 위치를 page 요소의 값으로 넣어준다
		/ 는 바로 webapp 폴더가 된다.
		이렇게 포함시키면 index.jsp 페이지와 navbar.jsp 페이지가 공동으로
		클라이언트에게 응답을 하게 된다.
		
		포함시킬 페이지에 파라미터를 전할 수 있다.
		
		thisPage라는 파라미터명으로 index라는 문자열을 전달하는 방법은 아래와 같다.
		
		< jsp:param value="index" name="thisPage"/>
	 --%>
	<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
	</jsp:include>		
	
	<div class="card text-dark bg-light mb-3" style="width: 30rem;">
  		<img src="http://www.sisaweek.com/news/photo/201805/107739_89480_4548.png" class="card-img-top img-fluid" alt="...">

  	<div class="card-body">
    	<h5 class="card-title">회원정보</h5>
    	<p class="card-text"></p>
    	<a href="member/list.jsp" class="btn btn-primary">보기</a>
  </div>
</div>
<div class="card" style="width: 30em;" aria-hidden="true">
  <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile23.uf.tistory.com%2Fimage%2F01269F5051CED76108F803" class="card-img-top" alt="...">
  	<div class="card-body">
    	<h5 class="card-title">오늘의 할일</h5>
    	<p class="card-text"></p>
    	<a href="todo/list.jsp" class="btn btn-primary">보기</a>
  </div>

	
</body>
</html>