<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw1 = request.getParameter("pw1");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();

	//드라이버 준비
	Connection conn = null;
	PreparedStatement psmt = null;
	
	
	try {
		//1단계
		Class.forName("com.mysql.jdbc.Driver"); 
	
		//2단계
		String host = "jdbc:mysql://192.168.0.178:3306/jcw";
		String user = "jcw";
		String pass = "1234";
		
		conn = DriverManager.getConnection(host, user, pass);
		
		//3단계
		String sql = "INSERT INTO JB_MEMBER (uid, pass, name, nick, email, hp, zip, addr1, addr2, regip, rdate) " + 
					 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW());";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pw1);
		psmt.setString(3, name);
		psmt.setString(4, nick);
		psmt.setString(5, email);
		psmt.setString(6, hp);
		psmt.setString(7, zip);
		psmt.setString(8, addr1);
		psmt.setString(9, addr2);
		psmt.setString(10, regip);
		
		//4단계
		psmt.executeUpdate();
		//5단계
	} catch(Exception e) {
		out.println(e.getMessage());
		e.printStackTrace();
	} finally {
		//6단계
		if(psmt != null) try { psmt.close(); } catch(Exception e) {}
		if(conn != null) try { psmt.close(); } catch(Exception e) {}
	}
	
	//로그인페이지 이동
	response.sendRedirect("../login.jsp?reg=success");
%>