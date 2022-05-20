<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //클라이언트에게 출력할 회원 목록 얻어오기 
   List<MemberDto> list=MemberDao.getInstance().getlist();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
   <jsp:include page="/include/navbar.jsp">
      <jsp:param value="member" name="thisPage"/>
   </jsp:include>
   <div class="container">
      <h1>회원 목록 입니다.</h1>
      <table class="table table-striped">
         <thead class="table-dark">
            <tr>
               <th>번호</th>
               <th>이름</th>
               <th>주소</th>
               <th>수정</th>
               <th>삭제</th>
            </tr>
         </thead>
         <tbody>
         <%for(MemberDto tmp:list){ %>
            <tr>
               <td><%=tmp.getNum() %></td>
               <td><%=tmp.getName() %></td>
               <td><%=tmp.getAddr() %></td>
               <td>
                  <a href="updateform.jsp?num=<%=tmp.getNum()%>">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                       <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                       <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                     </svg>
                  </a>
               </td>
               <td>
                  <a href="javascript:confirmDelete(<%=tmp.getNum()%>);">
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                            <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                     </svg>
                  </a>
               </td>
            </tr>
         <%} %>   
         </tbody>
      </table>
      <!-- 회원 추가 링크 -->
      <a data-bs-toggle="tooltip" title="회원 추가"  href="insertform.jsp">
         <svg xmlns="http://www.w3.org/2000/svg" width="2rem" height="2rem" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
              <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
              <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
         </svg>
      </a>
      
      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog">
             <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">알림</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     <strong id="targetNum"></strong> 번 회원을 삭제 하시겠습니까?
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
                    <button id="yesBtn" type="button" class="btn btn-primary">네</button>
                  </div>
             </div>
           </div>
      </div>
   </div>
   <script>
      // data-bs-toggle="tooltip" 속성을 가지고 있는 모든 요소의 참조값을 배열에 담아오기 
      const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
      // 배열에 저장된 모든 요소에 tooltip 이 가능하도록 설정 
      const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
   
      const modal = new bootstrap.Modal('#exampleModal');   
      
      //삭제할 번호를 담을 전역변수 
      let targetNum;
    
      
      //삭제 관련 작업을 하는 함수 
      function confirmDelete(num){
         //함수에 전달된 삭제할 회원의 번호를 modal 에 출력한다. 
         document.querySelector("#targetNum").innerText=num;
         //모달을 띄운다. 
         modal.show();
         //삭제할 회원의 번호를 전역변수에 일단 저장한다.
         targetNum=num;
      }
      
      //예 버튼을 눌렀을때 실행할 함수 등록
      document.querySelector("#yesBtn").addEventListener("click", function(){
         //삭제 처리를 하는 페이지로 이동을 시키면서 전역변수에 저장된 삭제할 번호를 파라미터로 전달한다. 
         location.href="delete.jsp?num="+targetNum;
      });
   </script>
</body>
</html>


















