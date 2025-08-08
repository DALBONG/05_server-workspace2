<%@page import="com.kh.board.model.vo.Attachment"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% Board b = (Board)request.getAttribute("b"); 
	// 글번호, 카테고리명, 글제목, 글내용, 작성자아이디, 작성일

   Attachment at = (Attachment)request.getAttribute("at");
	// 첨부파일 없을경우 null 
	// 첨부파일 있을경우 파일번호, 원본파일명, 수정파일명, 파일 경로
%>

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
            height: 550;
            margin: auto;
            margin-top: 50px;

        }


    </style>


</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">일반 게시판 상세보기</h2>
        <br>

        <table id="detail-area" border="2" align="center">
            <tr>
                <th width="70">카테고리</th>
                <td width="70"><%= b.getCategory() %></td>
                <th width="70">제목</th>
                <td width="300"><%= b.getBoardTitle() %></td>
            </tr>

            <tr>
                <th>작성자</th>
                <td><%= b.getBoardWriter() %></td>
                <th>작성일</th>
                <td><%= b.getCreateDate() %></td>
            </tr>

            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height: 200px;"><%= b. getBoardContent() %></p>
                </td>
            </tr>

            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                	<%if(at == null) {%>
	                    <!-- case1. 첨부파일 없을 경우 -->
	                    첨부파일 없음
					<%}else { %>
	                    <!-- case2. 첨부파일 있을 경우-->
	                    <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>"><%= at.getOriginName() %></a>
					<%} %>
                </td>
            </tr>

        </table>
        <br>

        <div align="center">
            <a href="<%= contextPath %>/list.bo?cpage=1" class="btn btn-sm - btn-secondary">목록으로</a>

			
            <!-- 로그인한 사용자가 게시글 작성자일 경우-->
            <%if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) {%>
	            <a href="<%= contextPath %>/updateForm.bo?bno=<%= b.getBoardNo() %>" class="btn btn-sm btn-warning">수정</a>
	            <a href="#" class="btn btn-sm btn-danger">삭제</a>
            <%} %>
        
        </div>

    </div>

</body>
</html>