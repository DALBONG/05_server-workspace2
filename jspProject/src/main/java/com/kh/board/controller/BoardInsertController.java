package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setCharacterEncoding("utf-8");
			
			// 멀티part/form-data 방식으로 전송하는 경우 request로 부터 값 뽑기 불가.
					//String boardTitle = request.getParameter("title");
					//String category = request.getParameter("category");
			
			// enctype이 multipart/form-data로 잘 전송되었을 경우 전반적 내용 수행
			if(ServletFileUpload.isMultipartContent(request)){
				// 파일 업로드를 위한 라이브러리 : cos.jar(com.oreilly.servlet의 약자)
								
			// 1. 전달되는 파일을 처리할 작업 내용((전달되는 파일의 용량제한, 전달된 파일을 저장시킬 폴더 경로))
				//1_1) 전달되는 파일의 용량 제한(int maxSize(byte단위) = 10mbyte로 제한)
						/*
						  byte -> Kbyte -> Mbyte -> Gbyte -> Tbyte
						  
						 	1Kbyte == 1024byte
						 	1Mbyte == 1024Kbyte == 1024*1024byte
						*/
			int maxSize = 10*1024*1024;
			
				//1_2) 전달된 파일을 저장시킬 폴더의 경로 알아내기
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			// 2. 전달된 파일의 이름 수정 및 서버에 업로드 작업 
						/*
						   HttpServletRequest request
						     => MultipartRequest multirequest로 변환
						     위 구문 한 줄 실행만으로 넘어온 첨부파일이 해당 폴더에 무조건 업로드 됨
						       단, 업로드시 파일면은 수정해주는게 일반적, 해서 파일명 수정시켜주는 객체 제시해야 함.
						     => 같은 파일명이 존재할 경우 덮어씌울 수 있고, 한글/특문/띄어쓰기가 포함될 경우 서버에 따라 문제 발생 
						     
						     기본적으로 파일명이 안겹치도록 수정작업해주는 객체 있음
						     -> DefaultFileRenamePolicy 객체 (cos.jar에서 제공)
						     -> 내부적으로  해당 클래스에 rename()메소드가 실행되면서 파일명 수정 
						     
						     rename(원본파일){
						     	기존에 동일한 파일명이 존재할 경우 
						     	파일명 뒤에 카운팅된 숫자를 붙여줌
						     	ex) aaa.jpg, aaa1.jpg
						     return 수정파일 
						     }
						     
						     나만의 방식으로 절대 겹치지 않도록 rename할 수 있게 FileRenamePolicy 클래스 만들기.(rename 메소드 재 정의)
						 	 com.kh.common.MyFileRenamePolicy 클래스
						     
						*/
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			// 3. DB에 기록할 데이터를 뽑아 vo에 담기. 
				// -> 카테고리번호, 제목, 내용, 작성자 회원번호 뽑아 Board테이블에
			  	// -> 넘어온 첨부파일이 있다면 원본명, 수정명, 저장폴더 경로 Attachment 테이블 insert 
			
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String boardWriter = multiRequest.getParameter("userNo");
			
			Board b = new Board();
			b.setCategory(category);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			b.setBoardWriter(boardWriter);
			
			Attachment at = null;
			
			// multirequest.getOriginalFileName("키") : 넘어온 첨부파일 있을 경우 "원본명" | 없었을 경우 null 리턴
			if(multiRequest.getOriginalFileName("upfile") != null) { //넘어온 첨부파일이 있다면 
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/board_upfiles/");
				
			}
			
			
			// 4. 서비스 요청(요청처리)
			
			int result = new BoardService().insertBoard(b, at);
			
			// 5. 응답뷰 지정
				// 성공 -> /jsp/list.bo?cpage=1 url재요청! alert
				// 실패 => 에러페이지  
			
				if(result > 0) { // 성공
					request.getSession().setAttribute("alertMsg", "등록 성공!");
					response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
				}else {
					request.setAttribute("errorMsg", "등록실패!");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
					
				
			}
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
