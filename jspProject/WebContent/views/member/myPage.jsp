<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.outer{
		background-color: black;
		color: white;
		width: 1000px;
		margin: auto;
		margin-top: 50px;
	}
    #myPage-form table{margin: auto;}
    #myPage-form input{margin: 5px;}
</style>

</head>
<body>

    <%@ include file ="../common/menubar.jsp" %>
    <%
    	String userId = loginUser.getUserId();
    	String userName = loginUser.getUserName();
    	String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone(); // null 존재 가능하고, 사이트에서 볼때 null이라고뜰 수도 있어서 그냥 뽑으면 안되고 변형해야함(삼합연산자).
    	String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
    	String address = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
    	String interest = (loginUser.getInterest() == null) ? "" : loginUser.getInterest();
    	// 취미는 "운동,걷기,영화"
    %>

    <div class="outer">
        <br>
        <h2 align="center">마이페이지</h2>

        <form id="myPage-form" action="<%= contextPath %>/update.me" method="Post">

            <table>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="userId" maxlength="12" required value="<%= userId %>" readonly></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="userName" maxlength="6" required value="<%= userName %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;전화번호</td>
                    <td><input type="text" name="phone" placeholder="- 포함해서 입력" value="<%= phone %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email" value="<%= email %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;주소</td>
                    <td><input type="text" name="address" value="<%= address %>"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;관심분야</td>
                    <td colspan="2">
                        <input type="checkbox" name="interest" id="sports" value="운동">
                        <label for="sports">운동</label>

                        <input type="checkbox" name="interest" id="hiking" value="등산">
                        <label for="hiking">등산</label>

                        <input type="checkbox" name="interest" id="fishing" value="낚시">
                        <label for="fishing">낚시</label>
                        <br>
                        <input type="checkbox" name="interest" id="cooking" value="요리">
                        <label for="cooking">요리</label>

                        <input type="checkbox" name="interest" id="game" value="게임">
                        <label for="game">게임</label>

                        <input type="checkbox" name="interest" id="movie" value="영화">
                        <label for="movie">영화</label>
                    </td>
                </tr>
            </table>
            
            <script>
            	$(function(){ // jQuery로 해도되고 자바스크립트로해도됨
            		const interest = "<%= interest %>";
            		// "운동,등산,영화" / "(빈문자열)"
            		$("input[type=checkbox]").each(function(){
            			// $(this) : 순차적으로 접근되는 체크박스 요소
            			// 이 요소의 value값을 가져오는거 => $(this).val() = 해당 체크박스의 value 값
            			if(interest.search($(this).val()) != -1){
            				$(this).attr("checked", true);
            			}
            		});
            		// input의 요소이긴하지만 type이 checkbox임
            		
            	})
            </script>

            <br><br>

            <div align="center">
                <button type="submit" class="btn btn-sm btn-primary">정보변경</button> 
                <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#updatePwdModal">비빌번호 변경</button>
                <button type="button" class="btn btn-sm btn-danger">회원탈퇴</button>
            </div>

            <br>

        </form>


    </div>
    
    
    
    	<!-- 비번 변경 modal -->
		<div class="modal" id="updatePwdModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">비밀번호 변경</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body" align="center">
		       	<form action="<%= contextPath %>/updatePwd.me" method="post">
		       		<input type="hidden" name="userId" value="<%= userId %>">
		       		<table>
		       			<tr>
		       				<td>현재 비밀번호</td>
		       				<td> <input type="password" name="userPwd" required> </td>
		       			</tr>
		       			
		       			<tr>
		       				<td>변경할 비밀번호</td>
		       				<td> <input type="password" name="updatePwd" required> </td>
		       			</tr>
		       			
		       			<tr>
		       				<td>변경할 비밀번호 확인</td>
		       				<td> <input type="password" name="checkPwd" required></td>
		       			</tr>
		       		</table>
		       		
		       		<br>
		       		
		       		<button type="submit" class="btn btn-sm btn-secondary" onclick="return validatePwd();">비밀번호 변경</button>
		       
		       
		       	</form>
		       	
		       	
		       	<script>
		       		function validatePwd() {
		       			if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
		       				alert("변경할 비밀번호 불일치");
		       				return false;
		       			}
						
					}
		       	
		       	
		       	
		       	</script>
		       	
		       	
		       	
		      </div>
		    </div>
		  </div>
		</div>
    

</body>
</html>