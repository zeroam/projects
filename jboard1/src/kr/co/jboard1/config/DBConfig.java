package kr.co.jboard1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	//DB 접속 정보
	private static final String HOST = "jdbc:mysql://192.168.0.178:3306/jcw";
	private static final String USER = "jcw";
	private static final String PASS = "1234";
	
	
	public static Connection getConnect() throws Exception {
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		//2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}
