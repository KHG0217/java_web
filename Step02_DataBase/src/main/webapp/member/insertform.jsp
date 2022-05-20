<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
   <jsp:include page="/include/navbar.jsp">
      <jsp:param value="member" name="thisPage"/>
   </jsp:include>
   <div class="container">
      <nav class="mt-2">
         <ol class="breadcrumb">
            <li class="breadcrumb-item">
               <a href="${pageContext.request.contextPath }/index.jsp">Home</a>
            </li>
            <li class="breadcrumb-item">
               <a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
            </li>
            <li class="breadcrumb-item active">회원 추가 페이지</li>
         </ol>
      </nav>
      <div class="row">
         <div class="col-12 col-md-6 offset-md-3">
            <h1>회원 추가 양식</h1>
            <form action="insert.jsp" method="post">
               <div class="mb-2">
                  <label class="form-label" for="name">이름</label>
                  <input class="form-control" type="text" name="name" id="name"/>
               </div>
               <div class="mb-2">
                  <label class="form-label" for="addr">주소</label>
                  <input class="form-control" type="text" name="addr" id="addr"/>
               </div>
               <button class="btn btn-primary" type="submit">추가</button>
            </form>
         </div>
      </div>
   </div>
</body>
</html>





