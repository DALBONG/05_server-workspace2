<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
 <h1> * EL (Expression Language) 표현 언어</h1>
	<p>
		기존에 사용했던 표현식(출력식) &lt; %= name % &gt;와 같이 <br>
		jsp상에 표현하고자 하는 값을 \${name}의 형식으로 표현하여 작성. 
	</p>
	
	<h4><a href="el.do">01_EL의 기본 구문</a></h4> 
	
	<h4><a href="operation.do">02_EL의 연산자</a></h4> 
	
	<hr>
	
	<!-- 
		JSP를 이루는 구성인자 
		1. 스크립팅 원소 : JSP페이지에서 자바코드를 기술할 수 있게 하는 기능
			ex) 스크립틀릿, 출력식(표현식) 등...
			
		2. 지시어 : JSP페이지 정보 표현하거나, 또 다른 페이지를 포함할 때 사용
				  JSP의 기능을 확장시키는  라이브러리를 등록할때도 사용
			ex) page지시어, include지시어, taglib지시어
		
		3. action태그(표준액션 / 커스텀액션) :  xml기술을 잉요해서 기존의 jsp문법을 확장하는 기술을 제공
		
			- 표준액션태그 : jsp페이지에서 바로 사용가능 (별도의 연동 필요 X)
					-> 모든 태그명 앞에 jsp: 접두어 붙음
				
			- 커스텀액션태그 : jsp페이지 바로 사용 불가 (별도의 라이브러리 연동 필요)
					-> 모든 태그명 앞에 jsp: 외, 다른 접두어 붙음 (종류 다양)
					   (가장 대표적인 유용한 라이브러리 == JSTL)
	 -->
	 
	<h1> JSP Action Tag</h1>
	<p>XML기술을 이용해서 기존의 jsp 문법을 확장하는 기술을 제공하는 태그</p>
	
	<h3>1) 표준 액션 태그</h3>
	<a href="views/2_standardAction/01_include.jsp">01_jsp:include</a>
	<br>
	<a href="views/2_standardAction/02_forward.jsp">02_jsp:forward</a>
	
	<br>
	<br>
	<h3>2) 커스텀 액션 태그(jstl)</h3>
	<a href="views/3_customAction/jstl.jsp">JSTL </a>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>