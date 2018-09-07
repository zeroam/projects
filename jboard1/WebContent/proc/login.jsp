<%@page import="kr.co.jboard1.vo.ConnectDataBase"%>
<%@page import="kr.co.jboard1.vo.MemberVO"%>
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

	ConnectDataBase conn = null;
	
	try {
		String sql = "SELECT * FROM JB_MEMBER WHERE uid='" + id + "' AND pass='" + pw + "';";
		conn = new ConnectDataBase();
		ResultSet rs = conn.executeQuery(sql);

		//5단계
		if (rs.next()) {
			//입력한 아이디와 비밀번호에 해당하는 회원이 있는 경우
			MemberVO ur = MemberVO.initMemberVO(rs);

			//세션 저장 - Member 클래스의 user 객체를 세션에 저장
			session.setAttribute("user", ur);
			//게시판 리스트 이동
			response.sendRedirect("../list.jsp");
		} else {
			//일치하는 회원이 없을 경우
			//로그인 페이지 이동
			response.sendRedirect("../login.jsp?reg=fail");
		}
	} catch (Exception e) {
		out.println(e.getMessage());
		e.printStackTrace();
	} finally {
		//6단계
		if(conn != null) conn.close();
	}
%>