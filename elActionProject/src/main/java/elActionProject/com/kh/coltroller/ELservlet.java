package elActionProject.com.kh.coltroller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import elActionProject.com.kh.model.vo.Person;

/**
 * Servlet implementation class ELservlet
 */
@WebServlet("/el.do")
public class ELservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 데이터 담을 수 있는 jsp의 내장 객체 종류.
		 
		 1. ServletContext (application Scope)
		 	: 한 앱당 단 1개 존재하는 객체 
		 	- 이 영역에 데이터 담을시 앱 전역에서 사용가능
		 	- 공유범위가 가장 큼(jsp/ servlet/ java)
		 
		 2. HttpSession(session Scope)
		 	: 한 브라우저당 1개 존재하는 객체
		 	- jsp/servlet 단에서 사용 가능 (범위가 다소 제한적)
		 	
		 3. HttpServlet(request Scope)
		  	: 요청때마다 매번 생성되는 객체
		  	- request객체를 포워딩 받는 응답 jsp에서만 사용 가능
		  	- 공유범위가 응답 jsp뿐
		  	
		 4. pageContext(page Scope)
		 	: jsp마다 존재하는 객체
		 	- 공유범위가 가장 작음(해당 페이지)
		 	
		 	위의 4개 객체들에 
		 	데이터 담을 시, .setAttribute("키", 담을 데이터);
		 	데이터 꺼낼 씨, .getAttribute("키" : 담겨있는 데이터);
		 	데이터 삭제시, .removeAttribute("키")
		 	
		*/
		
		request.setAttribute("classRooom", "H강의장");
		request.setAttribute("student", new Person("나훈후", 23, "남"));
		
		HttpSession session = request.getSession();
		session.setAttribute("academy", "kh정보교육원");
		session.setAttribute("teacher", new Person("김시연", 21, "여자"));
	
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		//app scope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		request.getRequestDispatcher("views/1_EL/01_el.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
