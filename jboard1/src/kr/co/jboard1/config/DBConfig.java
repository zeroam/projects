package kr.co.jboard1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	//DB ���� ����
	private static final String HOST = "jdbc:mysql://192.168.0.178:3306/jcw";
	private static final String USER = "jcw";
	private static final String PASS = "1234";
	
	
	public static Connection getConnect() throws Exception {
		//1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		//2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}
