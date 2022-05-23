<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
   <div class="container">
      <h1>회원 가입 폼 입니다.</h1>
      <form action="signup.jsp" method="post" id="signupForm">
         <div class="mb-3">
            <label class="form-label" for="id">아이디</label>
            <input class="form-control" type="text" name="id" id="id"/>
            <small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
            <div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
         </div>
         <div class="mb-3">
            <label class="form-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="pwd"/>
            <small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
            <div class="invalid-feedback">비밀 번호를 확인 하세요</div>
         </div>
         <div class="mb-3">
            <label class="form-label" for="pwd2">비밀번호 확인</label>
            <input class="form-control" type="password" name="pwd2" id="pwd2"/>
         </div>
         <div class="mb-3">
            <label class="form-label" for="email">이메일</label>
            <input class="form-control" type="text" name="email" id="email"/>
            <div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button class="btn btn-outline-primary" type="submit">가입</button>
      </form>      
   </div>
   <script>
      // id 를 입력 할때 마다 호출되는 함수 등록 
      document.querySelector("#id").addEventListener("input", function(){
         //input 요소의 참조값을 self 에 미리 담아 놓기 
         const self=this;
         //일단 2개의 클래스를 모두 제거 한다음 
         self.classList.remove("is-valid");
         self.classList.remove("is-invalid");
         
         //1. 현재 입력한 아이디를 읽어와서
         const inputId=this.value;
         //2. 서버에 보내서(페이지 전환 없이) 
         //3. 사용 가능 여부를(이미 존재하는지 여부) 함수로 응답 받는다.
         fetch("${pageContext.request.contextPath }/users/checkid.jsp?inputId="+inputId)
         .then(function(response){
            //서버에서 응답하는 문자열의 형식이 json 형식이면 response.json();
            //그 이외의 형식이면 response.text(); 를 호출해서 리턴해 준다. 
            return response.json();
         })
         .then(function(data){
            //서버에서 출력한 json 문자열이 object 로 변환되어서 함수에 전달된다. 
            console.log(data);
            //data 는 {isExist:true} or {isExist:false} 형식의 object 이다. 
            if(data.isExist){//이미 존재하면 사용할수 없는 아이디 
               self.classList.add("is-invalid");
            }else{
               self.classList.add("is-valid");
            }
         });
      });
   </script>
</body>
</html>










