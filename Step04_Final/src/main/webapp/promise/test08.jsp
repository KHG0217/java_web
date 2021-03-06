<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test08.jsp</title>
</head>
<body>
	<h1>Promise 테스트</h1>
	<script>
 /*
    Promise 는 
    언제 끝날지 모르는 불확실한 비동기 작업을
    콜백 지옥에 빠지지 않고
    순서대로 수행하고자 할때 사용합니다.
    - 특히 작업이 실패 되었을때 처리가 훨씬 수월 합니다.
 */

function openDoor(){
 return new Promise(function(resolve){
    setTimeout(function(){
       console.log("1초를 소모하면서 문을 열었습니다.");
       resolve();
    }, 1000);
 });
}
function putElephant(){
 return new Promise(function(resolve){
    setTimeout(function(){
       console.log("3초를 소모하면서 코끼리를 집어 넣었습니다.");
       resolve();
    }, 3000);
 });
}
function closeDoor(){
 return new Promise(function(resolve){
    setTimeout(function(){
       console.log("2초를 소모하면서 문을 닫았습니다.");
       resolve();
    }, 2000);
 });
}
 
	</script>
</body>
</html>