<%@page import="kr.co.jboard1.vo.ConnectDataBase"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	
	String[] vars = new String[10];

	vars[0] = request.getParameter("id");
	vars[1] = request.getParameter("pw1");
	vars[2] = request.getParameter("name");
	vars[3] = request.getParameter("nick");
	vars[4] = request.getParameter("email");
	vars[5] = request.getParameter("hp");
	vars[6] = request.getParameter("zip");
	vars[7] = request.getParameter("addr1");
	vars[8] = request.getParameter("addr2");
	vars[9] = request.getRemoteAddr();

	ConnectDataBase conn = new ConnectDataBase();
	
	try {

		//3단계
		String sql = "INSERT INTO JB_MEMBER (uid, pass, name, nick, email, hp, zip, addr1, addr2, regip, rdate) " + 
					 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW());";
					 
		conn.executeUpdate(sql, vars);
		//5단계
	} catch(Exception e) {
		out.println(e.getMessage());
		e.printStackTrace();
	} finally {
		//6단계
		if(conn != null) try { conn.close(); } catch(Exception e) {}
	}
	
	//로그인페이지 이동
	response.sendRedirect("../login.jsp?reg=success");
%>