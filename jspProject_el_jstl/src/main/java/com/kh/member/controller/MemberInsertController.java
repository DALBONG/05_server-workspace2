package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 인코딩 작업
		request.setCharacterEncoding("utf-8");
		
		// 2) 요청시 전달값 뽑아 변수 및 객체에 기록.
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone"); 
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String[] interestArr = request.getParameterValues("interest");
				// String[] -> String  /  ["운동","등산"] -> "운동, 등산"
		String interest = "";
		if(interestArr != null) {
			interest = String.join(",", interestArr);
		}
		
		// 3) 요청처리 (서비스에 메소드 호출 및 결과 받기)
			// 3_1) 기본 생성자로 생성 후, set메소드통해 담기
			// 3_2) 매개변수 생성자 이용해서 생성과 동시에 담기
		Member m = new Member(userId, userPwd, userName, phone, email, address, interest);
		
		int result  =  new MemberService().insertMember(m);
		
		if(result > 0) {
			// 성공 -> 메인 화면 (/jsp url 재요청) : index 페이지 
			
			HttpSession session =  request.getSession();
			session.setAttribute("alertMsg", "어서와!");
			
			response.sendRedirect(request.getContextPath());
				// -> url재요청ㅡ, request X 
			
		}else {
			// 실패 -> 에러페이지
			request.setAttribute("errorMsg", "회원가입 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		// 4) 처리결과를 사용자가 보게될 응답뷰 지정 후 포워딩 or url재요청
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
