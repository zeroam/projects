<%@page import="kr.co.jboard1.ConnectDataBase"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("subject");
	String content = request.getParameter("content");
	String uid = request.getParameter("uid");
	String regip = request.getRemoteAddr();
	
	String host = "jdbc:mysql://192.168.0.178:3306/jcw";
	String user = "jcw";
	String pass = "1234";
	
	String	sql	= "INSERT INTO JB_BOARD SET ";
			sql	+= "cate='notice', title=?, contents=?, ";
			sql += "uid=?, regip=?, rdate=NOW();";
	
	String[] vars = new String[4];
	vars[0] = title;
	vars[1] = content;
	vars[2] = uid;
	vars[3] = regip;
			
	//1단계
	//2단계
	//3단계
	//4단계
	try {
		ConnectDataBase conn = new ConnectDataBase(host, user, pass);
		conn.executeUpdate(sql, vars);
	
	} catch(Exception e) {
		out.print(e.getMessage());
	}
	//5단계
	//6단계

	//리스트 페이지 이동
	response.sendRedirect("../list.jsp");
%>