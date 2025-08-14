<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
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

	<jsp:include page="../common/menubar.jsp"/>
	<c:set var="n" value="${ Notice }"/>
    <div class="outer" align="center">
        <br>
        <h2 align="center">공지 상세</h2>
        <br>

        <table id="detail-area" border="1">
            <tr>
                <th width="70">제목</th>
                <td colspan="3" width="430">${ n.noticeTitle }</td>
            </tr>

            <tr>
                <th>작성자</th>
                <td>${ n.noticeWriter }</td>
                <th>작성일</th>
                <td>${ n.CreateDate }</td>
            </tr>

            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height: 150px;">${ n.noticeContent }</p>
                </td>
            </tr>
        </table>

        <br><br>

        <div>
            <a href="list.no" class="btn btn-sm btn-secondary">목록 가기</a>
            
            <c:if test="${ not empty loginUser and loginUser.userId eq n.noticeWriter }">
	            <a href="updateForm.no?num=${ n.noticeNo }" class="btn btn-sm btn-warning">수정 하기</a>
	            <a href="deleteForm.no?num=${ n.noticeNo }" class="btn btn-sm btn-danger">삭제 하기</a>

            </c:if>
        </div>

    </div>

</body>
</html>