<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	Notice n = (Notice)request.getAttribute("notice");
		// n = 글번호, 글제목, 내용, 작성자 아이디, 작성일
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .outer{
            background-color: rgb(190, 251, 255);
            color: black;
            width: 1000px;
            height: 500px;
            margin: auto;
            margin-top: 50px;
        }


    </style>




</head>
<body>

<%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">
        <br>
        <h2 align="center">공지 상세</h2>
        <br>

        <table id="detail-area" border="1">
            <tr>
                <th width="70">제목</th>
                <td colspan="3" width="430"><%= n.getNoticeTitle() %></td>
            </tr>

            <tr>
                <th>작성자</th>
                <td><%= n.getNoticeWriter() %></td>
                <th>작성일</th>
                <td><%= n.getCreateDate() %></td>
            </tr>

            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height: 150px;"><%= n.getNoticeContent() %></p>
                </td>
            </tr>
        </table>

        <br><br>

        <div>
            <a href="<%= contextPath %>/list.no" class="btn btn-sm btn-secondary">목록 가기</a>
            
            <% if(loginUser != null && loginUser.getUserId().equals(n.getNoticeWriter())) {%>
            <!-- 현재 로그인한 사용자가 해당 글을 쓴 본인일 경우 -->
            <a href="<%= contextPath %>/updateForm.no?num=<%= n.getNoticeNo() %>" class="btn btn-sm btn-warning">수정 하기</a>
            <a href="<%= contextPath %>/deleteForm.no?num=<%= n.getNoticeNo() %>" class="btn btn-sm btn-danger">삭제 하기</a>
            
            <!-- 
            	본격적 삭제 요청 
            	url-mapping 마음대로 작성
            	요청 성공시 -> 공지사항 목록페이지 alert(성공메시지)
            	요청 실패시 -> 에러페이지
             -->
            <% } %>
        </div>

    </div>

</body>
</html>