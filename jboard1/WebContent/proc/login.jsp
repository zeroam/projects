<%@page import="kr.co.jboard1.ConnectDataBase"%>
<%@page import="kr.co.jboard1.Member"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	/*
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	*/
	
	try {
		/*
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
			
		
		//2단계
		String host = "jdbc:mysql://192.168.0.178:3306/jcw";
		String user = "jcw";
		String pass = "1234";
		/*
		String sql = "SELECT * FROM JB_MEMBER WHERE uid='"+id+"' AND pass='"+pw+"';";
		
		conn = DriverManager.getConnection(host, user, pass);
		
		//3단계
		stmt = conn.createStatement();
		
		//4단계
		rs = stmt.executeQuery(sql);
		*/
		String host = "jdbc:mysql://192.168.0.178:3306/jcw";
		String user = "jcw";
		String pass = "1234";
		
		String sql = "SELECT * FROM JB_MEMBER WHERE uid='"+id+"' AND pass='"+pw+"';";
		ConnectDataBase conn = new ConnectDataBase(host, user, pass);
		ResultSet rs = conn.executeQuery(sql);
		
		//5단계
		if(rs.next()) {
			//입력한 아이디와 비밀번호에 해당하는 회원이 있는 경우
			Member ur = new Member();
			ur.setSeq(rs.getInt(1));
			ur.setUid(rs.getString(2));
			ur.setPass(rs.getString(3));
			ur.setName(rs.getString(4));
			ur.setNick(rs.getString(5));
			ur.setEmail(rs.getString(6));
			ur.setHp(rs.getString(7));
			ur.setGrade(rs.getInt(8));
			ur.setZip(rs.getString(9));
			ur.setAddr1(rs.getString(10));
			ur.setAddr2(rs.getString(11));
			ur.setRegip(rs.getString(12));
			ur.setRdate(rs.getString(13));
			
			
			//세션 저장 - Member 클래스의 user 객체를 세션에 저장
			session.setAttribute("user", ur);
			//게시판 리스트 이동
			response.sendRedirect("../list.jsp");
		} else {
			//일치하는 회원이 없을 경우
			//로그인 페이지 이동
			response.sendRedirect("../login.jsp?reg=fail");
		}
		
	} catch(Exception e) {
		out.println(e.getMessage());
		e.printStackTrace();
	} finally {
		//6단계
		/*
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
		*/
	}
	
%>