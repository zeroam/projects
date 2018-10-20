package kr.co.webpage.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class DBConfig {

	//데이터 베이스의 주소, 아이디, 비밀번호
	private static final String HOST = "jdbc:mysql://zeroam.iptime.org:3306/myblog";
	private static final String USER = "jcw";
	private static final String PASS = "1234";
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		//1단계 : 드라이버 불러오기
		Class.forName("com.mysql.jdbc.Driver");
		//2단계 : 연결 객체 만들기
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
	
	//연결된 접속 끊기
	public static void close(Connection conn) {
		if(conn != null) try {conn.close();} catch (SQLException e) {}
	}
	public static void close(PreparedStatement psmt) {
		if(psmt != null) try {psmt.close();} catch (SQLException e) {}
	}
	public static void close(Statement stmt) {
		if(stmt != null) try {stmt.close();} catch (SQLException e) {}
	}
	public static void close(ResultSet rs) {
		if(rs != null) try {rs.close();} catch (SQLException e) {}
	}
}
