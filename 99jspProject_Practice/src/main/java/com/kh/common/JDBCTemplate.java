package com.kh.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		
		// 사용할 객체 생성 
		Connection conn = getConnection();
		Properties prop = new Properties();
		
		String filePath = JDBCTemplate.class.getResource("/db/driver.properties").getPath();
											 // 파일의 경로를 가져오는 메서드
				try {
					prop.load(new FileInputStream(filePath));
								  //파일의 내용을 가져오는 메서드 
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
					// jdbc 드라이버 등록
					Class.forName(prop.getProperty("driver"));
					// 템플릿에 작성한 db의 url, 계정명, 비번을 가져와 담은 객체 생성
					try {
						//드라이버의 정보를 가져오는 메서드 
						conn = DriverManager.getConnection(prop.getProperty("url")
														 , prop.getProperty("username")
														 , prop.getProperty("password"));
						
						//오라클에서 실행하는 자동 커밋 기능 꺼주기
						conn.setAutoCommit(false);
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				
				}
				// conn 반환
				return conn;
		
	}

}
