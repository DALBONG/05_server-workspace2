package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 전달 값에 한글이 있을 경우 인코딩 처리 해야 함(post 방식일 경우)
			// request.setCharacterEncoding("utf-8");
	
		// 2) 요청시 전달값 뽑아 변수 또는 객체에 기록 
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
	
	
		// 3) 요청처리 (db에 sql문 실행) -> 해당 요청 처리하는 서비스 클래스의 메소드 호출 및 결과 받기
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		
		// 4) 처리결과를 가지고 사용자가 보게될 응답 뷰(jsp) 지정 후 포워딩 또는 url 재요청
		/*
		  **응답페이지에 전달할 값이 있을 경우 어딘가에 담아야 함.
		    (담을 수 있는 영역(scope) == jsp 내장 객체)
		  1) application : 담긴 데이터는 "웹 애플리케이션 전역"에서 다 꺼내 쓸 수 있음.
		  2) session : 담긴 데이터는 내가 지우기 전 까지나, 
		  			   세션이 만료(서버 멈춤 or 브라우저 종료)되기 전까지 
		  			   "어떤 jsp든, servlet"이든 꺼내 쓸 수 있음. 
		  3) request : 담긴 데이터는 현재 request 객체를 "포워딩한 응답 jsp에서만" 꺼내 쓸 수 있음(일회성)
		  4) page : 해당 jsp에서 담고, 그 jsp에서만 꺼내 쓸 수 있음
		  
		  공통적으로 데이터를 담을 때 .setAttribute("키", 밸류)
		  		  데이터를 꺼낼 때 .getAttribute("키") : object 타입으로 밸류 반환하기에 형변환
		  		  데이터를 지울 때 .removeAttribute("키")
		  
		 */
		
		if(loginUser == null) {
			// 조회 결과 없음 == 로그인 실패 -> 에러페이지(jsp) 응답
			request.setAttribute("errorMsg", "로그인 실패");
			//응답페이지(jsp) 포워딩
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}else {
			// 결과 있음 == 로그인 성공 -> 메인화면(index.jsp) 응답
				// 메인화면 내에서 다른 페이지로 넘어가도 로그인이 유지되어야 함.(session 활용)
			// 로그인한 회원정보(loginUser)를 session에 담기
			// 서블릿에서 session에 접근하고자 한다면 우선 객체를 얻어와야 함.
			HttpSession session =  request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			// 1. 포워딩 방식 응답뷰 출력 (index화면으로 포워딩)
				// -> 선택된 jsp가 보여질 뿐, url에는 현재 서블릿 매핑값이 남아있음 (jsp/login.me)
				// RequestDispatcher view = request.getRequestDispatcher("index.jsp");
				// view.forward(request, response);
			
			// 2. url 재용청 방식 (기존 페이지를 응답하는 url이 존재한다면 사용 가능) 
				  // localhost:8001/jps
			response.sendRedirect(request.getContextPath());
			
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
