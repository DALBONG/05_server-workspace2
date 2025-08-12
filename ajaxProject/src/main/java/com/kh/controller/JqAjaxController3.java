package com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.model.vo.Member;

/**
 * Servlet implementation class JqAjaxController3
 */
@WebServlet("/jqAjax3.do")
public class JqAjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("no"));
		//Member m = new MemberService().selectMember() 했다 치고
		
			// 멤버객체의 각 필드의 조회된 데이터들이 담겨있다 치고.
		Member m = new Member(1, "차온우", 31, "남");
	
		//response.getWriter().print(m/*.toString()*/); 
			// vo.객체를 바로 응답시 .toString()의 문자열로 응답
	
		// JSONObject 활용 {key:value, key:value,...}
		/*
		JSONObject jobj = new JSONObject();
	
		jobj.put("userNo", m.getUserNo());
		jobj.put("userName", m.getUserName());
		jobj.put("age", m.getAge());
		jobj.put("gender", m.getGender());
	
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
		*/
		
		//위의 과정을 알아서 해주는 GSON 라이브러리.
		response.setContentType("application/json; charset=utf-8");

		Gson gson = new Gson(); // Gson객체.toJson(응답할 자바객체, 응답할 스트림);
		
		gson.toJson(m, response.getWriter());
		
		// Gson 이용해서 vo객체 하나만 응답시, JSONObject {key:val, key:val}형태로 알아서 만들어서 응답
				// vo객체의 필드명을 보고 key값을 알아서 세팅해줌
		
		// java배열 또는 arrayList 응답시 jsonArray[value, value,..] 형태로 응답
		
		
		
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
