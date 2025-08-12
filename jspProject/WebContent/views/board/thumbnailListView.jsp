<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .outer{
            background-color: black;
            color: wheat;
            width: 1000px;
            height: auto;
            margin: auto;
            margin-top: 50px;

        }

        .list-area{
            width: 760px;
            margin: auto;

        }
        .thumbnail:hover{
        	cursor:pointer;
        	opacity:0.8;
        	background-color: darkgray;
        }

        .thumbnail{
            border: 1px solid wheat;
            width: 220px;
            display: inline-block;
            margin: 13px;

        }

        


    </style>



</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">사진 게시판</h2>
        <br>
	
		<%if(loginUser != null) {%>
	        <!-- 로그인한 사용자만 볼 수 있게-->
	        <div align="right" style="width: 850px;">
	            <a href="<%= contextPath%>/enrollForm.th" class="btn btn-sm btn-secondary"> 글작성</a>
	        </div>
	    <%} %>

        <div class="list-area">
	
			<% for(Board b : list) {%>
	            <!-- 썸넬 한 개-->
	            <div class="thumbnail" align="center">
	            	<!-- input 추가 -->
	            	<input type="hidden" value="<%= b.getBoardNo()%>">
	                <img src="<%= contextPath %>/<%= b.getTitleImg() %>" width="200px" height="150px">
	                <p>
	                    No.<%= b.getBoardNo() + b.getBoardTitle() %> <br>
	                    조회수 : <%= b.getCount() %>
	                    <br>
	                </p>
	            </div>
            <%} %>

        </div>
	
		<script>
			$(function(){
				$(".thumbnail").click(function(){
					location.href="<%= contextPath %>/detail.tb?bno=" + $(this).children("input").val();
				})
				
				
			})
		</script>
        

    </div>

</body>
</html>