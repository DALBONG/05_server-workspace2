<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 	<h1>EL 연산</h1>
 	<h3>1. 산술 연산</h3>
 	기존방식 : <%= (int)request.getAttribute("big") + (int)request.getAttribute("small")%>
	<br>
	
	10+3 = ${ big + small } <br>
	
	10-3 = ${ big - small } <br>
	10*3 = ${ big * small } <br>
	10/3 = ${ big / small } or ${ big div small }<br>
	10%3 = ${ big % small } or ${ big mod small }  <br>
	
	
	<h3>2.대소 비교 연산</h3>
	10 &gt; 3 = { big > small } or ${ big gt small } <br>
	10 &gt; 3 = { big < small } or ${ big lt small } <br>
	10 &gt; = 3 = ${ big >= small } or ${ big ge small } <br>
	10 &lt; = 3 = ${ big <= small } or ${ big le small }   
	
	<h3>3. 동등비교 연산</h3>
	<!-- el에서의 == 비교는 자바에서의 equals()와 같은 동작을 함 -->
	sOne과 sTwo가 일치하나? : ${ sOne == sTwo } or ${ sOne eq sTwo } <br>
	sOne과 sTwo가 일치하지 않습니까? : ${ sOne != sTwo } or ${ sOne ne sTwo } <br>
	
	big에 담긴 값이 10과 일치하는가? : ${ big == 10 } or ${ big eq 10 } <br>
	sOne에 담긴 값이 "아느여"와 일치하는가? : ${ sOne == '아느여' } or ${ sOne eq "아느여" } <br>
	<!-- el안에서 문자열 리터럴 제시시 '', "" 가리지 않음 -->
	
	<h4>4. 객체가 null인지 또는 리스트가 비어있는지 비교</h4>
	pTwo가 null인가요? : ${ pTwo == null } or ${ empty pTwo } <br>
	pOne은 null인가? : ${ pOne == null } or ${ empty pOne } <br>
	pOne은 null이 아닌가요? : ${ pOne != null } or ${ not empty pOne } <br>
	
	lOne은 비어있나요? : ${ empty lOne } <br>
	lTwo은 비어있나요? : ${ empty lTwo } <br>
	
	<h3>5. 논리 연산자</h3>
	${ true && true } or ${ true and true } <br>
	${ true || false } or ${ true or false } <br>
	
	big이 small보다 크고 lOne이 비어있나? : ${ big gt small and empty lOne }
	

	
</body>
</html>