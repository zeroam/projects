package kr.co.jboard1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectDataBase {

	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private int num = -1;
	
	public ConnectDataBase(String host, String user, String pass) throws SQLException,ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		this.conn = DriverManager.getConnection(host, user, pass);
	}
	
	public ResultSet executeQuery(String sql) throws SQLException {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		return rs;
	}
	
	public ResultSet executeQuery(String sql, String[] vars) throws SQLException {
		psmt = conn.prepareStatement(sql);
		int i = 1;
		for(String var : vars) {
			psmt.setString(i, var);
			i++;
		}
		rs = stmt.executeQuery(sql);
		return rs;
	}
	
	
	public int executeUpdate(String sql) throws SQLException {
		psmt = conn.prepareStatement(sql);
		num = psmt.executeUpdate();
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
