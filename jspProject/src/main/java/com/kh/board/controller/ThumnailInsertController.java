package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ThumnailInsertController
 */
@WebServlet("/insert.th")
public class ThumnailInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumnailInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1_1. 전송용량 제한
			int maxSize = 10*1024*1024;
			
			// 1_2. 저장시킬 폴더의 물리적 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/thumnail_upfiles/");
			
			// 2. 전달된 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			// 3_1 db에 기록할 값 뽑기
				// Board Insert
				
			Board b = new Board();
			b.setBoardWriter(multiRequest.getParameter("userNo"));
			b.setBoardTitle(multiRequest.getParameter("title"));
			b.setBoardContent(multiRequest.getParameter("content"));
			
			
			// 3_2. attatchment에 insert할 데이터 뽑기
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			
			for(int i=1; i<5; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					// 첨부파일이 존재할 경우
					// Attachment 생성 + 원본명, 수정명, 폴더경로, 파일레벨 담아 list에 담기
					
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/thumnail_upfiles/");
					
					if(i == 1) {
						// 대표이미지
						at.setFileLevel(1);
					}else {
						// 상세이미지
						at.setFileLevel(2);
					}
					
					list.add(at);
				}
			}
			
			int result = new BoardService().insertThumnailBoard(b, list);
			
			if(result > 0) {
				// 성공 /jsp.list.th url 재요청 -> 목록페이지
				request.getSession().setAttribute("alertMsg", "게시글 등록 성공!");
				response.sendRedirect(request.getContextPath()+ "/list.th");
				
			}else { // 실패
				
			
				
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
