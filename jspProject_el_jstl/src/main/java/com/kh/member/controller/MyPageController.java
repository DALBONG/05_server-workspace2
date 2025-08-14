package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/myPage.me")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyPageController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 로그인 전에 url 쳐서 직접 요청도 가능하긴 하지만
		// 로그인 전 요청시 => 메인페이지 응답, alert 띄우기
		// 로그인 후 요청시 => 마이페이지 응답
		/*
		if(세션에 로그인유저가 없는 경우) {
			
		}else {
			
		}
		*/
		
		HttpSession session = request.getSession();
		
		// if문은 그냥 이런게 있다고 알고있기(getRequestDispatcher이것만해도됨)
		if(session.getAttribute("loginUser") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스");
			response.sendRedirect(request.getContextPath());
		}else {
		
		request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		// view에 띄우기 위한 getRequestDispatcher
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
