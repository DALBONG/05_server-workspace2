<%@page import="elActionProject.com.kh.model.vo.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> JSTL core Library </h1>
	
	<h3>1. 변수(속성 == attribute) </h3>
	<pre>
	* 변수 선언과 동시에 초기화 (c:set var="" vlaue="" [scope=""])
	  - 변수 선언후, 초기값을 대입해주는 기능을 제공
	  - 해당 변수를 어떤 scope에 담아둘건지 지정 가능(생략시 pageScope에 담김)
	    (scope에 setAtrribute를 통해 key-val 형태로 데이터를 담아놓는것과 비슷)
	  - c:set으로 선언된 변수는 EL로 접근해서 사용 가능(스크립팅 원소로는 접근 불가)
	  - 변수 타입을 별도로 지정하지 않음. 
	  - 초기값 반드시 지정해줘야 함
	</pre>
	
	<c:set var="num1" value="10"/> <!-- == pageContext.setAttribute("num1", "10") -->
	
	<!-- request Scope에 담고 싶다면? -->
	<c:set var="num2" value="20" scope="request"/> <!-- ==request.setAttribute("num2", "20") -->

	num1변수값 : ${ num1 } <br>
	num2변수값 : ${ num2 } <br>
	
	<c:set var="result" value="${ num1 * num2}" scope="session"/>
	result변수값 : ${ result } <br>

	${ pageScope.num1 } <br>
	${ requestScope.num2 } <br>
	${ sessionScope.result } <br>
	

	<!-- value속성 대신 시작태그와 종료태그 사이에 초기값 지정 가능 -->
	<c:set var="result" scope="request">
		9999
		</c:set>
		
	${ requestScope.result } <br>

	<pre>
	* 변수 삭제 (c:remove var="제거하려는 변수명" [scope=""])
	  - 해당 scope 영역에서 해당 변수를 찾아 제거하는 태그
	  - scope 지정 생략시 모든 scope에서 해당 변수 다 찾아 제거 
	  	(해당 scope의 .removeAttribute와 비슷)
	</pre>
	
	삭제전 result : ${ result } <br>
	
	1) 특정 scope 지정해서 삭제 <br>
	<c:remove var="result" scope="request"/>
	request 삭제 후 result : ${ result }
	<br>
	2) 모든 scope에서 삭제
	<c:remove var="result"/>
	모두 삭제 후 result : ${ result }
	<br>
	<br>
	
	<pre>
	* 변수(데이터) 출력 (c:out value="출력하려는 값" [default="기본값"] [escapeXml="T|F"])
	  - 데이터를 출력하고자 할 때 사용
	</pre>
	
	<c:out value="${ result }"></c:out> <br>
	<c:out value="${ result }" default="없슴"></c:out> 
	<br> <br>
	<c:set var="outTest" value="<b>출력테스트</b>"/>
	<c:out value="${ outTest }"/> <br>
	<br> <!-- escapeXml 생략시 기본값이 -->
	<c:out value="${ outTest }" escapeXml="false"></c:out>
	<br>
	<hr>
	
	<c:if test="${ num1 != num2 }">
	 	"num2가 더 큼"
	</c:if>
	
	
	
	
	<h3>2. 조건문 - if (c:if test="조건식")</h3>
	<pre>
	* java의 if문과 비슷한 역할을 하는 태그.
	  - 조건식은 test속성에 작성(EL구문으로 작성)
	  
	</pre>
	
	<%-- 
	기존 방식: <% if(num1 > num2) { %>
			<%} %>  	--%>
			
	<c:if test="${ num1 gt num2 }">
		<b>num1은  num2보다 큼</b>
	</c:if>
	<c:if test="${ num1 le num2 }">
		<b>num1이  num2보다 작거나 같음</b>
	</c:if>
	<br>
	
	<c:set var="str" value="안녕하"/>
	<%-- 
	<% if(str.equals("안녕하")) {%>
	<%} %>			--%>
	<c:if test="${ str eq '안녕하'} ">
		<h4> 하이 헬로우 안녕</h4>
	</c:if>
	
	<c:if test="${ str ne '안녕하' }">
		<h4> 빠이 빠이바이</h4>
	</c:if>
	
	<h3>3. 조건문 - choose (c:choose, c:when, c:otherwise)</h3>
	<pre>
	- JAVA의 if-else, if-else if 문과 비슷
	- 각 조건들을 c:choose의 하위 요소로, c:when을 통해 작성 (else문 역할 == c:otherwise)
	
	</pre>
	<%-- 
	<% if(num1 > 20) {%>
	<%}else if(num1 >= 10){ %>
	<%} %>    
	--%>
	
	<c:choose>
		<c:when test="${ num1 gt 20 }">
			<!-- num1이 20보다 클 경우 // 주석을 choose와 when사이에 쓸 경우 오류 -->
			<b> num1은 20보다 큼</b>
		</c:when>
		<c:when test="${ num1 ge 10 }">
			<b> num1은 10보다 큼</b>
		</c:when>
		<c:otherwise>
			<b>안녕하네</b>
		</c:otherwise>
		
	</c:choose>
	 
	<hr>
	
	<h3>4. 반복문 - forEach ()</h3> 
	<pre>
	1) for loop문 - c:forEach var="변수명" begin="초기값" end="끝 값" [step="반복시 증가값"]
	2) for each문 - c:forEach var="변수명" items="배열 or 컬렉션 명"
	
	var 속성으로 선언된 변수에 접근할 때 반드시 EL구문으로 접근
	</pre>
	
	<%--
	<%for(int i=1; i<10; i++) {%>
	<%} %>
	 --%>
	 
	 <c:forEach var="i" begin="1" end="10" step="2">
	 	반복확인 ${ i } <br>
	 </c:forEach>
	 
	 <c:forEach var="i" begin="1" end="6">
	 	<h${ i }>태그에 적용</h${ i }>
	 </c:forEach>
	 
	 <c:set var="colors">
	 	red,yellow,green,pink
	 </c:set>
	 
	 ${ colors }
	 
	 <ul>
	 	<c:forEach var="c" items="${ colors }">
	 		<li style="color:${ c }">${ c }</li>
	 	</c:forEach>
	 </ul>
	 
	 <%
	 	ArrayList<Person> list = new ArrayList<Person>();
	 
	 	list.add(new Person("차온우", 20, "남자"));
	 	list.add(new Person("장은영", 25, "여자"));
	 	list.add(new Person("박효진", 24, "남자"));
	 %>
	 
	 <c:set var="pList" value="<%= list %>" scope="request"/>
	 
	 <table border=1>
	 	<thead>
	 		<tr>
	 			<th>이름</th>
	 			<th>나이</th>
	 			<th>성별</th>
	 		</tr>
	 	</thead>
	 	
	 	
	 	<tbody>
	 	
	 		<c:choose>
	 			<c:when test="${ empty pList }">
	 				<tr>
	 					<td colspan="3">조회된 휴먼 없음</td>
	 				</tr>
	 			</c:when>
	 			<c:otherwise>
	 				<c:forEach var="p" items="${ pList }">
	 					<tr>
	 						<td>${ p.name }</td>
	 						<td>${ p.age }</td>
	 						<td>${ p.gender }</td>
	 					</tr>
	 				</c:forEach>
	 			</c:otherwise>
	 		</c:choose>
	 	
	 	</tbody>
	 </table>
	 <hr>
	 
	 <h3>5. url, 쿼리스트링 관련 - url, param</h3>
	 <pre>
	 - url경로를 생성하고, 쿼리스트링을 정의해둘 수 있는 태그
	 
	 c:url var="변수명" value="요청할url" 
	 	c:param name="키값" value="전달값"/
	 	c:param name="키값" value="전달값"/ 
	 	...
	 /c:url
	 </pre>
	 
	 <!-- 쿼리 스트링 방식 -->
	 <a href="list.do?cpage=1&num=2">기존방식</a>
	 
	<c:url var="ttt" value="list.do">
		<c:param name="cpage" value="1"/>
		<c:param name="num" value="2"/>
	</c:url> 
	<br>
	<a href="${ ttt }"> c:url을 이용한 방식</a>

	
	
	
	
	
	
</body>
</html>