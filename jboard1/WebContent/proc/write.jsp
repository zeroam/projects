<%@page import="kr.co.jboard1.vo.BoardVO"%>
<%@page import="kr.co.jboard1.dao.BoardDAO"%>
<%@page import="kr.co.jboard1.dao.SQL"%>
<%@page import="kr.co.jboard1.vo.ConnectDataBase"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("subject");
	String content = request.getParameter("content");
	String uid = request.getParameter("uid");
	String regip = request.getRemoteAddr();
	
	/*
	BoardVO vo = new BoardVO();
	vo.setCate("notice");
	vo.setTitle(title);
	vo.setContent(content);
	vo.setUid(uid);
	vo.setRegip(request.getRemoteAddr());
	*/
	
	String[] vars = new String[4];
	vars[0] = title;
	vars[1] = content;
	vars[2] = uid;
	vars[3] = regip;
			

	//글쓰기
	BoardDAO dao = BoardDAO.getInstance();
	dao.write(vars);

	//리스트 페이지 이동
	response.sendRedirect("../list.jsp");
%>