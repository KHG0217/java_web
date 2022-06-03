<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_fetch/test01.jsp</title>
</head>
<body>
	<button id="requestBtn">요청하기</button>
	<button id="requestBtn2">요청하기</button>
	<div id="one">
	</div>
	<script>
		//function(){} == ()=>{}
		document.querySelector("#requestBtn").addEventListener("click",()=>{
			fetch("get_data.jsp?num=1")
			.then((res)=>{
				return res.json();
			})
			.then((data)=>{
				console.log(data);
				let info=`
					<p>번호:\${data.num}</p>
					<p>이름:\${data.name}</p>
					<p>남자여부:\${data.isMan}</p>
				`;
				document.querySelector("#one").innerHTML=info;
								
			});
						
		});
		
		document.querySelector("#requestBtn2").addEventListener("click",()=>{
			fetch("get_data2.jsp?num=1")
			.then((res)=>{
				return res.text();
			})
			.then((data)=>{
				//data는 문자열이다.
				console.log(data);
				document.querySelector("#one").innerHTML=data;
								
			});
		})
	</script>
</body>
</html>