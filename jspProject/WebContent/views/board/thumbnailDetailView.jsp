<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% Board b = (Board)request.getAttribute("b"); 
 	Attachment at = (Attachment)request.getAttribute("at");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style >
		.outer{
			background-color: black;
			color: white;
			width: 1000px;
			height: 800px;
			margin: auto;
			margin-top: 50px;
		}
		
		.detail-area td{
			border: 1px solid white;
			
		}
	
	
	</style>
	

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center"> 사진 게시판 상세</h2>
        <br>

        <table class="detail-area" align="center">

            <tr>
                <td width="70">제목</td>
                <td colspan="3" width="600"><%= b.getBoardTitle() %></td>
            </tr>

            <tr>
                <td>작성자</td>
                <td><%= b.getBoardWriter() %></td>
                <td>작성일</td>
                <td><%= b.getCreateDate() %></td>
            </tr>

            <tr>
                <td>내용</td>
                <td colspan="3">
                    <p style="height: 50px;"><%= b.getBoardContent() %></p>
                </td>
            </tr>

            <tr>
                <td>대표사진</td>
                <td colspan="3">
                    <div>
                        <img src="<%= contextPath %>/resources/thumnail_upfiles"   width="500px" height="300px">
               			<!-- /jsp/폴더경로/파일명 -->
                    </div>
                </td>
            </tr>

            <tr>
                <td>상세사진</td>
                <td colspan="3">
                    <div>
                        <img src="/jsp/폴더경로/파일명" width="200px" height="150px">
                        <img src="/jsp/폴더경로/파일명" width="200px" height="150px">
                        <img src="/jsp/폴더경로/파일명" width="200px" height="150px">
                    </div>
                </td>
            </tr>

        </table>
    </div>

</body>
</html>