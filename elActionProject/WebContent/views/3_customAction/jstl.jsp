<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>JSTL 이란?</h1>

	<p>
		Jsp Standard Tag Library의 약자로, jsp에서 사용되는 액션 태그. <br>
		공통적으로 자주 사용되는 코드들을 집합하여 보다 쉽게 사용할 수 있도록 <br>
		태그화 해서 표준으로 제공하는 라이브러리
	</p>
	
	<h3> * 라이브러리 다운 후 추가</h3>
	1) 아파치 톰캣 사이트 접속
	2) 메뉴바 taglibs메뉴 접속
	3) 4개의 라이브러리 모두 다운
	4) WEB-INF/lib/ 에 추가
	
	<h3>* JSTL 선언 방법</h3>
	<p>
		JSTL을 사용하고자 하는 해당 jsp페이지 상단에 taglib 지시어 사용하여 선언 <br>
		<br>
		&lt;%@ taglib prefix="접두어" uri="라이브러리 파일상의 uri주소" %&gt;
			---> coreLibrary의 접두어는 c
	</p>
	
	<h4>1. JSTL Core Library</h4>
	<p>변수, 조건문, 반복문 등 로직과 관련된 문법 제공</p>
	<a href="01_core.jsp">core library</a>
	
	
	
	
	
	
	

</body>
</html>