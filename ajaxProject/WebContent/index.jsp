<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body>

	<h1>AJAX 개요</h1>
	<p>
		Asynchronous Javascript And Xml의 약자. <br>
		서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고 <br>
		일부만 로드할 수 있게 하는 기법 <br>
		<br>
		ex) 기존, a태그로 요청 및 form submit 요청 방식은 "동기식 요청" <br>
		 . . --> 응답페이지가 돌아와야만 볼 수 있음(깜빡거림)
		<br> <br>
		* 동기식 / 비동기식 <br>
		1) 동기식 : (a, form submit)
		<ul>
			<li>요청 처리 후, 해당 응답페이지가 돌아와야만 다음 작업 가능</li>
			<li> - 서버에 요청한 결과까지의 시간이 저연되면 계속 기다려야 함(기다리는동안 흰페이지로 보여짐)</li>
			<li> - 전체 페이지를 응답해주기에 페이지가 깜빡거림</li>
		</ul>
		<br>
		
		2) 비동기식 : (ajax)
		<ul>
			<li>현재 페이지를 그대로 유지하면서 중간중간 추가적으로 필요한 요청을 보내줌</li>
			<li> - 요청을 보내도 다른 페이지로 넘어가지 않음(현재 페이지 유지)</li>
			<li> - 요청을 보낸후, 응답이 돌아올 때 까지 현재 페이지에서 다른 작업을 할 수 있음</li>
		</ul>
		ex) 실시간 급상승 검색어, 아이디 중복확인, 검색어 추천, 무한스크롤링(유튜브, sns등..) 등..
		<br> <br>
		
		* 비동기식의 단점
			- 현재 페이지에 지속적으로 리소스가 쌓이면 페이지가 느려질 수 있음. <br>
			- 에러발생시 디버깅 어려움 <br>
			- 요청처리 후 돌아온 응답 데이터를 가지고 현재 페이지에 새로운 요소를 만들어 뿌려줘야 함.
			<br> (dom요소를 새로 만들어내는 구문을 잘 익혀둬야 함)
			<br> <br>
			
		* AJAX 구현 방식 : 순수 JavaScript방식 / jQuery방식 (코드 간결, 쉬움)
		
	</p>
	
	<pre>
	* jQuery방식으로 Ajax통신
	  
	 $.ajax({
	 	속성명 : 속성값, 
	 	속성명 : 속성값, ... 
	 });
	 
	 * 주요 속성
	   - url 		: 요청할 url (필수 속성)
 	   - type | method : 요청 전송 방식 (get / post)
 	   - data 		   : 요청시 전달할 값
 	   - success 	   : ajax통신 성공시 실행할 함수 정의
 	   - error		   : ajax통신 실패시 실행할 함수 정의
 	   - complete	   : ajax통신 성공했든 실패했든 무조건 실행할 함수 정의 
 	   - 이외에도 부수적 속성 무수히 많음 
 	   	
	</pre>
	
	
	<h1>jQuery방식을 이용한 Ajax 테스트</h1>  <!--  실습 : 멤버 회원가입 중복체크 -->
	
	<h3>1. 버튼 클릭시 get방식으로 서버에 요청 및 응답</h3>
	
	입력 : <input type="text" id="input1">
	<button id="btn1">전송</button>
	<br>
	응답 : <span id="output1">현재 응답 없음</span>
	
	<script>
	$(function() {
		$("#btn1").click(function() {
		//기존 동기식 통신 
		// location.href="jqAjax1.do?input="+$("#input1").val(); 
		
		//비동기식 통신 
			$.ajax({
				url:"jqAjax1.do", 
				data:{input:$("#input1").val()},
				type:"get",
				success:function(bong){ // 돌아온 응답데이터가 담김, 받을 변수는 자유롭게 작성. 
					console.log("ajax통신 성공");
					console.log(bong);
					$("#output1").text(bong);
				},
				error:function(){
					console.log("ajax통신 실패!");
				},
				complete:function(){
					console.log("그냥 출력");
				}, //마지막 속성이라 하더라도 , 찍음. (찍어도 오류발생X)
			});
		
		});
	})
	
	
	</script>
	
	<hr>
	<br>
	<h3>2. 버튼 클릭 시 psot방식으로 서버에 여러개의 데이터 전송 및 응답</h3>
	이름 : <input type="text" id="input2_1"> <br>
	나이 : <input type="number" id="input2_2"> <br>
	<button onclick="test2()">전송</button> <br>
	
	<!-- ver1 (하나의 데이터)
	응답 : <label id="output2"></label>
	
	<script>
	function test2() {
		$.ajax({
			url:"jqAjax2.do",
			data:{
				  name:$("#input2_1").val(),
				  age:$("#input2_2").val(),
			},
			type:"post",
			success:function(nage){
				$("#output2").text(nage);
				$("#input2_1").val("");
				$("#input2_2").val("");
			},
			error:function(){
				console.log("ajax 통신 실패");
			},
			
			
		});
	}
	
	
	</script>
	-->
	
	<!-- ver2  -->
	응답
	<ul id="output2">
	
	</ul>
	
	<script>
	 function test2(){
		 $.ajax({
			 url:"jqAjax2.do",
			 data:{
				 name:$("#input2_1").val(),
				 age:$("#input2_2").val(),
			 },
			 type:"post",
			 success:function(suc){
				 /* JSONArray의 경우
				 console.log(suc);
				 console.log(suc[1]);
				 console.log(suc[0]);
				 */
				 
				 console.log(suc);
				 console.log(suc.name);
			 	 
				 const value = "<li>" + suc.name + "</li>"
				  			 + "<li>" + suc.age + "</li>";
				  	
				  $("#output2").html(value);
				 
				 
				 
			 },
			 error:function(){
				 console.log("ajax통신 실패")
			 },
			 
		 });
		 
	 }
	
	</script>
	
	<br>
	<hr>
	
	<h3>** 3. 서버에 데이터 전송 후 조회된 vo 객체를 응답데이터로</h3>
	
	검색하려는 회원번호 : <input type="number" id="input3">
	<button onclick="test3()">조회</button>
	
	<div id="output3"></div>
	
	<script>
		function test3(){
			$.ajax({
				url:"jqAjax3.do",
				data:{no:$("#input3").val(),},
				success:function(m){
					console.log(m);
					
					const value = "이름 : " + m.userName + "<br>"
								+ ", 나이 : " + m.age + "<br>"
								+ ", 성별 : " + m.gender
								
					$("#output3").html(value);
					
				},
				error:function(){
					console.log("통신 실패");
				},
			})
			
		};
	
	
	</script>
	
	<hr>
	<br>
	
	<h3>4. 응답데이터로 조회된 여러 vo객체들이 담겨있는 ArrayList 받기</h3>
	
	<button onclick="test4()">회원 전체 조회</button>
	<br> <br>
	
	<table id="output4" border="1">
	
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		
		
		<tbody>
		
		</tbody>
	
	</table>
	
	
	<script>
		function test4() {
			$.ajax({
				url:"jqAjax4.do",
				success:function(gs){ 
					console.log(gs);
					
					let value = "";
					for(let i=0; i<gs.length; i++){
						value += "<tr>"
								   + "<td>" + gs[i].userNo + "</td>"
								   + "<td>" + gs[i].userName + "</td>"
								   + "<td>" + gs[i].age + "</td>"
								   + "<td>" + gs[i].gender + "</td>"
							   + "</tr>" ; 
						
					}
					
					$("#output4 tbody").html(value);
					
				},
				error:function(){
					console.log("통신 실패");
				},
				
			});
		}
	
	</script>
	
	
	
</body>
</html>