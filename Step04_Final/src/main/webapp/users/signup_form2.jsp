<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup_form2.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
   <div class="container">
      <h1>회원 가입 폼 입니다.</h1>
      <form v-on:submit="onSubmit" action="signup.jsp" method="post" id="signupForm">
         <div class="mb-3">
            <label class="control-label" for="id">아이디</label>
            <input v-on:input="divClicked" v-model="msg" v-bind:class="[isAble? 'is-valid' : '', disAble? 'is-invalid' : '']" class="form-control"  type="text" name="id" id="id"/>
            <small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
            <div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
         </div>
         <div class="mb-3">
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="pwd"/>
            <small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
            <div class="invalid-feedback">비밀 번호를 확인 하세요</div>
         </div>
         <div class="mb-3">
            <label class="control-label" for="pwd2">비밀번호 확인</label>
            <input class="form-control" type="password" name="pwd2" id="pwd2"/>
         </div>
         <div class="mb-3">
            <label class="control-label" for="email">이메일</label>
            <input class="form-control" type="text" name="email" id="email"/>
            <div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button class="btn btn-outline-primary" type="submit">가입</button>
      </form>      
   </div>
   <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
   <script>
	      new Vue({

	    	 el:"#signupForm",
	         data:{
	        	msg:"",
	            isIdValid:false,
	            isPwdValid:false,
	            isEmailValid:false,
		    	isAble:false,
		    	disAble:false,

	      		
	            
	         },
		         methods:{
			         	onSubmit(e){
			               //폼 전체의 유효성 여부
			               let isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
			               if(!isFormValid){
			                  //폼 제출 막기 
			                  e.preventDefault();
			               }
			               
			            },
			            divClicked(e){
			               this.disAble=false;
			               this.isAble=false;
		
		
			               
			               const reg=/^[a-z].{4,9}$/;
			               if(!reg.test(this.msg)){
			            	   this.disAble=true;
			            	   this.isIdValid=false;
			            	   return;
			               }
			               fetch("${pageContext.request.contextPath }/users/checkid.jsp?inputId="+this.msg)
			               .then(function(response){
			            	   return response.json();
			               })
			               .then(function(data){
			            	   if(data.isExist){
									
		
			            		   
			            	   }else{
									
				               };
				               
			               });
		
			               
			          }
		        }
	        
	     });
                  	      
   </script>
</body>
</html>





























