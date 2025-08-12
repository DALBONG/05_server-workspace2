package com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class JqAjaxController2
 */
@WebServlet("/jqAjax2.do")
public class JqAjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// db요청처리 되었다는 가정하에 응답 데이터 
	
		//ver1. 하나의 문자열(응답데이터)
		/*
		String responseData = "이름 : " + name + ", 나이 : " + age;
		
		response.setContentType("text/html; charset=utf-8");
			// ㄴ> 응답할 데이터에 한글이 있는경우 반드시 인코딩처리 해야 함.
		response.getWriter().print(responseData);
		*/
		
		//ver2. 여러개의 응답데이터
		/*
		response.setContentType("text/html; charset=utf-8");
		
		response.getWriter().print(name);
		response.getWriter().print(age);
		
		*/	// 여러개도 올 수 있으나, 하나의 문자열로 오게 됨.

		/*
		  JSON(JavaScript Object Notation : JS객체 표현법)
		  	- ajax통신시 데이터 전송에 자주 사용하는 포맷중 하나.
		  		> [value, value, value,...]  : JS에서 배열 객체 (JSONArray)
		  		> {key:vlaue, key:value,..}  : JS에서 일반 객체 (JSONObject)
		  	 ㄴ 사용할 시, 라이브러리 필요 (http://code.google.com/archive/p/json-simple/downloads)
		
		*/
		/*
		JSONArray jArr = new JSONArray();
		jArr.add(name); //["이름"]
		jArr.add(age); // ["이름", 나이]
		
		//response.setContentType("text/html; charset=utf-8"); 
			// -> 문자열로 반환함 json데이터를 응답하려면 application/json
		response.setContentType("application/json; charset=utf-8");

		response.getWriter().print(jArr);
		*/
		
		
		JSONObject jobj = new JSONObject(); // {} 현재, 객체형태로 비워져있음.
		jobj.put("name", name); // {name : "name"}
		jobj.put("age", age); // {name : "name", age : "age"} -> 순서는 랜덤으로 출력
		
		response.setContentType("application/json; charset=utf-8");
		
		response.getWriter().print(jobj);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
