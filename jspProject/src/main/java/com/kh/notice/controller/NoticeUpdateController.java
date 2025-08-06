package com.kh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int noticeNo = Integer.parseInt(request.getParameter("num"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("content");
		
		Notice n = new Notice();
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) { // 성공 -> 상세페이지, /jsp/detail.no?num=현재 글 번호
			// 세션 
			request.getSession().setAttribute("alertMsg", "공지 수정 성공!");
			response.sendRedirect(request.getContextPath()+"/detail.no?num=" + noticeNo);
			
		}else { // 실패 
			request.getSession().setAttribute("errorMsg", "공지 수정 실패!");
			response.sendRedirect(request.getContextPath()+"/updateForm.no?num"+ noticeNo);
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
