package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		int result = new MemberService().MemberDelete(userId, userPwd);
		
		System.out.println(userPwd);
		System.out.println(userId);
		HttpSession session = request.getSession();
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수고했네"); //띄울 메시지
			session.removeAttribute("loginUser");  // 띄울 화면
			response.sendRedirect(request.getContextPath() + "/login.me");
		}else {
			session.setAttribute("alertMsg", "탈퇴 실패, 들어올댄 마음대로지만 나갈땐 아니란다");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
