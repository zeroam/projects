package kr.co.jboard1.vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDataBase {

	//DB 접속 정보
	private static final String HOST = "jdbc:mysql://192.168.0.178:3306/jcw";
	private static final String USER = "jcw";
	private static final String PASS = "1234";
	
	
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private int num = -1;
	
	public ConnectDataBase() throws SQLException,ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(HOST, USER, PASS);
	}
	
	public ResultSet executeQuery(String sql) throws SQLException {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		return rs;
	}
	
	public ResultSet executeQuery(String sql, int var) throws SQLException {
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, var);
		rs = psmt.executeQuery();
		return rs;
	}
	
	public ResultSet executeQuery(String sql, String[] vars) throws SQLException {
		psmt = conn.prepareStatement(sql);
		int i = 1;
		for(String var : vars) {
			psmt.setString(i, var);
			i++;
		}
		rs = psmt.executeQuery(sql);
		return rs;
	}
	
	
	public int executeUpdate(String sql) throws SQLException {
		stmt = conn.createStatement();
		num = stmt.executeUpdate(sql);
		return num;
	}
	
	
	public int executeUpdate(String sql, String[] vars) throws SQLException {
		psmt = conn.prepareStatement(sql);
		int i = 1;
		for(String var : vars) {
			psmt.setString(i, var);
			i++;
		}
		num = psmt.executeUpdate();
		return num;
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(psmt != null) psmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
}
