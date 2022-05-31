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
            <input  v-on:input="onIdInput"
             		v-model="id" 
             		v-bind:class="[isAble? 'is-valid' : '', disAble? 'is-invalid' : '']" 
             		class="form-control"  type="text" name="id" id="id"/>
            <!-- ="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty <-입력창을 건들지 않았을때 오류 안뜨게하기 위한 조건} -->
            <small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
            <div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
         </div>
         <div class="mb-3">
            <label class="control-label" for="pwd">비밀번호</label>
            <input  v-on:input="checkPwd"
             		v-model="pwd"
             		v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}" 
             		class="form-control" type="password" name="pwd" id="pwd"/>
            <small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
            <div class="invalid-feedback">비밀 번호를 확인 하세요</div>
         </div>
         <div class="mb-3">
            <label class="control-label" for="pwd2">비밀번호 확인</label>
            <input  v-on:input="checkPwd" 
            		v-model="pwd2" 
            		class="form-control" type="password" name="pwd2" id="pwd2"/>
         </div>
         <div class="mb-3">
            <label class="control-label" for="email">이메일</label>
            <input  class="form-control" 
            		v-on:input="onEmailInput"
            		v-model="email"
            		v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}"
           			type="text" name="email" id="email"/>
            <div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button v-bind:disabled="!isFormValid" class="btn btn-primary" type="submit">가입</button>
      </form>      
   </div>
   <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
   <script>
	//클라이언트 웹브라우저 프로그래밍
	      new Vue({

	    	 el:"#signupForm", //vue로 제어할 요소의 선택자
	         data:{
	            isIdValid:false,
	            isPwdValid:false,
	            isEmailValid:false,
		    	isAble:false,
		    	disAble:false,
	        	id:"",
		    	pwd:"",
		    	pwd2:"",
		    	email:"",
		    	//isIdDirty:false,
		    	isPwdDirty:false,
		    	isEmailDirty:false
		             
	         },
	         computed:{ //모델을 이용해서 새로운 결과값을 그때그때 마다 얻고 싶을때 사용한다.
	        	 		//폼 전체의 유효성 여부를 계산해서 리턴하는 함수 
	        	 //함수긴 하지만 모델명으로 작성한다. (모델처럼 사용하기 때문)
	        	isFormValid(){
	        		let result=this.isIdValid && this.isPwdValid && this.isEmailValid;
	        		return result;
	        	} 
	         },
		     methods:{
			        onSubmit(e){
			             //폼 전체의 유효성 여부
			             //let isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
			             if(this.isFormValid){
			                //폼 제출 막기 
			                e.preventDefault();
			             }
			               
			        },
			        onIdInput(e){
			        	 //this.isIdDirty=true;
			             this.disAble=false;
			             this.isAble=false;
		
			               
			             const reg=/^[a-z].{4,9}$/;
			             if(!reg.test(this.id)){
			          	   this.disAble=true;
			           	   this.isIdValid=false;
			           	   return;
			             }
			             
			             //Vue객체의 참조값을 me에 담아놓기 (Vue객체를 참조하지 못할때) !!
			             const me=this;
			             
			             fetch("${pageContext.request.contextPath }/users/checkid.jsp?inputId="+this.id)
			             .then(function(response){
			            	 return response.json();
			            	   
			             })
			             .then(function(data){
			            	 if(data.isExist){
			            		 console.log("존재함 아이디 사용불가");
								   me.disAble=true;
								   me.isIdValid=false;
			            	 }else{
			            		   me.isAble=true;
			            		   me.isIdValid=true;
			            		   console.log("아이디 사용가능");
									
				              };
				               
			             });		               
			        },
		            checkPwd(){
			        		this.isPwdDirty=true;
			                //비밀번호를 검증할 정규 표현식
			                let reg=/[\W]/;
			                //만일 비밀번호가 정규 표현식을 통과 하지 못한다면 
			                if(!reg.test(this.pwd)){   
			                   this.isPwdValid=false;
			                   return; //함수를 여기서 끝내라 
			                }
			                if(this.pwd != this.pwd2){//만일 비밀번호 입력란과 확인란이 다르다면   
			                   this.isPwdValid=false;
			                }else{
			                   this.isPwdValid=true;
			                }               
			         },
			         onEmailInput(){
			        	 this.isEmailDirty=true;
			             //이메일을 검증할 정규 표현식
			             const reg=/@/;
			             if(!reg.test(this.email)){
			               this.isEmailValid=false;
			             }else{
			                this.isEmailValid=true;
			             }			        	 
			         }
			    			        
		        }
	        
	     });
                  	      
   </script>
</body>
</html>





























