<%@page import="elActionProject.com.kh.model.vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 
	<h3>1. 기존방식으로 스크립틀릿과 표현식을 이용해서 각 Scope에 담긴 값을 뽑아 출력</h3>
	<%
		String classRoom = (String)request.getAttribute("classRooom");
		Person student = (Person)request.getAttribute("student");

		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");
		
		%>

	<p>
		학원명 : <%= academy %> <br>
		강의장 : <%= classRoom %> <br>
		강사 : <%= teacher.getName() %>, <%= teacher.getAge() %>, <%= teacher.getGender() %>
		<br> <br>
		
		<ul>
			<li>이름 : <%= student.getName() %></li>
			<li>나이 : <%= student.getAge() %></li>
			<li>성별 : <%= student.getGender() %></li>
		
		</ul>
	
	</p>

--%>

	<h3>2. El을 이용해서 보다 쉽게 해당 Scope에 저장된 값들 출력하기</h3>

	<p>
		EL을 이용해서 getXXX을 통해 값을 뺴올 필요 X. <br>
 		EL구문 내에 키값만 제시하면 바로 접근 가능<br>
		기본적으로 EL은 JSP내장 객체를 구분하지 않고 자동적으로 <br>
		모든 내장객체의 키값을 검색해서 존재하는 경우 값을 가져옴
	</p>

	<p>
		학원명 : ${ academy } <br>
		강의장 : ${ classRooom } <br>
		강사 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender } <br> <br>
		<!--
			teacher에 접근하면 밸류값은 person객체임.
			해당 person객체의 필드에 담긴 값을 출력하려면
 			.필드명 으로 접근.
			  -> 내부적으로 getter메소드를 찾아 실행됨.
				즉, getter메소드는 항상 필수적으로 만들어줘야함.
		
		-->
	
		수강생정보
		<ul>
			<li>이름 : ${ student.name }</li>
			<li>나이 : ${ student.age }</li>
			<li>성별 : ${ student.gender }</li>
		</ul>
	</p>

	<h3>3. 단, EL사용시 내장객체들에 저장된 키값이 동일할 경우.</h3>

	Scope값 :  ${ scope } <br>
	<!-- 공유범위가 제일 작은 Scope에서부터 해당 Key값을 가져옴.
		page -> request -> session -> application

 		만일, 모든 영역에서 못찾을 경우? 아무것도 출력X  (오류는 나지 않음.)
	-->

	test값 : ${ test } <br>

	<h3>4. 직접 Scope를 지정하여 접근하기</h3>
	<%
	  //pageScope에 담기
		pageContext.setAttribute("scope", "page");
	%>

	pageScope에 담긴 값 : ${ scope } 또는 ${ pageScope.scope } <br>
	requestScope에 담긴 값 : ${ requestScope.scope } <br>
	sesseionScope에 담긴 값 : ${ sessionScope.scope } <br>
	applicationScope에 담긴 값 : ${ applicationScope.scope } <br>

	<!-- 
		각 영역에 중복된 키값으로 데이터를 저장시켰다면, Scope를 직접 지정하여 키값 제시하는게 정확
		단지, 키값만 제시하면 잘못된 데이터가 뽑힐 수 있음.
	-->

	잘못 접근 예시 {session에 classRooom} : ${ sessionScope.classRooom }

</body>

</html>