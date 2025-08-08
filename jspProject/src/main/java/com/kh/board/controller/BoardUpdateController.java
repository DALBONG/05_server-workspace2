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
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//사용자가 요청한 리퀘스트에 멀티파트가 있는지 확인
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//1_1. 전달되는 파일 용량 제한 int maxSize
			int maxSize = 10*1024*1024;
			
			//1_2. 전달되는 파일을 저장시킬 서버 폴더의 경로 String savePath
				//리퀘스트를 통해 세션을 데려오고, 세션을 통해 애플리케이션을 데려옴 
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			
			//2. 전달된 파일명 수정 작업 후 서버에 업로드
				// 자료형 httpserveletRequest의 객체인 request를  -> Multirequest로 변환
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			//3. 본격적으로 sql문 실행할 때 필요한 값 뽑아 vo에 기록
				// 공통적 수행 : UPDATE BOARD
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			
			// 객체안에 사용할 값들 담기
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setCategory(category);
			b.setBoardTitle(boardTitle);
			b.setBoardContent(boardContent);
			
			Attachment at = null; 
				// 처음에는 null로 초기화 후 넘어온 새 파일이 있을경우 그때 생성
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// 새로넘어온 첨부파일이 있을 경우 -> at생성
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile")); // multi의 원본파일 명 가져오는 메소드
				at.setChangeName(multiRequest.getFilesystemName("upfile")); // multi의 바뀐 파일명 가져오는 메소드
				at.setFilePath("resources/board_upfiles/");
		
				if(multiRequest.getParameter("originFileNo") != null) {
				// 기존의 첨부파일이 있었을 경우 -> update attachment(기존의 파일번호 필요)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {
					// 기존의 첨부파일이 없을 경우  -> insert attachment(현재 게시글번호 필요)
					at.setRefBoardNo(boardNo);
				}

			
			}
				// 새로 넘어온 첨부파일이 없었다면 at는 여전히 null
				int result = new BoardService().updateBoard(b, at);
					// 첨부파일 x 		       -> b == b , at == null  				 --> Board Update
					// 첨부파일 o, 기존 파일 o  -> b == b , at == fileNo가 담긴 at 		 --> Board Update, AttachmentUpdate
					// 첨부파일 o, 기존의 파일 x -> b == b , at == refBoardNo가 담긴 at  --> Board Update, AttachmentInsert
		
				if(result > 0) { //성공 -> alert성공적 수정 -> 기존에 본 상세메시지
					request.getSession().setAttribute("alertMsg", "성공적으로 수정했음");
					response.sendRedirect(request.getContextPath() + "/detail.bo?bno=" + b.getBoardNo());
				}else { // 실패 -> 에러페이지
					request.getSession().setAttribute("errorMsg", "수정 실패!");
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
