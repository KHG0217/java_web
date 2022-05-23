<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test05.jsp</title>
</head>
<body>
	<h1>Promise 테스트</h1>
	<script>
		//아래와 같은 형식으로 작성할 수도 있다.
		new Promise(function(resolve){
			resolve();			
		})
		.then(function(){
			console.log("첫번째 then() 호출됨")
			return new Promise(function(resolve){
				resolve();
			});
			
		})
		.then(function(){
			console.log("두번째 then() 호출됨")
		})
	

	</script>
</body>
</html>