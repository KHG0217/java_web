<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test07.jsp</title>
</head>
<body>
	<h1>Promise 테스트</h1>
	<script>
		//가상의 주어진 자업을 처리 하는 함수 (주어진 작업을 처리하는데 random한 시간이 걸린다고 가정하자)
		function work(job, callback){
			
			//0~5000 사이의 랜덤한 숫자 얻어내기
			let ranTime=Math.random()*5000;
			
			//첫번째 인자로 전달 된 함수를 random한 시간 이후에 호출하기
			setTimeout(function(){
				console.log(job+"을 수행 했습니다.");
				callback(); //함수타입
			}, ranTime);
		}
		//어떤 작업을 시작하고 Promise 객체를 리턴하는 함수
		function startWork(job){
			//Promise 객체를 생성해서
			let p=new promise(function(resolve){
				work(job,resolve);				
			});
			//리턴해주기
			return p;
		}
		
		startWork("달리기")
		.than(function(){
			return startWork("쉬기");
		})
		.then(function(){
			return startWork("잠자기");
		})
		.then(function(){
			console.log("모든 작업을 순서대로 마쳤습니다.");
		});
		
	</script>
</body>
</html>