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
            height: 500;
            margin: auto;
            margin-top: 50px;
        }
        
        .list-area{
            border: 2px solid white;
            text-align: center;

        }


    </style>

</head>
<body>

<%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <br>
        <h2 align="center">일반 게시판</h2>
        <br>

        <!--로그인한 회원만 보여지는 div-->
        <div align="right" style="width: 865px;">
            <button>글작성</button>
            <br><br>
        </div>
    
        <table align="center" class="list-area">
            <thead>
                <tr>
                    <th width="70">글 번호</th>
                    <th width="80">카테고리</th>
                    <th width="300">제목</th>
                    <th width="100">작성자</th>
                    <th width="50">조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>

            <tbody>

                <!-- Case1. 게시글 없을 경우 -->
                <td colspan="6">조회된 게시글 없음</td>


                <!-- Case2. 게시글이 있을 경우 -->
                 <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>

                  <tr>
                    <td>102</td>
                    <td>등산</td>
                    <td>등산 고?</td>
                    <td>계정명</td>
                    <td>조회수</td>
                    <td>2020-08-05</td>
                 </tr>
            </tbody>
        </table>
        
        <br><br>
        
        <div class="paging-area" align="center">

            <button>&lt;</button>

            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>6</button>
            <button>7</button>
            <button>8</button>
            <button>9</button>
            <button>10</button>

            <button>&gt;</button>

        </div>


    </div>


</body>
</html>