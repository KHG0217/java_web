<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style>
   .navbar-brand{
      transition: transform 0.2s ease-out;
      transform: rotate(-10deg) scale(1.1);
   }

   .navbar-brand:hover{
      transform: rotate(-10deg) scale(1.);
   }
</style>
</head>
<body>
   <%--
      포함 시킬 jsp 페이지의 위치를 page 요소의 값으로 넣어준다
      / 는 바로 webapp 폴더가 된다. 
      이렇게 포함시키면 index.jsp 페이지와 navbar.jsp 페이지가 공동으로 클라이언트에게 응답을 하게 된다. 
      
      포함시킬 페이지에 파라미터를 전달할수 있다 
      
      thisPage 라는 파라미터명으로 index 라는 문자열을 전달하는 방법은 아래와 같다 
      
      <jsp:param value="index" name="thisPage"/>
      
      
    --%>
   <jsp:include page="/include/navbar.jsp">
      <jsp:param value="index" name="thisPage"/>
   </jsp:include>
   <div class="container">
      <h1>인덱스 페이지 입니다.</h1>
      <p>현재 context path : <strong>${pageContext.request.contextPath }</strong></p>
      <ul>
         <li><a href="member/list.jsp">회원 목록 보기</a></li>
         <li><a href="todo/list.jsp">할일 목록 보기</a></li>
      </ul>
      <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
           <div class="carousel-indicators">
             <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
             <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
             <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
           </div>
           <div class="carousel-inner">
             <div class="carousel-item active">
                  <img src="images/top01.jpg" class="d-block w-100" alt="...">
             </div>
             <div class="carousel-item">
                  <img src="images/top02.jpg" class="d-block w-100" alt="...">
             </div>
             <div class="carousel-item">
                  <img src="images/top03.jpg" class="d-block w-100" alt="...">
             </div>
           </div>
           <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
             <span class="carousel-control-prev-icon" aria-hidden="true"></span>
             <span class="visually-hidden">Previous</span>
           </button>
           <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
             <span class="carousel-control-next-icon" aria-hidden="true"></span>
             <span class="visually-hidden">Next</span>
           </button>
      </div>
      
	      <div class="row">
		      	<div class="col-12 col-md-6 col-lg-3"> <!-- 12등분의 3 -->
		      		<div class="card">
	  					<img src="images/image1.png" class="card-img-top" alt="...">
	  					<div class="card-body">
	    					<h5 class="card-title">Card title</h5>
	    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	    					<a href="#" class="btn btn-primary">Go somewhere</a>
	  					</div>
					</div>
			    </div>
			    
			    <div class="col-12 col-md-6 col-lg-3"> <!-- 12등분의 3 -->
		      		<div class="card">
	  					<img src="images/image4.png" class="card-img-top" alt="...">
	  					<div class="card-body">
	    					<h5 class="card-title">Card title</h5>
	    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	    					<a href="#" class="btn btn-primary">Go somewhere</a>
	  					</div>
					</div>
			    </div>
			    
			    <div class="col-12 col-md-6 col-lg-3"> <!-- 좁을때 12/12 중간 12/6 12/3 -->
		      		<div class="card">
	  					<img src="images/image2.png" class="card-img-top" alt="...">
	  					<div class="card-body">
	    					<h5 class="card-title">Card title</h5>
	    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	    					<a href="#" class="btn btn-primary">Go somewhere</a>
	  					</div>
					</div>
			    </div>
			    
			    <div class="col-12 col-md-6 col-lg-3"> <!-- 12등분의 3 -->
		      		<div class="card">
	  					<img src="images/image3.png" class="card-img-top" alt="...">
	  					<div class="card-body">
	    					<h5 class="card-title">Card title</h5>
	    					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	    					<a href="#" class="btn btn-primary">Go somewhere</a>
	  					</div>
					</div>
			    </div>
		  
		  </div>
   </div>
   <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>


















