package com.kh.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	
	// 1. Connection 객체 생성후 해당 Connection객체를 반환시켜주는 getConnection메소드
	public static Connection getConnection() {
		
		Connection conn = null;
		Properties prop = new Properties();// 맵계열 컬렉션(k-v)
		
		String filePath = JDBCTemplate.class.getResource("/db/driver.properties").getPath();
		// "C://05_server-workspace2/jspProject/WebContent/WEB-INF/classes/db/driver.properties
		
		
		try {
			prop.load(new FileInputStream(filePath));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		// jdbc 드라이버 등록
		try {
			Class.forName(prop.getProperty("driver"));
			
			// 접속하고자 하는 db의 url 계정명, 비번 제시해서 connection 객체 생성
			conn = DriverManager.getConnection(prop.getProperty("url")
											 , prop.getProperty("username")
											 , prop.getProperty("password"));
			
			conn.setAutoCommit(false);//오라클에서 실행하는 자동 커밋 기능을 꺼주는 것.
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 2_1. Connection 객체 전달 받아 commit시켜주는 메소드
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 2_2. Connection 객체 전달 받아 rollback 시켜주는 메소드
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
			conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3_1. Connection 객체 전달 받아 반납시켜주는 close 메소드
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3_2. Statement 객체 전달 받아 반납시켜주는 close 메소드
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed())
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	// 3_3. resultSet 객체 전달 받아 반납시켜주는 close 메소드
	public static void close (ResultSet rset) {
		try {
			if(rset != null && rset.isClosed())
			rset.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
