<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//이 navbar.jsp 페이지가 어디에 include 되었는지 읽어와 보기
    	String thisPage=request.getParameter("thisPage"); //index |member |todo
    	

    %>
    <!-- navbar의 배경색이 밝은색 계열이면 navbar-light 어두운색 계열이면 navbar-dark 클래스를
    	지정해 놓으면 링크텍스트가 잘 보이게 알아서 설정된다.
     -->
	<nav class="navbar navbar-dark navbar-expand-md text-bg-success">
      <div class="container">
         <a class="navbar-brand " href="${pageContext.request.contextPath}/index.jsp">
           <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" class="d-block my-1" viewBox="0 0 118 94" role="img"><title>Bootstrap</title><path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z" fill="currentColor"></path></svg>
         </a>
         <!-- 
         	bootstrap에서 data-bs-xxx 형태의 속성을 작성해야 하는 경우도 있다.
         	해당속성을 잘 작성해야 UI가 어떤 동작을 하게 된다.
         	data-bs-xxx="속성값" 여기에서 속성값은 정해진것을 그대로 작성해야 하는 경우도 있고
         	아니면 상황에 따라 적당한 값을 제공해야 할때도 있다.
         	ex)
         	data-bs-target="선택자"
         	선택자 => 접었다 폈다 할 대상을 선택할 선택자(css 선택자와 동일)
          -->
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
             data-bs-target="#navbarNav"><!-- # id="navbarNav"를 가르키는건 -->
               <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
               <ul class="navbar-nav flex-glow-1">
                  <li class="nav-item">
                      <a class="nav-link <%=thisPage.equals("member")? "active":"" %>"href="${pageContext.request.contextPath}/member/list.jsp">Member</a>
                 </li>
              
                 <li class="nav-item">
                      <a class="nav-link <%=thisPage.equals("todo")? "active":"" %>"href="${pageContext.request.contextPath}/todo/list.jsp">todo</a>
                 </li>
               </ul>
               <div class="w-100 clearfix">
                  <a class="btn btn-light btn-sm float-end ms-1" href="#">회원가입</a>
                  <a class="btn btn-light btn-sm float-end" href="#">로그인</a>
               </div>
          </div>
      </div>
   </nav>