package kr.co.jboard2.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

public class DBConfig {

	private static final String HOST = "jdbc:mysql://192.168.0.23:3306/jcw";
	private static final String USER = "jcw";
	private static final String PASS = "1234";
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		//2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
	
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
