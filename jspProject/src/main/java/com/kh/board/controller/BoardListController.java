package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ======= 페이징 처리 ========
		int listCount;   // 현재 총 게시글 개수 
		int currentPage; // 현재 페이지 (사용자가 요청한 페이지)
		int pageLimit; 	 // 페이지 하단에 보여질 페이징바의 최대 갯수
		int boardLimit;  // 한 페이지에 보여질 게시글의 최대 갯수
		
		// 위의 4개의 값을 가지고 아래 3개의 값을 구해낼것.
		int maxPage; 	 // 가장 마지막 페이지(== 총 페이지 수)
		int startPage;   // 페이징바의 시작 수
		int endPage; 	 // 페이징바의 끝 수
		
		// *listCount : 총 게시글 갯수
		listCount = new BoardService().selectListCount();
		
		// *currentPage  현재 페이지(사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// *pageLimit : 페이징바의 최대 갯수 
		pageLimit = 10;
		// *boardLimit: 한 페이지에 보여질 게시글의수 
		boardLimit = 10;
		
		/*
		 	maxPage : 제일 마지막 페이지 수 (총 페이지 수)
		 	  ㄴ listCount, boardLimit의 영향을 받음
		 	 	ex) 게시글이 10개씩 보여짐
		 	 	listCount     boardLimit			maxPage
		 	 	   100.0	/	  10	 => 10.0	  10
		 	 	   101.0	/	  10	 => 10.1	  11
		 	 	   110.0	/	  10	 => 11.0	  11
		 	 	
		 	 	ex) 게시글이 5개씩 보여짐
		 	 	listCount     boardLimit			maxPage
		 	 	   10.0	/	  	5		 => 2.0		  2
		 	 	   11.0	/	  	5		 => 2.1	  	  3
		 	 	   14.0	/	  	5	 	 => 2.4	  	  3	
		*/			
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		
		/*
		   startPage: 페이징바의 시작 수
		   
		   pageLimit, currentPage에 영향을 받음.
		   ex) 페이징바의 목록이 10개단위씩. 
		   startPage : 1, 11, 21, ... 
		   			 -> n * pageLimit + 1
		   currentPage		startPage		
		   		1				1		=> 0*pageLimit+1 => n=0
		   		10				1		=> 0*pageLimit+1 => n=0
		   		11				11		=> 1*pageLimit+1 => n=1
		   		15				11		=> 1*pageLimit+1 => n=1
		   		20				11		=> 1*pageLimit+1 => n=1
		   		1~10  n=0
		   		11~20 n=1
		   		21~30 n=2
		   		
		   		currentPage -1 / pageLimit => n
		   		
		   startPage = n 							* pageLimit +1
		   			 = (currentPage -1) / pageLimit * pageLimit +1
		   			 		5				10 
		*/
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		/*
		 	* endPage : 페이징바의 끝 수
		 	
		 	startPage, pageLimit에 영향을 받음. (단, maxpage에도 영향을 받음)
		 	
		 	ex) pageLimit : 10
		 	startpage 1  => endPage: 10
		 	startpage 11 => endPage: 20
		 	startpage 21 => endPage: 30
		 	
		*/
		
		endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage); 
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
