<%@page import="kr.co.jboard1.ConnectDataBase"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	
	String host = "jdbc:mysql://192.168.0.178:3306/jcw";
	String user = "jcw";
	String pass = "1234";
	
	String sql = "DELETE FROM JB_BOARD WHERE seq='"+seq+"';";
	
	ConnectDataBase conn = null;
	
	try {
		conn = new ConnectDataBase(host, user, pass);
		conn.executeUpdate(sql);
	} catch(Exception e) {
		out.println(e.getMessage());
		e.printStackTrace();
	} finally{
		if(conn != null) conn.close();
	}
	
	//리스트 페이지로 이동
	response.sendRedirect("../list.jsp");
%>